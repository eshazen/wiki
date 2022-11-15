# ADCLayoutComments
## ADC Board Layout Notes

### Items to be Checked

 * To be added...

### Required Changes

 * Add level shifters on signals RESET, SEN, SCLK, SDATA, SDOUT and GAIN0...GAIN5.

 * Traces on bottom should pass only over GND plane, not A3.3V. Can fix this by making a change to the A3.3V/GND boundary.  [Eric 10/24/17]

<img src="http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/ADC/notes/pix1.png">

 * Part number on balun (T1) is wrong; change from CX156NL to CX2156NL. !DigiKey catalog number 553-1499-ND is correct.

 * Change value for C10 from "OMIT" to "0.1uF".

 * Add zero ohm resistor between AGND and GND nets.  This should span the AGND/GND split near U1.
