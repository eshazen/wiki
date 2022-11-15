# BlinkyColorPOV
This is a new version POV device with full color LEDs and Arduino compatibility.  There's also a 3 axis accelerometer to synchronize the message with the motion of the device.

<img src="http://ohm.bu.edu/~hazen/BlinkyColorPOV/assembled_board_sm.jpg">

## Programming

 * [programmer](http://ohm.bu.edu/~hazen/BlinkyColorPOV/colortext.html) page for downloading new messages

## Design Documentation

 * http://edf.bu.edu/svn/edf/Eric/BlinkyColorPOV (SVN archive)
 * [schematic](http://ohm.bu.edu/~hazen/BlinkyColorPOV/blinky_color.pdf) (pdf)
 * [layout](http://ohm.bu.edu/~hazen/BlinkyColorPOV/layout_screenshot.png) (PNG)
 * [gerbers](http://ohm.bu.edu/~hazen/BlinkyColorPOV/blinky_color2.zip) (ZIP)

## 2017 Updates

 * Updated layout for larger staggered LED holes (may still want to pre-bend leads)
 * Last year we put the accelerometers on a breakout board.  This year may want to mount on main PCB (*with testpoints*)
   * See e.g. https://www.digikey.com/product-detail/en/stmicroelectronics/LIS3DHTR/497-10613-1-ND/2334355
   * Or sparkfun breakout for $4.95:  https://www.sparkfun.com/products/13963
 * If we get lazy Adafruit has the MiniPOV4 for $25

## Supplies

 * Parts Kits
 * ATMEGA328s
 * Batteries
 * 6 soldering irons
 * 6 sets cutters, pliers
 * VOM
 * solder
 * practice boards and parts
 * Directions
 * Eric's laptop and programming cable

## 2016 Volunteers

 * Dan Gastler
 * Siliva Zhang
 * Joseph Beaupre
 * Joshua Bassin
 * Aily
 * Zach C


## Firmware Details

*AVR* Fuses should be set as follows:
```
Lfuse: 0xe2
Hfuse: 0xd9
Efuse: 0x07
```

Download the trunk version of firmware from here:
http://edf.bu.edu/svn/edf/Eric/BlinkyColorPOV/Firmware/ColorText/

 * Type "make status" to display fuses and other general info
 * Type "make fuse" to set fuses if incorrect
 * Type "make flash" to download blinky code

Note that the makefile in SVN is for an ATMega328 (not ATMega328P as used in Arduino, etc).
The only required change for an ATMega328P is to change the line:
```
DUDEMCU = m328
  to
DUDEMCU = m328p
```
in the Makefile.  Depending on the OS and programming cable you may also have to change the line
```
DUDEPORT  = -c avrispv2 -P /dev/ttyACM1
  to
DUDEPORT  = -c avrispv2 -P usb
```
(or possibly /dev/ttyACM0... see output of 'dmesg')

## After-Event Notes

 * Fix LED footprints
   * linear row of holes in the right order, about .065 spacing
   * oval pads maybe .08 x .03?
 * Maybe move accelerometer onto a breakout [like this](https://www.oshpark.com/shared_projects/1vI6D3RK)
 * Consolidate R, C values
 * Put programming website on the silkscreen!
 * Auto sleep after a while and/or LED activity when not moving
 * Add Arduino bootloader
 * Work on display timing so it works better with longer messages

## Parts Notes

 * LEDs are [from Sparkfun](https://www.sparkfun.com/products/12986)
 * DigiKey order [here](http://ohm.bu.edu/~hazen/BlinkyColorPOV/Digikey1.pdf) (but missing sockets, AVRs other stuff)
 * [MMA7660 Breakout](https://www.oshpark.com/shared_projects/1vI6D3RK) board from Osh Park (could pre-assemble)
 * Ordered 10/17/2016 21x MMA7660 breakout board [here](https://github.com/wickerbox/Basic-Breakout-Boards/tree/master/mma7660-sensor-breakout)
 * Need:  MMA7760FCT-ND, one header and two .01 0805 caps

