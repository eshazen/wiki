# DDS_Voltage_Regulator
## * _DDS Power Supply_ *

The DDS Power supply is a voltage regulator board which will receive an input voltage in the range of 5-8V and output a regulated 1.8V and 3.3V

----

## Design Information

### Overview

The board revives an input voltage of roughly 5V from a 4 pin 0.156" spaced cable with alternating power and ground pins. This voltage is then passed as the input to two [LM317 voltage regulators](http://ohm.bu.edu/~tnadov/ddsr/data/lm317.pdf), one with a resistor configuration set to output 1.8V, the other with a resistor configuration set to output 3.3V. These voltages are then output via three additional 4 pin headers, each of which outputs the configuration 1.8V,GND,3.3V,GND. Each DDS board will be drawing roughly 200mA for each required voltage, meaning that the 1.8V regulator will conduct roughly 0.6A (each regulator will power 3 boards) and drop roughly 3.2V (assuming 5V input). This will result a power dissipation of about 1.92W. Higher input voltages will result in higher power dissipation. The junction to case thermal resistance for the regulator is 17°C/W and the junction to heat sink thermal resistance is 3°C/W. I've also made four custom cables for this board. Three connect to the output headers for wiring to the screw terminals on the DDS development board and the fourth connects the input of the regulator to the output of the main regulator in the system.

### Usage

Connect the input of the board to the 5V output from the main regulator with the provided cable. Connect the outputs to the screw terminals on one or more DDS boards.

### Layout and Schematic

[Schematic](http://ohm.bu.edu/~tnadov/ddsr/design/ddsr.sch) ([PDF](http://ohm.bu.edu/~tnadov/ddsr/pdf/ddsr_sch.pdf))

[Layout](http://ohm.bu.edu/~tnadov/ddsr/design/ddsr.pcb) ([PDF](http://ohm.bu.edu/~tnadov/ddsr/pdf/ddsr_pcb.pdf))


### Modifications

 * None

### Testing

 * N/A

### Issues

 * dDOSI system requires twice as much power and twice as many connectors as one board provides.

----

## Index

 * [Heatsink](http://ohm.bu.edu/~tnadov/ddsr/data/heatsink.pdf)

