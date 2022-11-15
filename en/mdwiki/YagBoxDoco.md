# YagBoxDoco
### General Description

The timing box is designed to control two lasers, based on a single
1KHz trigger (clock) input.  For each laser, the following output
signals are provided.  All signals are 3.3V TTL (74LVT244 buffer).

; Trig Monitor: a buffered output of the trigger signal for monitoring
on an oscilloscope.
; Trig Delay: a delayed trigger, with delay adjustable from 0-999.9 us.
; Flashlamp: a 10Hz output derived from Trig Delay (no additional delay)
; Q-Switch: a 10Hz output delayed by an additional 0-999.9 us from flashlamp output.
; Shutter: an output with a programmable rate delayed by an additional 0-999.9 us
from flashlamp output.

### User Interface

The [development board](http://www.digilentinc.com/info/S3Board.cfm)
7 segment LED display, four momentary switches, eight toggle switches, and eight LEDs.
The user interface is implemented using these as follows:

#### 7-Segment LEDS

Four digits display the value to be edited.  Typically this is a delay
in us.  The digit being modified blinks.  When a new function is selected,
the function code appears momentarily on the display.

#### Momentary Switches

 * SW1 [Function_Select](Function_Select.md)
  Momentarily display the function number on the LED display when
  pressed, then the current value for editing.  Each of the two
  lasers has 4 functions which may be programmed, so there are a
  total of 8 functions.


|Function|LED Display|
|--------|--- -------|
|Laser 1 Trigger Delay|L1F1|
|Laser 1 Q-Switch Delay|L1F2|
|Laser 1 Shutter Delay|L1F3|
|Laser 1 Shutter rate|L1F4|
|Laser 2 Trigger Delay|L2F1|
|Laser 2 Q-Switch Delay|L2F2|
|Laser 2 Shutter Delay|L2F3|
|Laser 2 Shutter Rate|L2F4|

 * SW2 [Digit_Select](Digit_Select.md)
  Blink the current digit.

 * SW3 [Increment](Increment.md)

 * SW4 [Decrement](Decrement.md)

#### Toggle Switches

 * T1 - Laser 1 Q-Switch Enable
 * T2 - Laser 1 Flashlamp Enable
 * T3 - Laser 2 Q-Switch Enable
 * T4 - Laser 2 Flashlamp Enable


