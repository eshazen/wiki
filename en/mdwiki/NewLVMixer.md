# NewLVMixer
Up:  [ElbatTOF2017](ElbatTOF2017.md)

The low voltage pulser/mixer produces a low voltage pulse to drive the e-gun.

 * SVN:  http://gauss.bu.edu/svn/tof-system/Hardware/lv/
 * Photos: http://ohm.bu.edu/~hazen/elbat_tof/Photos/2018-09-13/lv/

There are 3 inputs:

 * Adjustable voltage on BNC input from quad power supply box (0 to -5V ??)
 * Adjustable voltage on "200V" from TOF box, but actually operated over smaller range (0 to -25V?)
 * Pulse control on DB-15 (11,12) from TOF box (10k negative ECL logic)

The existing circuit is rather complex but could likely be reproduced.  Too bad we've lost Bill's schematic.
It would be very helpful to observe it in operation and measure the waveforms and voltages.

