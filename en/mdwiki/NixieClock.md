# NixieClock

## My Nixie Clocks

 * 2020 kit-build (WeMOS 4 digit from https://www.nixieclock.biz/Store.html)
 * 2020 version: [ClockII_In12B](ClockII_In12B.md)
 * 2004 version: http://ohm.bu.edu/~hazen/Nixie/

What's next?  In stock I have about 12 B-5092 nixies in various states, and even sockets!  Dreaming of a clock with programmable RGB lights which can forecast weather, etc. Maybe a Z80 nixie clock!

Want 6 digits with all driven, so 60 outputs if not multiplexed.  Also some big neopixel guys.  Maybe:

 * Z80 CPU
 * Z80 PIO
 * Z80 DART (2 channels, 1 for WiFi module, 1 for download/debug)
 * EEPROM (in-circuit programmable but with write protect)
 * RAM

Parts:

 * DS1243Y - 8k x 8 NVRAM with real-time clock ($20 at Jameco)
 * DS1307 - 8 pin DIP I2C clock 5V ($4 at Jameco)
 * SN75468 - 7 channel HV driver
