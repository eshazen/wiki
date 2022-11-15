# ArduinoTimers

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
