# RS485_Board
Up to [eVOLVER](eVOLVER.md)

## Design Files for Review

 * [Schematic](http://ohm.bu.edu/~hazen/BME/eVOLVER/Boards/RS485/RS485.pdf) (pdf)
 * [Layout](http://ohm.bu.edu/~hazen/BME/eVOLVER/Boards/RS485/RS485_layout.pdf) (pdf)
 * [Gerber](http://ohm.bu.edu/~hazen/BME/eVOLVER/Boards/RS485/RS485_gerber.pdf) (individual layers, pdf)

## Layout Notes

This board provides a for-channel half-duplex RS-485 interface for up to 4 microcontrollers.
This board would be similar in size to the microcontroller, with two rows of 0.1" spaced headers.

A proposed pin-out is given below.


|| *Left* | ----- || *Right* |
|| ------ | ----- || ------- |
|  1 | GND |  | GND |  1 |
|  2 | Tx1 |   | Tx3 |  2 |
|  3 | Rx1 |   | Rx3 |  3 |
|  4 | En1 |   | En3 |  4 |
|  5 | Tx2 |   | Tx4 |  5 |
|  6 | Rx2 |   | Rx4 |  6 |
|  7 | En2 |   | En4 |  7 |
|  8 | 5V  |   | A   |  8 |
|  9 | GND |   | B   |  9 |

An RS485 transceiver such as the ST3485 (497-6540-1-ND) would be used (4 required)
along with a 3.3V regulator.  A and B are the RS-485 bus.
