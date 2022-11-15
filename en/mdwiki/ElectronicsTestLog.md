# ElectronicsTestLog
Goto [ThermalNeutronDetector](ThermalNeutronDetector.md) &bull; [PreampDesign](PreampDesign.md) &bull; [NeutronElectronicsDatabase](NeutronElectronicsDatabase.md) &bull; [ElectronicsTestLog](ElectronicsTestLog.md)

*'2012-02-28 (eric and sam)*

Looking at USB transfer speed.  Special firmware which sends 32k bytes (actually 0x8002) on request.
Software which reads a large number (1000) of such blocks, calculates checksum, and calculates speed in bytes/sec.

Result:  ~ 4Mbytes/sec (10x slower than advertised)

Details, based on scope on "WR" from FPGA to USB chip:

 * First write is 1024 bytes (USB chip FIFO size)
 * Subsequent writes are ~512 bytes, separated by ~ 20us
 * after a group of 8 such writes, a long delay of ~900us is seen

*'2011-03-30 (hazen)*

Just discovered that the termination resistor on the readout board for the test pulse is 50k, not 50 ohms!
All input pulses are 2X larger than advertised on the front panel of the pulser.

*'2011-03-29 (hazen)*

Testing new preamp with LMP7721 op-amp.  Didn''t work at all initially.  Hypothesis is that the op-amp needs a negative supply.  Modify a board to connect the negative supply pin on the op-amp to the negative power input, and test the board at +/-2.5V.  It works!

Also note that the pulser was set at a repetition period of 1us which is way too fast.  1ms is more appropriate for testing.

*'2011-01-05 (hazen)*

R4 and R16 changed by Sam on second amp; offset now at the few mV level as expected.

*'2011-01-04 (hazen)*

2nd Pre-amp with x5 gain reduction looking good.  However, there is 400mV (!) DC offset on 50 ohm output.

Measure U3-1 (2nd stage output) < 4mV (hmm).
Measure U4-1 (3rd stage output) 800mV!
U4-3 is also at 400mV!  (oops, R16 at 650k is way too big).

*'R16 and R4 should be 650 ohms* (not k ohms).



*'2010-12-14 (hazen)*

Performed [ECO](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto1/preamp_ECO.pdf)

Hooked up to oscilloscope, pulse generator in through 20dB attenuator to test input.  Power up.  Boar is getting hot, why?

Output is shorted to GND.  Try to remove PCB... such a tight fit on the standoffs that this is not practical.
Move preamp and output cable to channel 2.

Change R21 to 51 ohms.  Output looks very nasty with 50 ohm scope input... switch to 1M AC for now.
Reasonably clean 100mV step output for 10mV * 1pf input.  Bill''s calculation was 8.3mV/fC.  So, we would expect 83mV.  Not bad!

Noise measured by taking line-triggered sweeps, reading ''rms' math function on scope at various sweep speeds.  It is pretty consistently 9-10mV which is about 1fC (6000e) RMS.  Not bad given the poor shielding, etc.  There is 60Hz noise at least an order of magnitude larger, which seems unrelated to whether the box is open or not.  I suspect grounding issues...

Wiggling short output lemo cable causes bad things to happen.  I suspect the cable has an intermittent open or short in it.  Done for today.

To Do list:

 * Enlarge stand-off holes so board comes in and out easily
 * Fix short to GND on channel 1 output on readout board
 * Change resistor on readout board (R21) from 49.9k to 49.9 ohms (51 ohms ok too) -- *'Done, but update doco*


