# CapLevelSensor
Capacitance Level Sensor

# Prototype 2

This board was designed by Chris Woodall in 2010/2011 and has an on-board AVR microcontroller and fiber optic interface.

*'PCB Documentation*

 * Schematic: [SCH](http://ohm.bu.edu/~cwoodall/nEDM/nEDM_cap_level_sensor/nEDM_cap_level_sensor_revA.sch)
[PDF](http://ohm.bu.edu/~hazen/nEDM/nEDM_cap_level_sensor_RevA_sch.pdf)
 * PCB Layout: [PCB](http://ohm.bu.edu/~cwoodall/nEDM/nEDM_cap_level_sensor/nEDM_cap_level_sensor_revA.pcb)
[PDF](http://ohm.bu.edu/~hazen/nEDM/nEDM_cap_level_sensor_RevA_assembly.pdf)
 * Parts List: [BOM](http://ohm.bu.edu/~cwoodall/nEDM/nEDM_cap_level_sensor/nEDM_cap_level_sensor_revA.bom)

*'Design Notes*

The PCB consists of an AD7746 capacitance digitizer chip, an ATMega168 microcontroller, and a fiber-optic serial link.  There is also a site to connect an FTDI USB/serial breakout board.  The programming connector (J3) should be plug-compatible with the tuxgraphics programmer.  Here is a suggested sequence for commissioning of the board after assembly:

 * Apply 5V power (careful with polarity!) via J5.
 * Download AVR with a simple program to blink LEDs
 * Install jumpers in the bottom two positions of JP1 and JP2, and install the Sparkfun FTDI basic USB breakout board at J4
 * Download AVR with a program to to test the serial/USB I/O and verify that it works
 * Read the AD7746 documentation and Conor''s notes below, and port the capacitance measuring code to the AVR.  This involves understanding how to use the I2C bus (Conor can help with this).

# Prototype 1

This is a board designed to be connected to a computer or FPGA evaluation board built in 2010 by Paul and Conor.  It was tested successfully using a cable to a PC parallel port and the C code below by Conor.  Ask him for details!

 * [Schematic](http://ohm.bu.edu/~pbohn/nEDM/capsensor/Design_Files/)
   * Bill Of Materials [(Google Spreadsheet)](https://spreadsheets.google.com/ccc?key=tXgwBfEnz-mabwTJGI2D6Ng) [(csv)](http://spreadsheets.google.com/pub?key=tXgwBfEnz-mabwTJGI2D6Ng&output=csv)
 * [PCB Layout](http://ohm.bu.edu/~pbohn/nEDM/capsensor/Design_Files/)

*' Design Reference *

 * [AD7746:  24-bit, 2 Channel Capacitance to Digital Converter](http://www.analog.com/en/analog-to-digital-converters/capacitance-to-digital-converters/ad7746/products/product.html)
 * [Extending the Capacitive Input Range of the AD7745/AD7746 Capacitance-to-Digital Converter  (CN0129) ](http://www.analog.com/en/verifiedcircuits/CN0129/vc.html)
 * [Notes by Steven Clayton](https://nedm.bu.edu/twiki/bin/view/NEDM/CapacitanceIC)

*'Software*
 * [Linux C program that measures capacitances](http://ohm.bu.edu/~cdubois/Minor%20programs/par_rtlib.tar.gz)
 * [Program Data Readout Procedure Description](http://ohm.bu.edu/cgi-bin/edf/Neutron_Electric_Dipole_Moment_(nEDM)/CapLevelSensor/Interaction_Sequence)

*' Testing *

This device can be easily tested using the parallel port on a PC with appropriate software.  The following cable can be made, with a DB-25 male (plug) on one end and a 10 pin ribbon cable on the other end (mates with J1 -- 8 pins only).


| *'DB-25 Pin* | *Parallel Port Function* | *J1 Pin* | *I2C Function * |
| ------- ---- | --------- ---- --------- | --- ---- | ---- -------- - |
| 8 | Data6 | 3 | SCL |
| 9 | Data7 | 5 | SDA (Wr) |
| 11 | Busy | 7 | SDA (Rd) |
| 18-25 | GND | 2,4,6,8 | GND |

Note that the parallel cable used in our experiments was overly long such that it had a non-trivial crosstalk. A 5100 ohm series resistor was added into the connection between pin 11 of the parallel port and pin 7 of the J1 connection to reduce the slew rate.

 * [Interfacing the Standard Parallel Port](http://www.beyondlogic.org/spp/parallel.htm)
 * [par_rtlib.zip](http://ohm.bu.edu/~hazen/nEDM/par_rtlib.zip)


