#include <Arduino.h>
#include <Wire.h>
#include <ss_oled.h>
#include <Adafruit_MLX90614.h>
#include <Adafruit_VL6180X.h>
#include <EEPROM.h>

// ================== FORWARD DECLARATIONS ==================
void triggerReady();
float estimateLiquidTemp(float rawBottomTemp, float ambientTemp);
void handleEncoder();
void encoderClick();
void adjustTime(int d);
void adjustTemp(int d);
void checkDisplayUpdate();
void drawScreenContent();
void formatTime(long sec, char* buf);
void beep(int f, int d);
void loadSettings();
void saveSettings();
float measureDistance();
void startBrewing();
long remaining();
void finishBrewing();
void wakeDisplay(); // <--- DODANO

// ================== KALIBRACJA - AUTO-ADAPTACYJNA ==================
// Próg temperatury ochrony czujnika
#define SAFETY_TEMP_THRESHOLD 45.0

// ================== OLED ss_oled ==================
SSOLED ssoled;
#define OLED_ADDR 0x3C
#define SDA_PIN D2
#define SCL_PIN D1

// ================== PINY ==================
#define ENC_S1 D5
#define ENC_S2 D6
#define ENC_KEY D7
#define BUZZER_PIN D0

#define MAX_DISTANCE 50
#define MIN_TIME 0
#define MAX_TIME 600
#define DEFAULT_TIME 180
#define MIN_TEMP 0
#define MAX_TEMP 100
#define DEFAULT_TEMP 55

#define EEPROM_SIZE 64
#define ADDR_TIME 0
#define ADDR_TEMP 10

Adafruit_MLX90614 mlx = Adafruit_MLX90614();
Adafruit_VL6180X vl = Adafruit_VL6180X();

// ================== ZMIENNE ==================
unsigned long brewDuration;
unsigned long brewStartTime;
unsigned long timeSet = DEFAULT_TIME;
float tempThreshold = DEFAULT_TEMP;

enum State {
  WAIT_CUP,
  MENU_TIME,
  MENU_TEMP,
  BREWING,
  DONE,
  READY_TO_DRINK
};
State state = WAIT_CUP;
State lastDrawnState = (State)-1;

unsigned long lastDistanceCheck = 0;
unsigned long lastTempUpdate = 0;
bool cupDetected = false;
bool lastCupDetected = false;
float currentTemp = 0.0;
float rawBottomTemp = 0.0;
bool tempWarningShown = false;
float peakTemp = 0.0;

// --- AUTO-KALIBRACJA ---
float fixedAmbient = 22.0;          // Snapshot temp otoczenia
float peakBottomTemp = 0.0;         // Peak temp dna (do kalibracji)
unsigned long calibrationTime = 0;  // Kiedy wykryto peak

// Alarm
unsigned long lastReadyBeepTime = 0;

// Śledzenie temperatury
float lastStableTemp = 0.0;
unsigned long stableTempSince = 0;
const unsigned long STABLE_TIMEOUT = 60000;

// ================== WYGASZANIE EKRANU (DODANO) ==================
unsigned long lastActivityTime = 0;
bool isDisplayAwake = true;
const unsigned long SLEEP_TIMEOUT = 300000; // 5 minut w milisekundach (5 * 60 * 1000)

// ================== ZMIENNE ENKODERA Z PRZERWANIAMI I QUADRATURE ==================
volatile int encoderPosition = 0;
volatile int lastEncoded = 0;

unsigned long lastButtonTime = 0;

bool needDisplayUpdate = true;
unsigned long lastDisplayDrawTime = 0;
const int DISPLAY_REFRESH_INTERVAL = 50;

char buffer[20];

// ================== FUNKCJA PRZERWANIA ENKODERA Z QUADRATURE ==================
void IRAM_ATTR handleEncoderInterrupt() {
  int MSB = digitalRead(ENC_S1); // Najbardziej znaczący bit
  int LSB = digitalRead(ENC_S2); // Najmniej znaczący bit

  int encoded = (MSB << 1) | LSB; // Konwersja do liczby
  int sum = (lastEncoded << 2) | encoded; // Dodaj poprzedni stan

  // Tablica stanów quadrature - POPRAWNA DETEKCJA KIERUNKU
  if(sum == 0b1101 || sum == 0b0100 || sum == 0b0010 || sum == 0b1011) {
    encoderPosition++;
  }
  if(sum == 0b1110 || sum == 0b0111 || sum == 0b0001 || sum == 0b1000) {
    encoderPosition--;
  }

  lastEncoded = encoded; // Zapisz aktualny stan
}

// ================== FUNKCJA WYBUDZANIA EKRANU (DODANO) ==================
void wakeDisplay() {
  lastActivityTime = millis(); // Reset timera bezczynności
  if (!isDisplayAwake) {
    isDisplayAwake = true;
    needDisplayUpdate = true;
    lastDrawnState = (State)-1; // Wymusza pełne przerysowanie
  }
}

// ================== TRIGGER READY ==================
void triggerReady() {
  state = READY_TO_DRINK;
  tempWarningShown = true;
  stableTempSince = 0;
  lastStableTemp = 0;
  lastReadyBeepTime = 0;
  wakeDisplay(); // Wybudź ekran gdy gotowe
  needDisplayUpdate = true;
}

// ================== FUNKCJA ESTYMACJI Z AUTO-KALIBRACJĄ ==================
float estimateLiquidTemp(float rawBottomTemp, float ambientTemp) {
  if (isnan(rawBottomTemp) || rawBottomTemp < ambientTemp) {
    return ambientTemp;
  }

  float diff = rawBottomTemp - ambientTemp;
  if (diff < 0) diff = 0;

  float baseFactor = 0.08;
  float adaptiveCoeff;

  // POPRAWIONE PROGI
  if (diff > 51) {
    adaptiveCoeff = baseFactor * 1.0;      // >95°C - dużo dodaj
  } 
  else if (diff > 50) {
    adaptiveCoeff = baseFactor * 0.95;      // 90-95°C
  } 
  else if (diff > 45) {
    adaptiveCoeff = baseFactor * 0.85;      // 80-90°C - tu Twój peak
  }
  else if (diff > 40) {
    adaptiveCoeff = baseFactor * 0.80;     // 70-80°C
  } 
  else if (diff > 30) {
    adaptiveCoeff = baseFactor * 0.75;     // 60-70°C - tutaj teraz jesteś
  } 
  else if (diff > 20) {
    adaptiveCoeff = baseFactor * 0.65;     // 50-60°C
  } 
  else {
    adaptiveCoeff = baseFactor * 0.50;     // <50°C - mało dodaj
  }

  float liquidTemp = rawBottomTemp + (diff * adaptiveCoeff);
  return liquidTemp;
}

// ================== SETUP ==================
void setup() {
  Serial.begin(9600);
  Serial.println("\n=== START ===");

  EEPROM.begin(EEPROM_SIZE);
  loadSettings();

  pinMode(ENC_S1, INPUT);
  pinMode(ENC_S2, INPUT);
  pinMode(ENC_KEY, INPUT);
  pinMode(BUZZER_PIN, OUTPUT);
  
  // Podłącz przerwania do OBUDU pinów enkodera dla pełnej detekcji
  attachInterrupt(digitalPinToInterrupt(ENC_S1), handleEncoderInterrupt, CHANGE);
  attachInterrupt(digitalPinToInterrupt(ENC_S2), handleEncoderInterrupt, CHANGE);
  
  // Inicjalizacja stanu enkodera
  int MSB = digitalRead(ENC_S1);
  int LSB = digitalRead(ENC_S2);
  lastEncoded = (MSB << 1) | LSB;

  Wire.begin(SDA_PIN, SCL_PIN);
  Wire.setClock(100000);

  delay(50);

  int rc = oledInit(&ssoled, OLED_128x64, OLED_ADDR, 1, 0, 1, SDA_PIN, SCL_PIN, -1, 100000L);
  if (rc != OLED_NOT_FOUND) {
    Serial.println("OLED OK");
  }

  oledFill(&ssoled, 0, 1);
  oledWriteString(&ssoled, 0, 0, 2, (char*)"Coaster", FONT_NORMAL, 0, 1);

  delay(200);

  bool mlxOK = mlx.begin();
  Serial.println(mlxOK ? "MLX OK" : "MLX ERROR");

  bool vlOK = vl.begin();
  Serial.println(vlOK ? "VL OK" : "VL ERROR");

  oledFill(&ssoled, 0, 1);
  oledWriteString(&ssoled, 0, 0, 1, (char*)"Sensors:", FONT_NORMAL, 0, 1);
  oledWriteString(&ssoled, 0, 0, 3, mlxOK ? (char*)"MLX: OK" : (char*)"MLX: ERROR", FONT_NORMAL, 0, 1);
  oledWriteString(&ssoled, 0, 0, 5, vlOK ? (char*)"VL: OK" : (char*)"VL: ERROR", FONT_NORMAL, 0, 1);

  delay(1500);

  oledFill(&ssoled, 0, 1);

  needDisplayUpdate = true;
  fixedAmbient = mlx.readAmbientTempC();
  lastActivityTime = millis(); // Inicjalizacja timera ekranu
}

// ================== LOOP ==================
void loop() {
  unsigned long now = millis();
  
  // Enkoder obsługiwany przez przerwania - tylko sprawdzamy czy są zmiany
  handleEncoder();

  // --- LOGIKA USYPIANIA EKRANU ---
  if (isDisplayAwake && (now - lastActivityTime > SLEEP_TIMEOUT)) {
    isDisplayAwake = false;
    oledFill(&ssoled, 0, 1); // Wyczyść ekran do zera (czarny)
  }

  // 1. Sprawdzanie odległości z ochroną termiczną
  if (state != MENU_TIME && state != MENU_TEMP && now - lastDistanceCheck >= 400) {
    lastDistanceCheck = now;

    bool nowCup = false;

    if (currentTemp > SAFETY_TEMP_THRESHOLD) {
      nowCup = true;
    } else {
      float d = measureDistance();
      nowCup = (d > 0 && d <= MAX_DISTANCE);
    }

    if (nowCup != cupDetected) {
      wakeDisplay(); // Wybudź ekran przy zmianie stanu kubka!

      cupDetected = nowCup;

      if (cupDetected && state == WAIT_CUP) {
        // SNAPSHOT temp otoczenia przy postawieniu kubka

        // Jeśli podstawka gorąca, użyj standardowej temp
        if (fixedAmbient > 23.0 || isnan(fixedAmbient)) {
          fixedAmbient = 23.0;
        }

        Serial.print("Kubek postawiony, ambient snapshot: ");
        Serial.print(fixedAmbient);
        Serial.println("C");

        brewDuration = timeSet;
        delay(100);
        startBrewing();
      } else if (!nowCup) {
        // Kubek zdjęty - reset wszystkiego
        peakTemp = 0.0;
        peakBottomTemp = 0.0;
        needDisplayUpdate = true;
        noTone(BUZZER_PIN);

        Serial.println("Kubek zdjety - reset kalibracji");
      }
    }
  }

  // 2. Alarm gotowości
  if (state == READY_TO_DRINK && cupDetected) {
    unsigned long diff = now - lastReadyBeepTime;
    if (diff >= 2000) {
      lastReadyBeepTime = now;
      beep(2000, 500);
    }
  } else if (!cupDetected && state == READY_TO_DRINK) {
    noTone(BUZZER_PIN);
  }

  // 3. Odczyt temperatury i logika
  if (cupDetected && (state == BREWING || state == DONE || state == READY_TO_DRINK)
      && now - lastTempUpdate >= 1000) {
    lastTempUpdate = now;

    rawBottomTemp = mlx.readObjectTempC();

    if (isnan(rawBottomTemp) || rawBottomTemp < 0) rawBottomTemp = 0;

    // Używamy snapshot ambient zamiast bieżącego
    currentTemp = estimateLiquidTemp(rawBottomTemp, fixedAmbient);

    if (currentTemp > peakTemp) peakTemp = currentTemp;

    // Debug info
    if (now % 5000 < 1100) {  // Co ~5 sekund
      Serial.print("Raw: ");
      Serial.print(rawBottomTemp);
      Serial.print("C, Est: ");
      Serial.print(currentTemp);
      Serial.print("C, Peak: ");
      Serial.print(peakTemp);
      Serial.print("\n");
    }

    // Logika wykrywania gotowości
    if (state == DONE && !tempWarningShown) {
      if ((int)currentTemp <= (int)tempThreshold) {
        if (peakTemp > 0 && currentTemp < peakTemp - 2.0) {
          triggerReady();
        } else if (lastStableTemp != 0 && millis() - stableTempSince > 10000) {
          triggerReady();
        }
      }

      if (lastStableTemp == 0) {
        lastStableTemp = currentTemp;
        stableTempSince = millis();
      }

      float tempDiff = currentTemp - lastStableTemp;
      if (tempDiff >= 0.3 || tempDiff <= -0.3) {
        lastStableTemp = currentTemp;
        stableTempSince = millis();
      }
    }
    needDisplayUpdate = true;
  }

  // 4. Reset stanu po zdjęciu kubka
  if ((state == BREWING || state == DONE || state == READY_TO_DRINK) && !cupDetected) {
    state = WAIT_CUP;
    peakTemp = 0.0;
    peakBottomTemp = 0.0;
    tempWarningShown = false;
    lastStableTemp = 0;
    stableTempSince = 0;
    noTone(BUZZER_PIN);
    needDisplayUpdate = true;
  }

  // 5. Timer parzenia
  if (state == BREWING) {
    if (remaining() <= 0) finishBrewing();
    needDisplayUpdate = true;
  }

  checkDisplayUpdate();
}

// ================== ENKODER - PRZERWANIA Z QUADRATURE ==================
void handleEncoder() {
  static int lastPosition = 0;
  
  // Enkoder ma 4 impulsy na jeden "klik" mechaniczny - dzielimy przez 4
  int currentPosition = encoderPosition / 4;
  
  // Przerwania aktualizują encoderPosition - tutaj tylko sprawdzamy zmiany
  if (currentPosition != lastPosition) {
    int delta = currentPosition - lastPosition;
    lastPosition = currentPosition;
    
    wakeDisplay(); // Wybudź ekran po obróceniu enkodera!
    
    // STAŁE KROKI - każdy KLIK mechaniczny = 1 krok
    int timeStep = 10;   // 10 sekund na klik
    int tempStep = 1;    // 1°C na klik
    
    // Zastosuj zmianę
    if (state == MENU_TIME) {
      adjustTime(delta * timeStep);
    } else if (state == MENU_TEMP) {
      adjustTemp(delta * tempStep);
    }
  }
  
  // Obsługa przycisku
  unsigned long now = millis();
  if (digitalRead(ENC_KEY) == LOW) {
    if (now - lastButtonTime > 250) {
      lastButtonTime = now;
      
      wakeDisplay(); // Wybudź ekran po kliknięciu!
      
      encoderClick();
      while (digitalRead(ENC_KEY) == LOW) delay(10);
    }
  }
}

void encoderClick() {
  State oldState = state;
  if (state == WAIT_CUP) state = MENU_TIME;
  else if (state == MENU_TIME) state = MENU_TEMP;
  else if (state == MENU_TEMP) {
    state = WAIT_CUP;
    saveSettings();
    beep(2500, 20);
  }
  if (oldState != state) {
    beep(2000, 20);
    needDisplayUpdate = true;
  }
}

void adjustTime(int d) {
  timeSet = constrain((long)timeSet + d, MIN_TIME, MAX_TIME);
  needDisplayUpdate = true;
}

void adjustTemp(int d) {
  tempThreshold = constrain(tempThreshold + d, MIN_TEMP, MAX_TEMP);
  needDisplayUpdate = true;
}

// ================== DISPLAY ==================
void checkDisplayUpdate() {
  if (!isDisplayAwake) return; // NIE RYSUJ NICZEGO GDY EKRAN ŚPI

  if (needDisplayUpdate && (millis() - lastDisplayDrawTime > DISPLAY_REFRESH_INTERVAL)) {
    lastDisplayDrawTime = millis();
    needDisplayUpdate = false;

    if (state != lastDrawnState || cupDetected != lastCupDetected) {
      oledFill(&ssoled, 0, 1);
      lastDrawnState = state;
      lastCupDetected = cupDetected;
    }

    drawScreenContent();
  }
}


void drawScreenContent() {
  int tempInt = (int)currentTemp;

  if (state == WAIT_CUP) {
    if (!cupDetected) {
      oledWriteString(&ssoled, 0, 20, 1, (char*)"Brak    ", FONT_STRETCHED, 0, 1);
      oledWriteString(&ssoled, 0, 12, 4, (char*)"kubka   ", FONT_STRETCHED, 0, 1);
      oledWriteString(&ssoled, 0, 8, 7, (char*)"Klik = Menu     ", FONT_NORMAL, 0, 1);
    } else {
      oledWriteString(&ssoled, 0, 12, 2, (char*)"Kubek   ", FONT_STRETCHED, 0, 1);
      oledWriteString(&ssoled, 0, 0, 5, (char*)"wykryty ", FONT_STRETCHED, 0, 1);
    }
  } else if (state == MENU_TIME) {
    oledWriteString(&ssoled, 0, 0, 0, (char*)"Czas parzenia:  ", FONT_NORMAL, 0, 1);
    formatTime(timeSet, buffer);
    strcat(buffer, "  ");
    oledWriteString(&ssoled, 0, 14, 3, buffer, FONT_STRETCHED, 0, 1);
  } else if (state == MENU_TEMP) {
    oledWriteString(&ssoled, 0, 0, 0, (char*)"Ustaw Temp:     ", FONT_NORMAL, 0, 1);
    sprintf(buffer, "%d C  ", (int)tempThreshold);
    oledWriteString(&ssoled, 0, 20, 3, buffer, FONT_STRETCHED, 0, 1);
    oledWriteString(&ssoled, 0, 0, 7, (char*)"(Temp cieczy)", FONT_NORMAL, 0, 1);
  } else if (state == BREWING) {
    oledWriteString(&ssoled, 0, 4, 0, (char*)"Parzenie", FONT_STRETCHED, 0, 1);
    formatTime(remaining(), buffer);
    strcat(buffer, " ");
    oledWriteString(&ssoled, 0, 14, 3, buffer, FONT_STRETCHED, 0, 1);
    sprintf(buffer, "Liq: %d C       ", tempInt);
    oledWriteString(&ssoled, 0, 8, 7, buffer, FONT_NORMAL, 0, 1);
  } else if (state == DONE) {
    if(currentTemp < tempThreshold){
    oledWriteString(&ssoled, 0, 4, 0, (char*)"Grzanie ", FONT_STRETCHED, 0, 1);
    }
    else{
     oledWriteString(&ssoled, 0, 4, 0, (char*)"Stygnie ", FONT_STRETCHED, 0, 1);
    }
    sprintf(buffer, "Cel: %d C       ", (int)tempThreshold);
    oledWriteString(&ssoled, 0, 16, 4, buffer, FONT_NORMAL, 0, 1);
    sprintf(buffer, "Akt: %d C       ", tempInt);
    oledWriteString(&ssoled, 0, 16, 6, buffer, FONT_NORMAL, 0, 1);
  } else if (state == READY_TO_DRINK) {
    oledWriteString(&ssoled, 0, 4, 0, (char*)"GOTOWE! ", FONT_STRETCHED, 0, 1);
    sprintf(buffer, "%d C  ", tempInt);
    oledWriteString(&ssoled, 0, 28, 4, buffer, FONT_STRETCHED, 0, 1);
  }
}

void formatTime(long sec, char* buf) {
  int m = sec / 60;
  int s = sec % 60;
  sprintf(buf, "%02d:%02d", m, s);
}

void beep(int f, int d) {
  tone(BUZZER_PIN, f, d);
}

// ================== INNE ==================
void loadSettings() {
  long readTime;
  float readTemp;
  EEPROM.get(ADDR_TIME, readTime);
  EEPROM.get(ADDR_TEMP, readTemp);
  timeSet = (readTime >= MIN_TIME && readTime <= MAX_TIME) ? readTime : DEFAULT_TIME;
  tempThreshold = (!isnan(readTemp) && readTemp >= MIN_TEMP && readTemp <= MAX_TEMP) ? readTemp : DEFAULT_TEMP;
}

void saveSettings() {
  EEPROM.put(ADDR_TIME, timeSet);
  EEPROM.put(ADDR_TEMP, tempThreshold);
  EEPROM.commit();
}

float measureDistance() {
  uint8_t range = vl.readRange();
  return (vl.readRangeStatus() == VL6180X_ERROR_NONE) ? range : -1;
}

void startBrewing() {
  state = BREWING;
  brewStartTime = millis();
  peakTemp = 0.0;
  peakBottomTemp = 0.0;
  tempWarningShown = false;
  lastStableTemp = 0;
  stableTempSince = 0;
  beep(1000, 200);
  wakeDisplay(); // Wybudź ekran przy starcie parzenia
  needDisplayUpdate = true;
}

long remaining() {
  unsigned long passed = (millis() - brewStartTime) / 1000;
  return (brewDuration > passed) ? brewDuration - passed : 0;
}

// Poniższa funkcja została naprawiona (wcześniej ucięta i podwójnie skopiowana)
void finishBrewing() {
  state = DONE;
  lastStableTemp = 0;
  stableTempSince = 0;
  for (int i = 0; i < 2; i++) {
    beep(1500, 100);
    delay(100);
  }
  wakeDisplay(); // Wybudź ekran po zakończeniu parzenia
  needDisplayUpdate = true;
}