# PMT_HV_Test_Software
This page documents an automated test setup for evaluation of prototypes.

### Long-Term Stability Test

This is a simple test to verify the long-term stability of the HV generator and feedback circuit.  The plan is to connect the HV monitor output to a high-precision volt meter to measure the DC stability, and to a digital oscilloscope to check for AC transients.

*'Code Outline*

 * Initialize GPIB interface and instruments
   * Volt meter:  disable internal trigger, set to maximum resolution
   * Oscilloscope:  Set to AC coupling, maximum input gain, segmented readout of 1k sample waveforms, AC trigger with low threshold
 * Every 1 second:
   * Take AC and DC voltage readings with meter
   * Poll oscilloscope for number of triggers and readout if necessary
 * Every minute
   * Trigger oscilloscope by software and readout

*'Equipment*

 * [HP 3748A](http://ohm.bu.edu/~hazen/DataSheets/HP/HP3748A.pdf)
 * LeCroy WaveRunner LT584 Oscilloscope ([Programming Manual](http://ohm.bu.edu/~hazen/DataSheets/LeCroy/WR2_RCM_RevB.pdf)
   * [LT584_Programming_Notes](LT584_Programming_Notes.md)
 * [GPIB Ethernet Interface](http://prologix.biz/)

*'GPIB Interface*

This device provides access to the GPIB (aka IEEE-488) bus used by many instruments for remote control.  See
[users manual](http://prologix.biz/getfile?attachment_id=1)
128.197.43.84 (freud.bu.edu).  See sample program
[volt_meter.c](http://ohm.bu.edu/~hazen/LBNE/software/volt_meter.c)
download to a linux machine (i.e. ohm):

```
  $ wget http://ohm.bu.edu/~hazen/LBNE/software/volt_meter.c
  $ make volt_meter
  cc     volt_meter.c   -o volt_meter
  $ ./volt_meter 128.197.43.84
  Voltage: +05.1110E+0
  Voltage: +05.1110E+0
    ...
  $

```
