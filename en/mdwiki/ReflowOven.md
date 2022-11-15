# ReflowOven

Some other ideas:

 * T962A oven with either a new controller:
   * https://hackaday.com/2019/07/11/a-drop-in-controller-replacement-for-commercial-reflow-ovens
   * or just new firmware:  https://github.com/UnifiedEngineering/T-962-improvements


 * https://www.oshstencils.com
 * https://www.pololu.com/product/446 - cheap mylar stencils
 * https://www.stencilsunlimited.com/prototype-smt-stencils-p-28.html.html - stencils unlimited prototype

Bought a toaster oven and a bunch of parts from Sparkfun to convert
it into a reflow oven, inspired by this post:

http://reprap.org/wiki/Toaster_Oven_Reflow_Technique

We'll see how it works out!

*2017-10-19* (Eric)

Wired up a setup with an Arduino Pro Mini 328/3.3V and MAX31855K thermocouple digitizer, SSR etc to control the oven.  See for some details:

 * https://learn.sparkfun.com/tutorials/max31855k-thermocouple-breakout-hookup-guide

Here are a couple of plots of the temp and control signal for 160C and 210C setpoints and just a simple on/off controller loop updated at 1Hz.  Not terrible, but some PID action is probably needed.

 * http://ohm.bu.edu/~hazen/ToasterOven/tests/set_160.png
 * http://ohm.bu.edu/~hazen/ToasterOven/tests/set_210.png
