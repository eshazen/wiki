# ArduinoNotes

Harvested from EDF wiki for the most part

* [Arduino Timers](ArduinoTimers.md)
* [Arduino Outreach](ArduinoOutreach.md)
* [Arduino Stuff](ArudinoStuff.md)
* [Arduino to Native C](ArduinoToNativeC.md)
* [Arduino Tricks](ArduinoTricks.md)
* [Arduino Zero](ArduinoZero.md)


### Programming

```
 avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega2560 -o blink.out blink.c
 avr-objcopy -O ihex -R .eeprom blink.out blink.hex
 sudo avrdude -c stk500v2 -p m2560 -P /dev/tty.usbmodem621 -U flash:w:blink.hex

```
