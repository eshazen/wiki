# RemoteSolenoid
This is a project to develop a simple remote control for a solenoid inside a vacuum chamber.  The proposal is to use an Infrared remote control with an Arduino and a power MOSFET to drive a 6V solenoid.  The system would be powered by 4X AA batteries inside the vacuum chamber.

 * SVN:  http://gauss.bu.edu/svn/bifano-lab-misc

The following items have been purchased:

 * AA battery holder [Amazon](https://www.amazon.com/dp/B07T7MTRZX/ref=cm_sw_em_r_mt_dp_U_29XeFbH06HK9T)
 * Arduino prototype shield kit [Amazon](https://www.amazon.com/dp/B082W7S6PZ/ref=cm_sw_em_r_mt_dp_U_v-XeFb256N2H7)
 * IRF520 MOSFET driver module [Amazon](https://www.amazon.com/dp/B01I1J14MO/ref=cm_sw_em_r_mt_dp_U_Y-XeFbN0KQ3M5)
 * Infrared remote and receiver [Amazon](https://www.amazon.com/dp/B07J2PWNWF/ref=cm_sw_em_r_mt_dp_U_v.XeFbG03G26H)
 * 5V Solenoid [Amazon](https://www.amazon.com/dp/B07Z3K8LJZ/ref=cm_sw_em_r_mt_dp_U_haYeFbWDV6RTP)

Work log:

*2020-07-18*

Fired up the remote control with 5V lab supply and output to scope.  Here's a typical coded burst from pressing the '1' key on the remote (they're all the same except for some code details).  In this case there is a ~9ms start pulse, a bunch of code, then two gaps followed by additional start pulses with a short ~700us pulse after.  This is 25ms/div.


| <a href="http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/pix/scope_25ms.jpg"><img src="http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/pix/scope_25ms.jpg" width="300"></a> | <a href="http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/pix/scope_25ms_2.jpg"><img src="http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/pix/scope_25ms_2.jpg" width="300"></a> | <a href="http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/pix/scope_5ms.jpg"><img src="http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/pix/scope_5ms.jpg" width="300"></a> |
| -- ------------------------------------------------------------------------------------- ------------------------------------------------------------------------------- ---------------- | -- --------------------------------------------------------------------------------------- --------------------------------------------------------------------------------- ---------------- | -- ------------------------------------------------------------------------------------ ------------------------------------------------------------------------------ ---------------- |
| In this case there is a ~9ms start pulse, a bunch of code, then two gaps followed by additional start pulses with a short ~700us pulse after.  This is 25ms/div. | Sometimes (randomly) there is only one additional pulse. | Zoom in to 5ms/div.  Seems to be a simple FM code at about 450 baud. |

Simplest possible case is just to detect the start pulse (say, anything > 5ms) and then go dead for maybe 250ms to avoid re-triggering.  We could also get fancy and decode the bits if he wants to do anything with different buttons.

OK, forget all that.  Let's just use an existing library.

Writing some code.  Using an Arduino UNO with Arduino 1.8.12, library "IRremote" by shirriff version 2.2.3. ([github link](https://github.com/z3t0/Arduino-IRremote)).

Working code:  http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/software/IRReceiver/IRReceiver.ino

This decodes all the buttons but only fires the solenoid when the "1" is pressed.  See [photo](http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/pix/finished.jpg) and [movie](http://gauss.bu.edu/svn/bifano-lab-misc/SolenoidRemote/pix/demo.mov).





