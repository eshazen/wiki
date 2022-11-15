# ArduinoToNativeC

Converting Arduino code to native C can be tricky.  Here are some tips.

### Digital I/O

In your arduino code you use "digitalWrite()" to control output bits.
This does not exist in the "native" C environment we are now using.

For example you would use:
```
  digitalWrite( 13, HIGH);    // turn on LED
  digitalWrite( 13, LOW);     // turn off LED
```
This sets pin 13 on the Arduino board to a '1' (which also has the LED).

In the native C environment, first of all you do not use pin numbers,
but names such as PB0, PB1 etc.  These you will see for the Arduino
on the typical pinout diagram (yellow boxes):
[uno.jpg](http://foros.giltesa.com/otros/arduino/fc/docs/pinout/uno.jpg)

In the code you would use the following:
```
  PORTB |= _BV( PB5);      // turn on LED
  PORTB &= ~_BV( PB5);     // turn off LED
```
  EXPERT NOTE:  These idioms are recognized by the AVR code generator for
  GCC and generate the SBR and CBR machine instructions which are more efficient
  and safer than other more "obvious" ways of coding.  In particular they do
  not depend on the current state of the register.

Also, setting the direction of the pins (input/output) is a bit different.
In the Arduino environment you would use:
```
  pinMode( 13, OUTPUT);   // LED pin 13 is output
```
While in native C you would use:
```
  DDRB |= _BV( PB5);     // PB5 (LED) is output
```
