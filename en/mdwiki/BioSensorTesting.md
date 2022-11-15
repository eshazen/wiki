# BioSensorTesting
*'6/22/09 (hazen)*

Firmware updated to fix duplicate AC measurements and raw waveform readout
error.  Here is a summary of the precision under various conditions.
The precision is defined here as =sd/sqrt(N)= where =sd= is the standard
deviation of 100 successive one-cycle measurements, and =N= is 100.

```
                                              1 second
 Test R    V(s)     Gain    Meas R   Std Dev  Precision
  1.0M     10mV     0.1     1.00      1.2K    0.012%
  9.9M     20mV     0.1     10.4M     0.14M   0.14%
  24M      20mV     0.1     26.4M     0.9M    0.34%
  33M      20mV     0.1     37.M      1.9M    0.51%
  80M      20mV     1.0     82.M      15M     1.8%

```
There is no apparent systematic error (drift with time, etc) in the
measurements, so increasing the integration time increases the measurement
precision.  For example, if one measures for 100 seconds, one
would obtain a factor of 10 improvement in the precision.


*'5/22/09 (hazen)*

Oops.  Found that the waveform readout is flawed somehow.  Should only capture
_'one_ cycle of stimulus, not two.  Test by injecting an external waveform
at a frequency not equal to 100Hz, i.e. 163Hz.

Here is the result:
[Ext_WF_163Hz.gif](http://ohm.bu.edu/~hazen/BioSensor/TestData/Ext_WF_163Hz.gif)

Turns out that we get the same 128 samples twice.  Bill is working on it.

*'5/21/09 (hazen)*

## Initial test setup

```
   * Setup on bench
   * GigaWare USB/Serial cable to Eric''s Thinkpad T43 laptop running Ubuntu Linux.
   * BioSensor box lid not screwed on.
   * Daughterboard installed
   * Full lead length 1/4 resistors plugged into PGA socket.
   * No care for grounding/shielding.
   * Laptop operating on battery power.

```
## Raw waveform analysis with stimulus

Analysis done with [Root](http://root.cern.ch/)
[SinPlot.cc](http://ohm.bu.edu/~hazen/BioSensor/TestData/SinPlot.cc)
The script fits a sine function to the data and makes a histogram of the residuals.
The fitted function is:

```
   y = P(0) + P(1) * sin( P[2](2.md)*x + P[3](3.md)

```
 * 100k resistor, G=0.1, Stim=10mV
   * Raw data: [test_100k_10mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_100k_10mV.dat)
Plot: [test_100k_G0.1_10mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_100k_G0.1_10mV.pdf)
 * 1M resistor, G=0.1, Stim=10mV
   * Raw data: [test_1M_G0.1_10mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G0.1_10mV.dat)
Plot: [test_1M_G0.1_10mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G0.1_10mV.pdf)
 * 1M resistor, G=1.0, Stim=10mV
   * Raw data: [test_1M_G1.0_10mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G1.0_10mV.dat)
Plot: [test_1M_G1.0_10mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G1.0_10mV.pdf)
 * 4.9M resistor, G=0.1, Stim=10mV
   * Raw data: [test_4.9M_G0.1_10mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_4.9M_G0.1_10mV.dat)
Plot: [test_4.9M_G0.1_10mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_4.9M_G0.1_10mV.pdf)
 * 4.9M resistor, G=1.0, Stim=10mV
   * Raw data: [test_4.9M_G1.0_10mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_4.9M_G1.0_10mV.dat)
Plot: [test_4.9M_G1.0_10mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_4.9M_G1.0_10mV.pdf)
 * 10M resistor, G=0.1, Stim=10mV (actually 3 x 3.3M)
   * Raw data: [test_10M_G0.1_10mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G0.1_10mV.dat)
Plot: [test_1M_G0.1_10mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G0.1_10mV.pdf)
 * 10M resistor, G=1.0, Stim=10mV
   * Raw data: [test_10M_G1.0_10mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G1.0_10mV.dat)
Plot: [test_1M_G1.0_10mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G1.0_10mV.pdf)

Check calibration:

```
  10mV / 100k = 100nA.
  With G=0.1, sense R is 100k so we expect 10mV pk/pk at preamp output.
  After 100x amp, expect 1mV at ADC input.
  ADC is 2.5V full scale, 16 bits -> 2.5V / 65536 = 38.1uV per LSB
    10mV / 381.uV = 2.62e4 ADC counts pk/pk
  Root analysis for P[1](1.md)
  Root analysis for P[1](1.md)

```
Further, to convert to current

```
  for G=0.1, 38.1uV per LSB / 100 = 381 nV at preamp / 100k = 3.81 pA per LSB
  for G=1.0, 38.1uV per LSB / 100 = 381 nV at preamp / 1M   = 0.38 pA per LSB

```
Noise level:

```
  Root says RMS=261 ADC counts = 10mV at ADC input
  At G=0.1, 261 * 3.81pA = 994 pA or ~ 1nA

```
## Zero-signal waveforms

 * G=0.1, zero stimulus, Register 0 = 0x810 (select "none" for both inputs)
   * Raw data: [test_0.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_0.dat)
Plots: [test_0.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_0.pdf)
 * 10M resistor, G=0.1, 0mV
   * Raw data: [test_10M_G0.1_0mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G0.1_0mV.dat)
Plots: [test_10M_G0.1_0mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G0.1_0mV.pdf)
 * 10M resistor, G=1.0, 0mV
   * Raw data: [test_10M_G1.0_0mV.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G1.0_0mV.dat)
Plots: [test_10M_G1.0_0mV.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G1.0_0mV.pdf)

Histogram looks non-gaussian.

*'Improve grounding* &ndash; connect box lid and PCB to box GND.

 * 10M resistor, G=0.1, 0mV
   * Raw data: [test_10M_G0.1_0mV_gnd.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G0.1_0mV_gnd.dat)
Plots: [test_10M_G0.1_0mV_gnd.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G0.1_0mV_gnd.pdf)
 * 10M resistor, G=1.0, 0mV
   * Raw data: [test_10M_G1.0_0mV_gnd.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G1.0_0mV_gnd.dat)
Plots: [test_10M_G1.0_0mV_gnd.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_10M_G1.0_0mV_gnd.pdf)
 * 1M resistor, G=0.1, 0mV
   * Raw data: [test_1M_G0.1_0mV_gnd.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G0.1_0mV_gnd.dat)
Plots: [test_1M_G0.1_0mV_gnd.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G0.1_0mV_gnd.pdf)
 * 1M resistor, G=1.0, 0mV
   * Raw data: [test_1M_G1.0_0mV_gnd.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G1.0_0mV_gnd.dat)
Plots: [test_1M_G1.0_0mv_gnd.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G1.0_0mv_gnd.pdf)
 * 100k resistor, G=0.1, 0mV
   * Raw data: [test_100k_G0.1_0mV_gnd.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_100k_G0.1_0mV_gnd.dat)
Plots: [test_100k_G0.1_0mV_gnd.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_100k_G0.1_0mV_gnd.pdf)
 * 100k resistor, G=1.0, 0mV
   * Raw data: [test_100k_G1.0_0mV_gnd.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_100k_G1.0_0mV_gnd.dat)
Plots: [test_100k_G1.0_0mv_gnd.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_100k_G1.0_0mv_gnd.pdf)


Waveform data after grounding improvement (not much better)

 * 1M resistor, G=0.1, 10mV
   * Raw data: [test_1M_G0.1_10mV_gnd.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G0.1_10mV_gnd.dat)
Plots: [test_1M_G0.1_10mV_gnd.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G0.1_10mV_gnd.pdf)
 * 1M resistor, G=1, 10mV
   * Raw data: [test_1M_G1.0_10mV_gnd.dat](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G1.0_10mV_gnd.dat)
Plots: [test_1M_G1.0_10mV_gnd.pdf](http://ohm.bu.edu/~hazen/BioSensor/TestData/test_1M_G1.0_10mV_gnd.pdf)


## Noise Analysis

Bill has done some preliminary analysis of the expected noise level.
The estimate takes into account the thermal noise of the resistors, the amplifier
noise, and the bandwidth limit filter on the input of the ADC.


| Gain/Feedback | Input R | Vrms at ADC | ADC counts |
| ------------- | ----- - | ---- -- --- | --- ------ |
| 1/1M     | none  | 8.4 mV  | 220 |
| 1/1M     | 10M   | 8.8 mV  | 231 |
| 1/1M     | 1M    | 11.9 mV | 312 |
| 1/1M     | 100k  | 28.6 mV | 750 |
| 0.1/100k | none  | 2.72 mV | 71  |
| 0.1/100k | 10M   | 2.73 mV | 71  |
| 0.1/100k | 1M    | 2.86 mV | 75  |
| 0.1/100k | 100k  | 2.91 mV | 76  |

An attempt at a general formula is as follows:

```
  Vo = 0.5859 * sqrt( (1+(G/R))^2 + 204.5*G + 204.5*(G^2/r) )

```
Where

```
  Vo = mV rms at the ADC input
  R = measured resistance in Megohms
  G = gain, 1 or 0.1

```


Measured values are significantly higher than expected; work on grounding.



