# EpromProgrammer

Need an EEPROM programmer for the Z80 project.

 * [AT28C256](https://www.mouser.com/datasheet/2/268/doc0006-1108095.pdf)
 * [Arduino pinout](https://upload.wikimedia.org/wikipedia/commons/c/c9/Pinout_of_ARDUINO_Board_and_ATMega328PU.svg)

Observation:  Arduino has enough pins to program the low 256 bytes.  Might be able to fit some sort of bootloader in there.
It wouldn't be much trouble to add a latch for the upper address lines.

Ordered an Arduino prototyping shield.
