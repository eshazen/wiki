# PowerTestingNotes


One Sparkfun 8mm RGB LED draws ~ 58 mA at full-brightness white.

Arduino Uno has 5V regulator MC33269ST-5.0T3 or MC33269D-5.0 which is rated at 800mA
(but only at <= 4V VIN-VOUT).

At brightness 128 they draw 29mA and are still pretty bright.

It's probably OK to give them 30-40 LEDs and tell them not to run them
all above brightness 128.

We need external 6V power supplies.

Arduino has 500mA "thermofuse" on USB power input.
