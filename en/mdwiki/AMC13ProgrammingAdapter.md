# AMC13ProgrammingAdapter
## * _AMC13 Programming Adapter Board_ *

This page describes a programming cable adapter which converts the form factors of a variety of Xilinx JTAG programming cables into ones that can connect to the AMC13 module.

----

## Design Information for Programming Adapter Rev 2

### Overview
The board allows for conversion from the 10 pin socket on the side of the AMC13 to a Xilinx Platform Cable, a JTAGICE3 microcontroller programming cable and a standard 6 pin JTAG cable.

### Usage
Once the keyed plug on either side of the board is inserted into the AMC13 connector, the Xilinx Platform cable, the JTAGICE3 cable or the standard JTAG cable may be connected to the board.

### Layout and schematic

 * Schematic ([PDF](http://ohm.bu.edu/~tnadov/amca/v2/pdf/amca_sch.pdf))
 * Layout ([PDF](http://ohm.bu.edu/~tnadov/amca/v2/pdf/amca_pcb.pdf))

### Modifications

 * N/A

### Testing

 * N/A

### Issues

 * N/A

----

## Design Information for Programming Adapter Rev 1

### Overview
The board allows for conversion from the 10 pin socket on the side of the AMC13 to a Xilinx Platform Cable, a JTAGICE3 microcontroller programming cable and a standard 6 pin JTAG cable.

### Usage
A provided keyed cable is inserted into the AMC13 Hub Card and into either of the shrouded 10 pin connectors on either side of the board. The top connector is wired to a smaller unshrouded header which can be connected to a JTAGICE3 microcontroller programming cable. The bottom connector is wired to both the 6 pin standard JTAG header and to the 14 pin header for connections with a Xilinx Platform Cable.

### Layout and schematic

 * Schematic ([PDF](http://ohm.bu.edu/~tnadov/amca/pdf/amca_sch.pdf))
 * Layout ([PDF](http://ohm.bu.edu/~tnadov/amca/pdf/amca_pcb.pdf))

### Modifications

 * Stubs underneath JTAGICE3 cable have been deliberately melted off

### Testing

 * N/A

### Issues

 * The cable is not keyed
 * The cable is too wide to plug into the AMC13
 * The shroud on the Xilinx Platform cable header prevents the JTAGICE3 programming cable from being inserted.
 * There are stubs on the bottom of the JTAGICE3 header that prevent it from being installed flush with the board.

----

## Index

### AMC13
 * [AMC13 Short Spec](http://ohm.bu.edu/~hazen/CMS/AMC13/AMC13_Short_Spec_05Oct2012.pdf)

### Programming Cables
 * [Xilinx Platform Cable USB Datasheet](http://www.xilinx.com/support/documentation/data_sheets/ds300.pdf)
 * [Digilent JTAG-HS1 Datasheet](http://www.digilentinc.com/Data/Products/JTAG-HS1/JTAG-HS1_rm.pdf)
 * [JTAGICE3 Overview](http://www.atmel.com/tools/JTAGICE3.aspx?tab=overview)
 * [JTAGICE3 Pinout](http://ohm.bu.edu/~tnadov/amca/v1/data/jtagice3cablepinout.jpg)

### Sourced headers
 * [AMC13 Cable Header](http://ohm.bu.edu/~tnadov/amca/v1/data/2mm_10pin_right_angle.pdf)
 * [Xilinx Cable Header](http://ohm.bu.edu/~tnadov/amca/v1/data/2mm_14pin.pdf)
 * [JTAGICE3 Cable Header](http://ohm.bu.edu/~tnadov/amca/v1/data/50mil_10pin_right_angle.pdf)
 * [JTAG Cable Header](http://ohm.bu.edu/~tnadov/amca/v1/data/100mil_6pin.pdf)
