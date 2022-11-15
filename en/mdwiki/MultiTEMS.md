# MultiTEMS
## Multi channel TEMS

This page describes a proposed mult-channel transcutaneous electrical nerve stimulation (TENS) device for Dr. Mario Cabodi’s biomedical device design lab (BME).  Here is some description from the customer (N. Vellanki):

"Transcutaneous electrical nerve stimulation (TENS) is when a device is used to send small electrical impulses onto the skin to override the nervous system to provide pain relief. It’s used to help patients suffering from chronic pain and is usually a single channel device and I’m trying to make a multichannel version for experimental purposes."

Figures provided by the customer below.

<img src="http://ohm.bu.edu/~hazen/TENS/multi.jpg" width="300"> <img src="http://ohm.bu.edu/~hazen/TENS/Tens-2-Rev-4.png" width="300">

The customer has asked for a quote on a complete four-channel circuit, battery-powered.  The existing circuits use a single 9V battery but we propose to use 8 x AAA or AA batteries to provide 12V and longer battery life.


### Reference

 * GitLab: https://gitlab.com/BU-EDF/edf-projects/non-physics/multi-channel-tems
 * https://www.arduino.cc/en/uploads/Main/Arduino_Uno_Rev3-schematic.pdf
 * https://diyi0t.com/arduino-reduce-power-consumption/
 * https://www.sparkfun.com/products/15140
 * https://conservancy.umn.edu/bitstream/handle/11299/103933/1/Young_Joseph_January2011.pdf

### Rev A ECOs

 * Encoder knob not wired.  Need a jumper from R15 top to pin of Arduino.
 * Encoder A, B are wired to A6, A7 which seem to be only analog inputs.  Sigh.
   * Wire (with maybe few K series resistors) to MOSI, MISO - pins 1,4 of otherwise unused J7
 * R12 should be a jumper so the LCD backlight is visible
 * Add ~ 4x gain in U3
   * Cut trace from pin 2-1 of U3.
   * Wire 3.3K between U3-2 and U3-4
   * Wire 12K between U3-1 and U3-2
 * Need pull-downs on MOSFET gates
   * Install 1K in C7-C10 sites


[Google Doc](http://ohm.bu.edu/~hazen/TENS/TENS%20Rev%20A%20mods%20-%20Google%20Docs.pdf) with details for mods to assembled board.

### Firmware Spec

Adjustable parameters:

```
* For each output:
  * Fast pulse width                      1-999 us
  * Burst size (number of fast pulses)    1-99
  * Burst delay between fast pulses       1-999 us
* Delay between outputs                   1-999 us
* Delay between stimuli                   1-999 ms
* Overall amplitude                       0-100%
```


### Debug/Development Log

*2021-11-23*

Investigating pseudo-sine wave output.  They want in principle up to 20kHz.  The Arduino Pro Mini we have runs at 8MHz (since it's 3.3V).  That would make for rather poor PWM, though the TimerOne library can manage PWM outputs pretty well.

If they want to really do sine waves, we would need a HV buffer output, from e.g. an LTC6090 HV op-amp (140V p-p output).  One could use a single DAC with an analog switch/mux driving four output buffers to avoid HV switching.  DAC output should be 100-300kHz.  Could use e.g. MCP4921 (12-bit SPI DAC).

*2021-11-16*

First usable rev firmware done.  [(Gitlab)](https://gitlab.com/BU-EDF/edf-projects/non-physics/multi-channel-tems/Software/Tems3).  Parameters "Width", "Spacing", "Burst", "Delay", "Gap", "Amplitude" can be set with knob, and saved in EEPROM with double-click.  This is great except now they want sine waves, etc.  Should have actually met with the group before building something.

*2021-11-15*

Installed one transformer.  No noticeable output.  The "555" schematic drives the MOSFET gate with 9V-12V from the 555,
while on the PCB it is driven only by 3.3V.  Oops.  Luckily there is an op-amp (U3).  Rewire it for 2x gain, still not
much output.  Going to change it now to ~ 4X gain so we can get all the way to 12V.

Also according to the notes on the 555 circuit the output pulse width is adjustable 40-270uS.  Should set up a test
with the arduino to output narrow pulses.

Modify sketch to produce 100us pulses.  Now with 12V power, analog = 128 (6V ref) we get about 150V output.
Lots of ripple on the programmable voltage though.  Increase C3 to 47uF 16V.  No more ripple.

Need a pull-down on the MOSFET gates to discharge them.  Luckily there are C sites there.  Install 10k for now.
Fall time a bit slow, could probably be ~ 3.3k or even 1k.

Gate drive range is about 3.3V to 4.5V for ~0-150V output.

*2021-11-12*

Working on the board.  Power OK.  Arduino/serial OK.  LED in knob OK.  LCD Ok.  Encoder doesn't work.

Made changes mentioned above, now all is OK with the encoder, button and backlight.

R1*C3 is a couple of orders of magnitude too small, since the PWM freq is around 500 Hz.
Changing R1 to 10K would be pretty good.

Haven't tested the outputs yet.

*2021-10-22*

Layout ~ done, but want to tweak a few things:

 * Add a GPIO connector
 * Think about mechanics of FT232 thing
 * Add a programmable LED
 * Connect the 12V to an analog input through a divider for battery level sense

After meeting 10/15/21 with the customer, decided to move ahead with an "Ardunio-based" project.

 * [Schematic (PDF)](https://gitlab.com/BU-EDF/edf-projects/non-physics/multi-channel-tems/-/blob/main/arduino-shield/mctens.pdf)

One concern with the Arduino shield model is power consumption.  According to [this page](https://diyi0t.com/arduino-reduce-power-consumption/) (unverified) an Uno R3 uses ~100mA (so 700mW at 7V input).  An *Arduino pro mini* immediately reduces the consumption due to not having built-in USB/serial thing, and it can easily be run on 3.3V and at lower clock speeds.  AA batteries are ~2000 mAh while AAA average around 1000 mAh.

Proposed parts:

 * Arduino Pro Mini 3.3V [sparkfun](https://www.sparkfun.com/products/11114) [schematic](https://www.arduino.cc/en/uploads/Main/Arduino-Pro-Mini-schematic.pdf)
 * FTDI Breakout [sparkfun](https://www.sparkfun.com/products/13263)
 * Character LCD 3.3V [sparkfun](https://www.sparkfun.com/products/9053) [data](https://www.sparkfun.com/datasheets/LCD/ADM1602K-FSY-FBS-3.3V.pdf)
 * Shaft encoder [sparkfun](https://www.sparkfun.com/products/15140) (maybe [breakout board](https://www.sparkfun.com/products/11722))
 * Clear Knob [sparkfun](https://www.sparkfun.com/products/10597)

### Cost estimate

```
    Engineering                        Either   Option 1    Option 2
    Discussion, specifications          1 hr
    Schematic capture                            3 hr        1.5 hr
    PCB layout (either option)                   3 hr        2   hr
    Assemble, debug, test prototype              1 hr        3   hr
                                        Total    8 hr        7.5 hr
    PCB fabrication (JLC)  $20
    Parts (wild guess)     $50 ea

    So maybe $1500
```

