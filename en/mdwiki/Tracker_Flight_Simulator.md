# Tracker_Flight_Simulator
BRIEF DESCRIPTION: This page describes a board which will be used to test the G-2 tracker electronics.
One set of tracker electronics up to 96 channels will plug in to this board, which
will provide programmable test pulses to simulate tracker signals.

The board will contain one or more Xilinx Spartan-6 FPGAs which will provide
all logic and interface functions.

TECHNICAL DESCRIPTION:
 * The FPGA chosen was a Xilinx Spartan 6 in a Tqg144 package.
 * The FPGA is programmed from an included flash memory chip on startup.
 * There is a FTDI header to allow external programming.
 * The Pulse generation circuit is as follows:






 * There is a built in 100mhz oscillator
 * There are 3 customizable LEDs, and one power LED
 * There are test-points on the SPI bus, as well as 6 FPGA I/O Pins for debugging.

### Rev. B Changelog










### Preview of Rev. B

 * [Tracker Flight Simulator Schematic.pdf](http://ohm.bu.edu/~dean/G-2%20Tracker%20rev%20b/Tracker%20Flight%20Simulator.pdf)
 * [Gerber Files.zip](http://ohm.bu.edu/~dean/G-2%20Tracker%20rev%20b/gerber.zip)
 * [Kicad Files.tar.gz](http://ohm.bu.edu/~dean/G-2%20Tracker%20rev%20b.tar.gz)
 * [RevBFLightSimulatorNotes](RevBFLightSimulatorNotes.md)

### Rev. A PCB Design Files

 * [Rev. A Tracker Flight Simulator Schematic.pdf](http://ohm.bu.edu/~dean/archive/G-2_tracker_rev_a/Tracker%20Flight%20Simulator.pdf)
 * [Rev. A Gerber Files](http://ohm.bu.edu/~dean/archive/G-2_tracker_rev_a/gerber/)
 * [Rev. A Kicad Files.zip](http://ohm.bu.edu/~dean/archive/G-2_tracker.tar.gz)

### TODO rev b
 * fix garbled help command
 * TP 7 -> time zero, TP6 -> channel 15
 * Software controlled continuous mode (start/stop/once)
 * Programmable continuous mode period
 * python configuration tool with input scripts
 * use optparse to allow python program to run script, be interactive, or  both.
 * dump settings command
 * set baud rate to 115200

### TODO rev c
 * move c5 diff pair to bank 0 or 2

### Reference Materials

 * [ASDQ Mechanics](http://ohm.bu.edu/~hazen/G-2/ASDQ_Board_Corr_Dim.pdf)
 * [Specification Document](https://docs.google.com/document/d/1K7rcS4AEiRYQ67VvqTu7JBpeAS5PouwPZhBZtYDJAos/edit?usp=sharing)
 * [Eric''s Programmable Logic Talk](http://ohm.bu.edu/~hazen/NEPPSR2005/Trigger_Electronics_Hazen_part2.pdf)
 * [Xilinx Spartan 6](http://www.xilinx.com/products/silicon-devices/fpga/spartan-6/index.htm)
   * [Spartan-6 Family Overview](http://www.xilinx.com/support/documentation/data_sheets/ds160.pdf)
   * [Spartan-6 Packaging and Pinouts](http://www.xilinx.com/support/documentation/user_guides/ug385.pdf)
 * [TTT Schematic](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget_sch.pdf)
