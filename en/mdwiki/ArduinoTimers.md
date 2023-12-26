# ArduinoTimers

## ATMega328

These notes apply to the [ATMega328P](https://www.microchip.com/en-us/product/ATMEGA328P) (Uno etc) using the Arduino IDE and libraries unless otherwise noted.

The 328 has 3 timers:

*Timer0* (8 bits)

Used for `delay()`, `millis()` and `micros()`.  Don't mess with it.

*Timer1* (16 bits)

Not normally used.  For simple use, see the [TimerOne](https://www.arduino.cc/reference/en/libraries/timerone/) library.

For example:

```
  Timer1.initialize(1);    // set period to 1us
  Timer1.pwm( 9, 128);     // set to 1/8 duty cycle (128/1024) or 125ns pulse
```

However, this only works on pins 9 and 10;

*Timer2* (8 bits)

Used by e.g. the `tone()` function.

## Leonardo

Here are some to-be-confirmed notes about the 32U4 based boards (Leonardo, Pro Micro).

* DFRobot Beetle
  * [Datasheet](https://www.digikey.com/htmldatasheets/production/2071146/0/0/1/DFR0282.pdf)
  * [Schematic](https://image.dfrobot.com/image/data/DFR0282/Beetle%20Sch.pdf)

The USB uses interrupts, and disabling it is problematic because you can't reload the
board without using the reset button (which isn't even installed on the pro micro!)

* [TimerOne and TimerThree](https://www.pjrc.com/teensy/td_libs_TimerOne.html) claim to work with the Leonardo.
* [Using Timer1 and Timer3 with Leonardo](https://blog.suspectdevices.com/blahg/arduino/using-the-timer1-and-timer3-libraries-with-the-arduino-leonardo/) - they say that PRJC libraries above have been updated to work.
