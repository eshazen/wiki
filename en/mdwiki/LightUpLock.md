# LightUpLock
This small PCB implements an IR proximity sensor.  An IR LED is pulsed at 40KHz.
A reflected IR signal is detected by an IR remote control receiver.
When a signal is detected, visible LEDs are turned on.

### Assembly Notes

The IR LED and sensor should be mounted in the 12-O''clock and 6-O'clock
positions of the plastic ring.  Illumination LEDs (wiring notes below)
can be installed in the other 4 locations.  All the LEDs and the sensor
could be secured with RTV silicone caulk (__after everything is working;
use tape before then!__).  The PCB, battery holder, and sensitivity
adjust pot go in the rear piece (cover with electrical tape to avoid shorts).

Visible LEDs should be connected to J2.  Pin 1 is 3V power.  Pins 3, 4, 5 are
three separate outputs from the microcontroller, each of which can sink 40mA.
Various series/parallel combinations of LEDs and resistors can be connected,
as long as the above current limit is not exceeded.

There is a 500 ohm pot in series with the IR LED which can be used to adjust
the sensitivity.  It could be replaced with a fixed resistor for the final
assembly, or the pot could just be covered with tape and put in the backshell.

### Documentation

 * [Schematic](http://joule.bu.edu/~hazen/LightUpLock/Sensor.pdf)
 * [PCB assembly instructions](http://joule.bu.edu/~hazen/LightUpLock/assembly.pdf)
 * [PCB layout](http://joule.bu.edu/~hazen/LightUpLock/lock_pcb.gif)
 * [prog1_5Dec05.zip](http://joule.bu.edu/~hazen/LightUpLock/prog1_5Dec05.zip)



