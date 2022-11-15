# RoblyerDOSIPortable
This page has information from 2022 on production of an additional 10 units for clinical tests.

In early 2022 we placed orders for full sets of parts for 10 systems, including the PicoZed Zynq modules.  As of 9/1/22 there are quite a few parts with very long lead times (see [Google doc](https://docs.google.com/document/d/1aYw62dYNRXWGI0C459B6jITdd1jEgigorsL1qB_4sPY/edit?usp=sharing)).  After a meeting it was decided that we would try to design for replacements for the hard-to-source parts and move forward with a one-time build of 10 systems.

A key issue is the availability of the PicoZed; as of this writing the lead time is uncertain.

## Reference

 * SVN (firmware): https://gauss.bu.edu/svn/roblyer-ddosi-rack-mount.firmware/
 * Google doc (backorder parts):  https://docs.google.com/document/d/1aYw62dYNRXWGI0C459B6jITdd1jEgigorsL1qB_4sPY/edit?usp=sharing
 * Matt's excellent document: https://ohm.bu.edu/~hazen/DOSI/dDOSI_Gen2_Documentation%20(3).pdf
 * See [RoblyerDOSIRackMount](RoblyerDOSIRackMount.md) page for documentation on file locations, etc

## Development Log for 2022/2023 systems

*2022-09-01*

 * Clocks used:  50MHz and 250MHz only.  *NOTE* These come from _different oscillators_ so they aren't exactly frequency-locked.
 * ADC:  samples at 250MHz, transfer data DDR at 500Mb/s
 * Zynq interface to registers is based on an early implementation of `/dev/uio` with 5 devices (ADC, DDS0..2, GPIO).




## Ideas for re-engineered new system

(this is on hold for now)

 * Several lasers (6?) with fixed modulation frequencies
   * Frequency for each laser offset by ~7MHz from the next
   * Power ~10mW, but constant power (modulated by photodiode signal)
   * Programmable modulation power
 * Two channels of ADC for reference and signal
   * Existing system uses the ADS42LB69 (dual 250MSPS 16-bit ADC).  These are in stock at $300 each
   * Power consumption 820mW/ch (so 1.6W for two channels)

ADC Alternatives:

 * ADC16DV160CILQ/NOPB-ND - 160MSPS, half the price.  Power 1.3W total.  DDR output so 16 pairs LVDS. (same as current ADC)l
*
