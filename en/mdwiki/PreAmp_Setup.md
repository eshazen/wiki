# PreAmp_Setup
# Pre-Amp Setup
[BR](BR.md)There are two relevant features for control of the Pre-Amp, The gain dictated by the ratio of feedback resistor R12 over input resistor R3 and the threshold voltage dictated by the adjustment of the potentiometer RV2.

## Gain
[BR](BR.md)As shipped, the value of R12 is 4.3 kOhm and the value of R3 is 432 Ohm, this provides a gain of about 10. It may be necessary to raise or lower this gain based on the output of the Multi-Channel Plate. To make this adjustment it is best to only change R12 and leave R3 fixed at 432 Ohm.

## Threshold
[BR](BR.md)Setting an appropriate threshold voltage is critical to the proper usage of the Pre-Amp. The threshold voltage is controlled by adjustment of the potentiometer RV2. This voltage should rest below the peak of the MCP output but above the flat/ambient output of the MCP. The current potentiometer has 15 turns between 0 and 100 Ohms of resistance, this provides fine resolution between 0 to 200mV of threshold voltage. If during setup the threshold voltage needed is close the bottom boundary of this range, then RV2 may be swapped for a potentiometer with a lower max resistance in order to get even greater resolution. If during setup the threshold voltage needed is close to or above the top of this boundary, then RV2 may be swapped for a potentiometer with a higher max resistance in order to get a greater range of adjustment. The following formula can be used to determine the max range of the threshold voltage (the bottom of this range will always be 0).
[BR](BR.md)Vmax = 1.2V * (Rmax Ohm / (Rmax Ohm + 500 Ohm))

## Bypass
[BR](BR.md)If the gain of the MCP is sufficient to ignore the gain of the Pre-Amp, solder a wire between the two pads of the through-hole resistor footprint R13 and connect the MCP to BNC J2 (labeled TTL in onboard). This will bypass the gain of the Pre-Amp and directly pass the MCP output to the input of the Discriminator U2. It will still be essential to set an appropriate threshold voltage.
