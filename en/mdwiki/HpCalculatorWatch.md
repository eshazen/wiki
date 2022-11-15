# HpCalculatorWatch
This is an entertainment/educational project to build a watch which can
run the original HP-35 calculator firmware as well as telling time.
It has a 34 key keyboard, a back-lit 128x32 graphic LCD and a low power real-time clock.
The CPU is an ATMega328, same as in the Arduino.  Firmware available at Jacques Laporte's site
linked below for HP-35 running on an actual Arduino... shouldn't be hard to port.

Design

SVN (firmware):  http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/HP-Watch

3 PCBs ordered 12/17/13 due 12/23/13.

 * Schematic (ExpressSCH) -- [SCH](http://ohm.bu.edu/~hazen/CalcWatch/watch1.sch) [PDF](http://ohm.bu.edu/~hazen/CalcWatch/watch1_sch.pdf)
 * PCB Layout (ExpressPCB) -- [PCB](http://ohm.bu.edu/~hazen/CalcWatch/g2_jtag.pcb) (including JTAG adapter for another project) -- [PDF](http://ohm.bu.edu/~hazen/CalcWatch/watch1_pcb.pdf)
 * Parts List (OpenOffice) -- [ODS](http://ohm.bu.edu/~hazen/CalcWatch/Watch_BOM.ods)

 * HP-35 on Arduino -- [Jacques Laporte's site](http://www.jacques-laporte.org/HP35_Arduino.htm) -- [Local Mirror](http://ohm.bu.edu/~hazen/Calc/HP35_Arduino/HP35_Arduino.htm)

Parts:

 * NHD-C12832A1Z-FSW-FBW-3V3-ND display
 * ATMEGA328P-A MPU in TQFP-32
 * CFS206-32.768KDZB-UB crystal for RTC
 * MCP79410-I/SN RTC

Alternative switches:

 * CK PTS 810, 820, KMR4 series.  1.5mm body, 1mm plunger
 * EVQ-P2402M etc (Panasonic, DK P11080SCT-ND).  *Too Big?*  These are 1.6mm body with switch extending above.
