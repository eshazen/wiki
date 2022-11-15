# NewTOFBox
Up:  [ElbatTOF2017](ElbatTOF2017.md)

## Documentation for new TOF box


 * Box wiring [System Diagram.pdf](http://ohm.bu.edu/~hazen/elbat_tof/System%20Diagram.pdf)
 * SVN: http://gauss.bu.edu/svn/tof-system/Hardware/tof/
 * Photos: http://ohm.bu.edu/~hazen/elbat_tof/Photos/2018-09-13/tof/

This box provides a programmable sequence generator (pulse train) and TDC using a Xilinx FPGA.
It also includes several power supplies.  The original box is built using a Xilinx Spartan 3 evaluation board and interface PCB,
which are quite well documented here:  http://ohm.bu.edu/~hazen/elbat_tof/

Some thoughts on new box:

Acopian B series linear power supplies are still available [link](https://www.acopian.com/single-l-goldbox-m.html).  Main concern is that they must be selected as 120V or 220V when purchased.  May want to source some replacements with universal inputs (but they would have to be switchers).

Bill's nice 200V adjustable regulator is appealing and we have the PCB design, so if parts are still available it might make sense just to reproduce it.

There are two D-subminiature connectors for the Preamp and pulser interfaces, as follows:

*Preamp (9 pin)*


| *Pin* | *Signal* |
| ----- | -------- |
| 1         | +5V power    |
| 2         | n/c          |
| 3         | GND          |
| 4         | n/c          |
| 5         | -5.2V power  |
| 6         | n/c          |
| 7         | Pulse +      |
| 8         | GND          |
| 9         | Pulse -      |

Pulse is a negative 10k ECL differential input terminated in 50 ohms.

*Pulser (15 pin)*


|  1  | GND   |  9   | NEG+  |
|  -  | ---   |  -   | ----  |
|  2  | -6V   |  10  | NEG-  |
|  3  | +5V   |  11  | ON+   |
|  4  | POS+  |  12  | ON-   |
|  5  | POS-  |  13  | GND   |
|  6  | n/c   |  14  | n/c   |
|  7  | n/c   |  15  | n/c   |
|  8  | -200V |      |       |

NEG, POS and ON are negative 10k ECL differential ouputs to the pulser.
POS enables the high-side switch (to GND), NEG enables the low-side switch (to -200V)
and ON enables the 3mA holding current (to -200V)

In addition there is a 50-ohm terminated BNC input with a discriminator on the input with
threshold adjustable from 0 to +5V (with a lot of hysteresis)
