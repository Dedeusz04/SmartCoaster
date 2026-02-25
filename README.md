# Smart Coaster — ESP8266 Beverage Temperature Monitor

An embedded system built on the **NodeMCU ESP8266** platform that automatically detects cup presence, monitors beverage temperature in real time, and notifies the user when the drink has reached the desired drinking temperature.

![Block Diagram](1.png)

## Features

- **Automatic cup detection** using a VL6180X Time-of-Flight proximity sensor (effective range up to 50 mm)
- **Non-contact temperature measurement** via an MLX90614 infrared thermometer with an adaptive algorithm that estimates the actual liquid temperature from the cup-bottom reading
- **Configurable brew timer** (0–10 minutes) for steeping/brewing countdown
- **Target temperature alert** — audible buzzer notification when the beverage cools to the user-defined threshold (0–100 °C)
- **128×64 OLED display** (SSD1306) showing system state, countdown, and live temperature
- **Rotary encoder interface** for menu navigation and parameter adjustment
- **Persistent settings** stored in EEPROM across power cycles
- **Thermal protection** — distance sensor polling is suspended above 45 °C to prevent sensor damage

## Hardware

| Component | Model / Specification |
|---|---|
| Microcontroller | NodeMCU ESP8266 (ESP-12E, 80 MHz, 4 MB flash) |
| IR Temperature Sensor | Melexis MLX90614 (I2C, -40 to +125 °C, ±0.5 °C) |
| Distance Sensor | ST VL6180X ToF (I2C, 5–200 mm, ±3 mm) |
| OLED Display | SSD1306, 128×64 px (I2C) |
| Rotary Encoder | E11-type incremental encoder with push-button |
| Buzzer | Passive, PWM-driven |
| Power Supply | 5 V / 1 A via USB-C |

### Pin Assignment

| Function | NodeMCU Pin | GPIO |
|---|---|---|
| I2C SDA | D2 | GPIO4 |
| I2C SCL | D1 | GPIO5 |
| Encoder S1 | D5 | GPIO14 |
| Encoder S2 | D6 | GPIO12 |
| Encoder Button | D7 | GPIO13 |
| Buzzer | D0 | GPIO16 |

## Prerequisites

- [PlatformIO](https://platformio.org/install/ide) (VS Code extension or CLI)
- NodeMCU ESP8266 development board
- USB cable for programming

## Build and Flash

All dependencies are resolved automatically by PlatformIO based on `platformio.ini`.

```bash
# Compile
pio run

# Upload firmware
pio run -t upload

# Serial monitor (9600 baud)
pio device monitor
```

Alternatively, use the PlatformIO toolbar in VS Code: **Build** (checkmark icon) and **Upload** (arrow icon).

## Dependencies

| Library | Description |
|---|---|
| [Adafruit MLX90614](https://github.com/adafruit/Adafruit-MLX90614-Library) | MLX90614 IR sensor driver |
| [Adafruit VL6180X](https://github.com/adafruit/Adafruit_VL6180X) | VL6180X ToF sensor driver |
| [ss_oled](https://github.com/bitbank2/ss_oled) | Lightweight SSD1306 OLED driver |
| Adafruit BusIO / Unified Sensor | I2C abstraction layer |

## System Operation

The firmware implements a finite state machine with the following states:

```
WAIT_CUP ──(cup placed)──> BREWING ──(timer expires)──> DONE ──(temp ≤ target)──> READY_TO_DRINK
    ^                                                                                   |
    └───────────────────────── (cup removed from any state) ────────────────────────────┘
```

1. **WAIT_CUP** — Idle state. The system polls the distance sensor for cup presence. The encoder button opens a settings menu (brew time, target temperature).
2. **BREWING** — Cup detected; the countdown timer runs. The display shows remaining time and current temperature.
3. **DONE** — Timer has elapsed. The system continuously monitors liquid temperature, waiting for it to fall to the configured threshold.
4. **READY_TO_DRINK** — Target temperature reached. A periodic buzzer alarm (2 s interval) sounds until the cup is removed.

Removing the cup at any point resets the system to the idle state.

### Temperature Estimation Algorithm

The MLX90614 sensor measures the **external surface of the cup bottom**, not the liquid directly. To compensate for the thermal gradient between the cup wall and the beverage, the firmware applies an adaptive correction factor that scales with the difference between the measured surface temperature and the ambient reference (captured at cup placement). This approach yields more accurate liquid temperature estimates across a wide operating range without requiring per-cup calibration.

## Configuration

Default parameters (adjustable via rotary encoder):

| Parameter | Default | Range |
|---|---|---|
| Brew time | 180 s (3:00) | 0 – 600 s |
| Target temperature | 55 °C | 0 – 100 °C |

Settings are written to EEPROM and persist across power cycles.

## Enclosure

The circuit is assembled on a universal PCB and mounted inside a plastic enclosure with a transparent lid. Cutouts are provided for:

- **Rotary encoder shaft** — accessible from the outside for user interaction
- **IR and ToF sensor apertures** — unobstructed optical path to the cup bottom
- **OLED display** — visible through the transparent cover

## License

This project is provided as-is for educational and personal use.
