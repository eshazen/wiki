# KFLARE_bootloader
This page describes the boot loader that will allow for programing all of the microcontrollers on the KFLARE light source via a serial USB connection rather than individually with the AVR programming cable.

## kavr

The KFLARE bootloader will be a modified version of kavr (pronounced caviar), which is an Atmel AVR boot loader for programing AVR microcontrollers via a USB serial port.

 * [kavr documentation and source code](http://sourceforge.net/projects/kavr/?source=navbar)

## GUI Interface

The bootloader will be manually programmable by directly copying the .hex files into the serial port of the connecting USB. It will also be programmable through a graphical Python interface.

