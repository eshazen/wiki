# eVOLVER_Gen2_Changes

## Modifications to Motherboard

### Schematic changes

 * *Add 8th SA board slot*

 * Currently M1 is different from all the others in that it has only a PWM board.  Add an ADC board (maybe call it M1a) and wire it just like the other pairs (M2, M3) (M4, M5) etc.

 * *Expand ribbon cable headers P1...P16* from 14 to 16 pins with extra pair connected to M1a.  _Check with Brandon about pinout_

 * Also, _Move ribbon cable headers to back_ of board.

*Change power input scheme*

 * Currently there is one power input per mezzanine board via P31. Change this so that there are two high-current inputs (+5V and +24V). Each mezzanine site would have a two-position plug jumper to select the voltage it receives.
   * e.g Jumper plug DigiKey# 952-2749-ND with sockets ED5019-ND (3 used)

 * Input may be on mini-fit connector as now or possibly a PCB mount terminal strip with screw terminals.

 * Add 4x micro-USB connectors with only GND, 5V connected to power Raspberry Pi and other things (_check with Brandon for position on board_)

 * *Add address resistors* to board for each Arduino (talk to Zach)

 * *Replace DE-9* connector pair J2 with dual RJ-11 (sic. actually RJ14) connector
   * Use 6p4c type (4 middle pins of 6 populated) e.g. DigiKey WM9177-ND


### Layout Changes

(All changes required by schematic updates) plus:

Expand board outline to about 12.6 x 14.5 inches.

Move P1...P16 to back and place in array according to top plate drawing.

Place new connectors (USB) as specified by Brandon

