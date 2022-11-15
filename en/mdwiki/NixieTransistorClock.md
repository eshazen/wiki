# NixieTransistorClock
Some time ago I built one of these kits:  https://tube-clock.com/

All went pretty well except the switching power supply never really worked right.  Eventually replaced it with a DC/DC board bought on eBay.

Setting the thing is a real pain.  The switches are very bouncy and it takes a lot of trial and error.  Here are some thoughts on an auto-set add-on.  See the [manual](http://edf.bu.edu/svn/edf/EricHome/NixieTransistorClock/neon_man.pdf) with schematic:

 * Use an ESP8266 to get the time over !WiFi
 * Attach a few GPIOs with appropriate level-shift and protection
   * 3 inputs from:  10's of minutes and 10's of hours, 10's of seconds
   * 3 outputs to:  seconds set, minutes set, seconds hold

The idea would be to wait for seconds to wrap and then activate hold, then count up the min and hr to zero then count to correct time.

Not sure if we can get 5V or 3.3V out of the board to power everything?

For the readout, need to tap in to "M_D0", "M10_D0", "H_D0" and "H10_D0", all 12V logic.
Maybe use 74HC14 for inputs powered on 3.3V with appropriate voltage divider for 12V logic (4:1).  They can be powered on 3.3V.

Output can be a SN75468 hex HV driver from the other clock project.  Datasheet says 3.3V ops is OK.

Power transistor is STX13003G, TO-92 NPN with pinout "E,C,B"

Power supply is about 15V.

Bottom of 10k resistor (photo) switches from about 0.5V to 14V when digit is active.  Switches are 10-15V pull to 0V.

ESP8266 is unhappy with much more than 5V in and starts to draw a lot of current at 12V.  Best to put in a small DC/DC to drop the ~15V on the clock to 5V.

