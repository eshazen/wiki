# DeadProjects
This page will document a biological compound sensor being
developed for the research group of Profs. Mohanty and Eramilli.

This device will use a proprietary sensor chip to measure the
concentrations of various biological compounds in an aqueous solution.

## Open Issues

 * Mechanics - connector type and pinout for cell connection
   * See [CAD drawing](http://joule.bu.edu/~hazen/BioSensor/multisideshow.pdf)
proposed 8-device prototype.  What are the units?

## Prototype 1 Specifications

 * Generate a fixed AC stimulus signal of 10mV at 17Hz (sinusoidal)
 * Provide a DC bias for *'V(DS)* on which AC stimulus is superimposed
with a range of -2V to +2V.  Set in 5mV or smaller steps,
absolute precision to 1mV desirable.
 * Provide an analog switch to route the above *'V(DS)* combined
AC/DC signal to one of eight electrodes.
 * Output a separate DC source for *'V(GS)* with same
specs as for *'V(DS)* above.  This will set the potential of
an electrode immersed in the solution.
 * Provide two additional side-gate bias voltages with an output
range of -5 to +5V (Precision?  Step size?)
 * Provide eight analog switches for each side-gate bias voltage
to route the above signals to the desired device.
 * Measure the DC and AC currents through the sensor.  The AC current will
be measured using a phase-sensitive detector, converted to a DC signal,
and digitized with an ADC.

Future versions may also have
variable frequency and amplitude for the AC stimulus.

## Analog Circuit Implementation

The analog interface electronics will be implemented on a custom PC board
which will have a connector on which the sensor cell can plug directly.

Please refer to the
[block diagram](http://joule.bu.edu/~hazen/BioSensor/proto_block.pdf)
The blue lines show the wiring on the device itself, or it''s mounting PC board.
The blue squares represent connection points to the electronics.

Four DC bias voltages are buffered and driven to the device as shown.  Three analog switches
for each of 8 devices allow bias signals to be selectively applied to one device at a time.

Readout is via a current-sensitive op-amp circuit, a phase-sensitive detector, DC
amplifier and ADC.

## Control and Interface

We currently plan to purchase an off-the-shelf embedded controller
and A/D interface board.  See links below for some likely options.
We would provide software on the embedded computer to support
setting the analog switches and bias voltages, and measuring
the current with an ADC.

A simple TCP/IP server or USB equivalent would be provided,
with a very simple DEMO program running on a PC to show
functionality.

 * [TS-7260](http://www.embeddedarm.com/products/board-detail.php?product=TS-7260)
from technologic systems looks like a good bet.
 * [TS-ADC16](http://www.embeddedarm.com/products/board-detail.php?product=TS-ADC16)
 board would provide DAC (12-bit) and ADC (16-bit) and digital I/O functions &ndash;
[preliminary manual](http://joule.bu.edu/~hazen/BioSensor/TS-ADC16%20FPGA%20registers-v2.pdf)
 * [TS-9700](http://www.embeddedarm.com/products/board-detail.php?product=TS-9700)
alternative I/O board with 12-bit DAC/ADC functions.



