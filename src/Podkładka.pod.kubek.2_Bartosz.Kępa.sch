<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="16" fill="1" visible="no" active="no"/>
<layer number="3" name="Route3" color="17" fill="1" visible="no" active="no"/>
<layer number="4" name="Route4" color="18" fill="1" visible="no" active="no"/>
<layer number="5" name="Route5" color="19" fill="1" visible="no" active="no"/>
<layer number="6" name="Route6" color="25" fill="1" visible="no" active="no"/>
<layer number="7" name="Route7" color="26" fill="1" visible="no" active="no"/>
<layer number="8" name="Route8" color="27" fill="1" visible="no" active="no"/>
<layer number="9" name="Route9" color="28" fill="1" visible="no" active="no"/>
<layer number="10" name="Route10" color="29" fill="1" visible="no" active="no"/>
<layer number="11" name="Route11" color="30" fill="1" visible="no" active="no"/>
<layer number="12" name="Route12" color="20" fill="1" visible="no" active="no"/>
<layer number="13" name="Route13" color="21" fill="1" visible="no" active="no"/>
<layer number="14" name="Route14" color="22" fill="1" visible="no" active="no"/>
<layer number="15" name="Route15" color="23" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
<layer number="255" name="Undefined" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="eagle_lib_sensors" urn="urn:adsk.wipprod:fs.file:vf.o9UJHoO8RJas1KqDj8B5Jg">
<description>&lt;b&gt;Biblioteka - Czujniki&lt;/b&gt;&lt;p&gt;
Projekt: Podkładka pod kubek&lt;br&gt;
Autor: Bartosz Kępa</description>
<packages>
<package name="MLX90614_MODULE" library_version="6">
<description>MLX90614 IR Temp Sensor 20x15mm</description>
<wire x1="0" y1="0" x2="17" y2="0" width="0.127" layer="21"/>
<wire x1="17" y1="0" x2="17" y2="15" width="0.127" layer="21"/>
<wire x1="17" y1="15" x2="0" y2="15" width="0.127" layer="21"/>
<wire x1="0" y1="15" x2="0" y2="0" width="0.127" layer="21"/>
<pad name="VIN" x="2.54" y="2.54" drill="0.8" diameter="1.4" shape="square"/>
<pad name="GND" x="2.54" y="5.08" drill="0.8" diameter="1.4"/>
<pad name="SCL" x="2.54" y="7.62" drill="0.8" diameter="1.4"/>
<pad name="SDA" x="2.54" y="10.16" drill="0.8" diameter="1.4"/>
<circle x="9" y="7" radius="3" width="0.127" layer="21"/>
<text x="5" y="12" size="1.27" layer="25">&gt;NAME</text>
<text x="5" y="1" size="1.27" layer="27">&gt;VALUE</text>
<hole x="14" y="2" drill="3"/>
<hole x="14" y="13" drill="3"/>
</package>
<package name="VL6180X_MODULE" library_version="6">
<description>VL6180X ToF Sensor 15x8mm</description>
<wire x1="0" y1="-1.27" x2="22.82" y2="-1.27" width="0.127" layer="21"/>
<wire x1="22.82" y1="-1.27" x2="22.82" y2="10.032" width="0.127" layer="21"/>
<wire x1="22.82" y1="10.032" x2="0" y2="10.032" width="0.127" layer="21"/>
<wire x1="0" y1="10.032" x2="0" y2="-1.27" width="0.127" layer="21"/>
<pad name="VIN" x="5.08" y="0.1" drill="0.8" diameter="1.4" shape="square"/>
<pad name="GND" x="7.62" y="0.1" drill="0.8" diameter="1.4"/>
<pad name="SCL" x="10.16" y="0.1" drill="0.8" diameter="1.4"/>
<pad name="SDA" x="12.7" y="0.1" drill="0.8" diameter="1.4"/>
<pad name="SHUT" x="15.24" y="0.1" drill="0.8" diameter="1.4"/>
<pad name="INT" x="17.74" y="0.1" drill="0.8" diameter="1.4"/>
<text x="1.206" y="3.238" size="1.27" layer="25">&gt;NAME</text>
<text x="14.16" y="3.008" size="1.27" layer="27">&gt;VALUE</text>
<circle x="11.04" y="4.73" radius="1.5" width="0.127" layer="21"/>
<hole x="3" y="5" drill="3"/>
<hole x="20" y="5" drill="3"/>
</package>
</packages>
<symbols>
<symbol name="MLX90614" library_version="4">
<wire x1="-10.16" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="-10.16" y2="7.62" width="0.254" layer="94"/>
<pin name="VIN" x="-12.7" y="5.08" length="short" direction="pwr"/>
<pin name="GND" x="-12.7" y="-5.08" length="short" direction="pwr"/>
<pin name="SCL" x="12.7" y="2.54" length="short" rot="R180"/>
<pin name="SDA" x="12.7" y="-2.54" length="short" rot="R180"/>
<text x="-10.16" y="8.89" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<text x="-8" y="0" size="1.27" layer="94">MLX90614 IR</text>
</symbol>
<symbol name="VL6180X" library_version="4">
<wire x1="-12.7" y1="10.16" x2="12.7" y2="10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="10.16" x2="12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="-12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-10.16" x2="-12.7" y2="10.16" width="0.254" layer="94"/>
<pin name="VIN" x="-15.24" y="7.62" length="short" direction="pwr"/>
<pin name="GND" x="-15.24" y="-7.62" length="short" direction="pwr"/>
<pin name="SCL" x="15.24" y="5.08" length="short" rot="R180"/>
<pin name="SDA" x="15.24" y="2.54" length="short" rot="R180"/>
<pin name="SHUT" x="15.24" y="-2.54" length="short" rot="R180"/>
<pin name="INT" x="15.24" y="-5.08" length="short" rot="R180"/>
<text x="-12.7" y="11.43" size="1.778" layer="95">&gt;NAME</text>
<text x="-12.7" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<text x="-8" y="0" size="1.27" layer="94">VL6180X ToF</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="MLX90614" prefix="U" library_version="6">
<description>MLX90614 IR Temperature Sensor
Range: -40 to +125°C
Accuracy: ±0.5°C
Interface: I2C</description>
<gates>
<gate name="G$1" symbol="MLX90614" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MLX90614_MODULE">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="SCL" pad="SCL"/>
<connect gate="G$1" pin="SDA" pad="SDA"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VL6180X" prefix="U" library_version="6">
<description>VL6180X ToF Distance Sensor
Range: 5-200mm
Accuracy: ±3mm
Interface: I2C</description>
<gates>
<gate name="G$1" symbol="VL6180X" x="0" y="0"/>
</gates>
<devices>
<device name="" package="VL6180X_MODULE">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="INT" pad="INT"/>
<connect gate="G$1" pin="SCL" pad="SCL"/>
<connect gate="G$1" pin="SDA" pad="SDA"/>
<connect gate="G$1" pin="SHUT" pad="SHUT"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Connectors" urn="urn:adsk.wipprod:fs.file:vf.tL_A7QgNRwu_9mL0b2wVIg">
<description>&lt;h3&gt; PCBLayout.com - Frequently Used &lt;i&gt;Connectors&lt;/i&gt;&lt;/h3&gt;

Visit us at &lt;a href="http://www.PCBLayout.com"&gt;PCBLayout.com&lt;/a&gt; for quick and hassle-free PCB Layout/Manufacturing ordering experience.
&lt;BR&gt;
&lt;BR&gt;
This library has been generated by our experienced pcb layout engineers using current IPC and/or industry standards. We &lt;b&gt;believe&lt;/b&gt; the content to be accurate, complete and current. But, this content is provided as a courtesy and &lt;u&gt;user assumes all risk and responsiblity of it's usage&lt;/u&gt;.
&lt;BR&gt;
&lt;BR&gt;
Feel free to contact us at &lt;a href="mailto:Support@PCBLayout.com"&gt;Support@PCBLayout.com&lt;/a&gt; if you have any questions/concerns regarding any of our content or services.</description>
<packages>
<package name="5-534237-8" urn="urn:adsk.eagle:footprint:10989882/1" library_version="12">
<wire x1="-12.7" y1="1.78" x2="12.7" y2="1.78" width="0.1524" layer="51"/>
<wire x1="12.7" y1="1.78" x2="12.7" y2="-1.78" width="0.1524" layer="51"/>
<wire x1="12.7" y1="-1.78" x2="-12.7" y2="-1.78" width="0.1524" layer="51"/>
<wire x1="-12.7" y1="-1.78" x2="-12.7" y2="1.78" width="0.1524" layer="51"/>
<wire x1="-12.7" y1="1.78" x2="12.7" y2="1.78" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.78" x2="12.7" y2="-1.78" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-1.78" x2="-12.7" y2="-1.78" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-1.78" x2="-12.7" y2="1.78" width="0.1524" layer="21"/>
<wire x1="-12.95" y1="2.03" x2="12.95" y2="2.03" width="0.05" layer="39"/>
<wire x1="12.95" y1="2.03" x2="12.95" y2="-2.03" width="0.05" layer="39"/>
<wire x1="12.95" y1="-2.03" x2="-12.95" y2="-2.03" width="0.05" layer="39"/>
<wire x1="-12.95" y1="-2.03" x2="-12.95" y2="2.03" width="0.05" layer="39"/>
<circle x="-13.381" y="0" radius="0.1" width="0.2" layer="21"/>
<text x="-12.75008125" y="2.250140625" size="1.27008125" layer="25">&gt;NAME</text>
<text x="-13.0031" y="-3.506909375" size="1.272509375" layer="27">&gt;VALUE</text>
<pad name="1" x="-11.43" y="0" drill="0.88" shape="square"/>
<pad name="2" x="-8.89" y="0" drill="0.88"/>
<pad name="3" x="-6.35" y="0" drill="0.88"/>
<pad name="4" x="-3.81" y="0" drill="0.88"/>
<pad name="5" x="-1.27" y="0" drill="0.88"/>
<pad name="6" x="1.27" y="0" drill="0.88"/>
<pad name="7" x="3.81" y="0" drill="0.88"/>
<pad name="8" x="6.35" y="0" drill="0.88"/>
<pad name="9" x="8.89" y="0" drill="0.88"/>
<pad name="10" x="11.43" y="0" drill="0.88"/>
</package>
</packages>
<packages3d>
<package3d name="5-534237-8" urn="urn:adsk.eagle:package:10989941/2" type="model">
<packageinstances>
<packageinstance name="5-534237-8"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="5-534237-8" urn="urn:adsk.eagle:symbol:28493010/1" library_version="12">
<pin name="1" x="7.62" y="10.16" length="middle" direction="pas" rot="R180"/>
<pin name="2" x="7.62" y="7.62" length="middle" direction="pas" rot="R180"/>
<pin name="3" x="7.62" y="5.08" length="middle" direction="pas" rot="R180"/>
<pin name="4" x="7.62" y="2.54" length="middle" direction="pas" rot="R180"/>
<pin name="5" x="7.62" y="0" length="middle" direction="pas" rot="R180"/>
<pin name="6" x="7.62" y="-2.54" length="middle" direction="pas" rot="R180"/>
<pin name="7" x="7.62" y="-5.08" length="middle" direction="pas" rot="R180"/>
<pin name="8" x="7.62" y="-7.62" length="middle" direction="pas" rot="R180"/>
<pin name="9" x="7.62" y="-10.16" length="middle" direction="pas" rot="R180"/>
<pin name="10" x="7.62" y="-12.7" length="middle" direction="pas" rot="R180"/>
<wire x1="2.54" y1="12.7" x2="2.54" y2="-15.24" width="0.254" layer="94"/>
<wire x1="2.54" y1="-15.24" x2="-5.08" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-15.24" x2="-5.08" y2="12.7" width="0.254" layer="94"/>
<wire x1="-5.08" y1="12.7" x2="2.54" y2="12.7" width="0.254" layer="94"/>
<text x="-10.16" y="15.24" size="2.54" layer="95">&gt;NAME</text>
<text x="-10.16" y="-20.32" size="2.54" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="5-534237-8" urn="urn:adsk.eagle:component:28493048/1" prefix="J" library_version="12">
<description>&lt;h3&gt; CONN RCPT 10POS 0.1 GOLD PCB &lt;/h3&gt;
&lt;BR&gt;
&lt;a href="https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&amp;DocNm=534237&amp;DocType=Customer+Drawing&amp;DocLang=English"&gt; Manufacturer's datasheet&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="5-534237-8" x="0" y="2.54"/>
</gates>
<devices>
<device name="" package="5-534237-8">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:10989941/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CREATED_BY" value=" PCBLayout.com" constant="no"/>
<attribute name="DIGIKEY_PART_NUMBER" value="A32910-ND" constant="no"/>
<attribute name="MANUFACTURER" value="TE Connectivity AMP Connectors" constant="no"/>
<attribute name="MPN" value="5-534237-8" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U1" library="eagle_lib_sensors" library_urn="urn:adsk.wipprod:fs.file:vf.o9UJHoO8RJas1KqDj8B5Jg" deviceset="MLX90614" device=""/>
<part name="U2" library="eagle_lib_sensors" library_urn="urn:adsk.wipprod:fs.file:vf.o9UJHoO8RJas1KqDj8B5Jg" deviceset="VL6180X" device=""/>
<part name="J1" library="Connectors" library_urn="urn:adsk.wipprod:fs.file:vf.tL_A7QgNRwu_9mL0b2wVIg" deviceset="5-534237-8" device="" package3d_urn="urn:adsk.eagle:package:10989941/2"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U1" gate="G$1" x="60.96" y="22.86" smashed="yes">
<attribute name="NAME" x="50.8" y="31.75" size="1.778" layer="95"/>
<attribute name="VALUE" x="50.8" y="12.7" size="1.778" layer="96"/>
</instance>
<instance part="U2" gate="G$1" x="60.96" y="-7.62" smashed="yes">
<attribute name="NAME" x="48.26" y="3.81" size="1.778" layer="95"/>
<attribute name="VALUE" x="48.26" y="-20.32" size="1.778" layer="96"/>
</instance>
<instance part="J1" gate="G$1" x="5.08" y="15.24" smashed="yes">
<attribute name="NAME" x="-5.08" y="30.48" size="2.54" layer="95"/>
<attribute name="VALUE" x="-5.08" y="-5.08" size="2.54" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="3V3" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="12.7" y1="25.4" x2="33.02" y2="25.4" width="0.1524" layer="91"/>
<wire x1="33.02" y1="25.4" x2="33.02" y2="27.94" width="0.1524" layer="91"/>
<wire x1="33.02" y1="27.94" x2="48.26" y2="27.94" width="0.1524" layer="91"/>
<label x="35.56" y="27.94" size="1.778" layer="95"/>
<pinref part="U1" gate="G$1" pin="VIN"/>
</segment>
<segment>
<wire x1="45.72" y1="0" x2="35.56" y2="0" width="0.1524" layer="91"/>
<wire x1="35.56" y1="0" x2="35.56" y2="15.24" width="0.1524" layer="91"/>
<wire x1="35.56" y1="15.24" x2="12.7" y2="15.24" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="5"/>
<label x="38.1" y="0" size="1.778" layer="95"/>
<pinref part="U2" gate="G$1" pin="VIN"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="12.7" y1="22.86" x2="40.64" y2="22.86" width="0.1524" layer="91"/>
<wire x1="40.64" y1="22.86" x2="40.64" y2="17.78" width="0.1524" layer="91"/>
<wire x1="40.64" y1="17.78" x2="48.26" y2="17.78" width="0.1524" layer="91"/>
<label x="35.56" y="22.86" size="1.778" layer="95"/>
<pinref part="U1" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="45.72" y1="-15.24" x2="33.02" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-15.24" x2="33.02" y2="12.7" width="0.1524" layer="91"/>
<wire x1="33.02" y1="12.7" x2="12.7" y2="12.7" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="6"/>
<label x="35.56" y="-15.24" size="1.778" layer="95"/>
<pinref part="U2" gate="G$1" pin="GND"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="4"/>
<label x="27.94" y="17.78" size="1.778" layer="95" xref="yes"/>
<wire x1="12.7" y1="17.78" x2="27.94" y2="17.78" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="8"/>
<wire x1="12.7" y1="7.62" x2="20.32" y2="7.62" width="0.1524" layer="91"/>
<label x="22.86" y="5.08" size="1.778" layer="95" xref="yes"/>
<wire x1="20.32" y1="7.62" x2="20.32" y2="5.08" width="0.1524" layer="91"/>
<wire x1="20.32" y1="5.08" x2="22.86" y2="5.08" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="76.2" y1="-2.54" x2="81.28" y2="-2.54" width="0.1524" layer="91"/>
<label x="81.28" y="-2.54" size="1.778" layer="95" rot="R90" xref="yes"/>
<pinref part="U2" gate="G$1" pin="SCL"/>
</segment>
<segment>
<wire x1="73.66" y1="25.4" x2="78.74" y2="25.4" width="0.1524" layer="91"/>
<label x="78.74" y="25.4" size="1.778" layer="95" xref="yes"/>
<pinref part="U1" gate="G$1" pin="SCL"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="7"/>
<wire x1="12.7" y1="10.16" x2="20.32" y2="10.16" width="0.1524" layer="91"/>
<label x="20.32" y="10.16" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="3"/>
<wire x1="12.7" y1="20.32" x2="20.32" y2="20.32" width="0.1524" layer="91"/>
<label x="20.32" y="20.32" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<wire x1="76.2" y1="-5.08" x2="81.28" y2="-5.08" width="0.1524" layer="91"/>
<label x="81.28" y="-5.08" size="1.778" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="SDA"/>
</segment>
<segment>
<wire x1="73.66" y1="20.32" x2="78.74" y2="20.32" width="0.1524" layer="91"/>
<label x="78.74" y="20.32" size="1.778" layer="95" xref="yes"/>
<pinref part="U1" gate="G$1" pin="SDA"/>
</segment>
</net>
<net name="INT" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="9"/>
<wire x1="12.7" y1="5.08" x2="17.78" y2="5.08" width="0.1524" layer="91"/>
<wire x1="17.78" y1="5.08" x2="17.78" y2="0" width="0.1524" layer="91"/>
<wire x1="17.78" y1="0" x2="20.32" y2="0" width="0.1524" layer="91"/>
<label x="20.32" y="0" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<wire x1="76.2" y1="-12.7" x2="83.82" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="83.82" y1="-12.7" x2="83.82" y2="-17.78" width="0.1524" layer="91"/>
<label x="83.82" y="-17.78" size="1.778" layer="95" rot="R270" xref="yes"/>
<pinref part="U2" gate="G$1" pin="INT"/>
</segment>
</net>
<net name="SHUT" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="10"/>
<wire x1="12.7" y1="2.54" x2="15.24" y2="2.54" width="0.1524" layer="91"/>
<wire x1="15.24" y1="2.54" x2="15.24" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="15.24" y1="-5.08" x2="20.32" y2="-5.08" width="0.1524" layer="91"/>
<label x="20.32" y="-5.08" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<wire x1="76.2" y1="-10.16" x2="86.36" y2="-10.16" width="0.1524" layer="91"/>
<label x="86.36" y="-10.16" size="1.778" layer="95" xref="yes"/>
<pinref part="U2" gate="G$1" pin="SHUT"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<sch_hier_ref_des_map>
<part_path_ref_des_mapping board_ref_des="J1" logical_identifier="J1"/>
<part_path_ref_des_mapping board_ref_des="U1" logical_identifier="U1"/>
<part_path_ref_des_mapping board_ref_des="U2" logical_identifier="U2"/>
</sch_hier_ref_des_map>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
