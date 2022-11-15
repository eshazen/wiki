# ELBAT_LVMixer_RevB
 * change schematic to reflect polarity of C1 (capacitor on supply voltage). With a negative supply, + is GND

-Fix Testpoint footprints (move to 1/10").

-Change value of feedback resistor between pins 1&2 of U1 (LM6134) to 3900pF.[BR](BR.md)-Get proper values for potentiometers RV1&RV2 from ELBAT lab.

-Fix orientation of outputs on U5 (DCP2121DU) schemtatic, most positive outputs go on top.

-Move TP6 left of diode D8, it should measure the node labeled "current source".

-Remove +12V supply and LED circuit

-Change the value of R24 (on output of U3 LM7171) to 1Kohm.
