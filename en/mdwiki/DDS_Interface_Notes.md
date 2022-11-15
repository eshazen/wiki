# DDS_Interface_Notes
### Use Onboard 25MHz Crystal Oscillator as REF_CLK

 * Remove C51 and C52 on top of board. Both are 0402 .1uF.
 * Populate R4 and R11 with 0402 0 Ohm Resistors.
 * Switch jumper W7 to XTAL to allow the input of REF_CLK to come from a crystal.
 * You can probe TP22 to see XTAL_OUT if everything is working.

back to [DosiSoftware](DosiSoftware.md)

