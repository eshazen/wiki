# MiniPOV
See [POV](http://edf.bu.edu/pov/)

[USB-POV_Test_Log](USB-POV_Test_Log.md)

### PC Boards

New design fabricated Nov 2011.  Works ok so far, USB not tested.  Tilt sensor orientation needs work.

 * [USB_POV.sch](http://ohm.bu.edu/~hazen/USB_POV/USB_POV.sch)
 * [USB_Pov.pcb](http://ohm.bu.edu/~hazen/USB_POV/USB_Pov.pcb)

### To Do

 * Add jumper to select bootloader
 * Change tilt sensor orientation

### USB Version

The major disadvantage of the MiniPOV3 is that it requires a serial port.  A new version could be made which is USB-only using a special boot loader.  The  USBAspLoader (below) seems like a great candidate.

 * [V-USB](http://www.obdev.at/products/vusb/index.html)
 * [USBAspLoader](http://www.obdev.at/products/vusb/usbasploader.html)
 * [USBasp](http://www.fischl.de/usbasp/)

Some observations:  12MHz xtal-based clock is best option at 3.3V.  ATMega88 et al can officially run at 12MHz above 3.06V.  At this voltage also, the USB interface is simplified as the zener diodes can be omitted.  So the minimal hardware is similar in parts count to the MiniPOV3:  fewer parts for the computer interface, but add two caps and xtal.



### PCB Costs

 * Miniboard service (3 x 3, 9 boards, $85).  $9.44/board
 * ProtoPro service (21 in^2, 4 boards, $166).  Can fit 6 boards, so $7.37/board.
 * Production (12x14) with 45 boards, 2 boards (total 90 pcs) at $4.22/board

### Tilt Sensor

Here are some ideas/code for adding a tilt sensor to trigger the display when
you wave the device.

 * [Forum thread](http://forums.adafruit.com/viewtopic.php?f=11&t=7103&p=49569&hilit=sensor#p49569)

We tried a cheap ball-type tilt sensor, and it was not reliable enough.  Another idea is an optical tilt sensor, such as one made by OncQue (Mouser stocks some, i.e. OncQue# RBS330301).

