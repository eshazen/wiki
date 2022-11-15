# ELBAT_HVPulser_RevB
 * Pins on U3 (IK121SA) must be flipped 180 degrees, also fix pad & pin numbering so it reads left to right on PCB. Also, on schematic inputs go on the left.
 * NOTE: U11 and U10 are inverting (UCC27518), Edit the schematic and footprint to reflect this.
 * (SI8610EC-B-IS) was assumed to be an inverter but it is not.
 * Swap R14(3K) for a 470Ohm resistor to fix current supplied to current sink. R14 is on emitter pin of Q2 (SMMBTA92L)
 * current supply(HV_ON) in original design supplies ~7mA, this has to do with current draw from clamping diodes not present in the revision of the design, look into adding this component to the circuit and seeing how it affects the output waveform.
 * Fix Testpoint footprints (move to 1/10").
 * Remove +12V supply & LED circuit.
 * Merge GND & GNDREF planes

Checked all, seems ok.
