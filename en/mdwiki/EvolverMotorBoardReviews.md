# EvolverMotorBoardReviews

*Design Review* 8/5/20:

 * Blank is permanently disabled.  That's probably OK.  What will the power-up state of the PWM controller and the H-Bridge drivers be?  Please ensure that the motors cannot power up when the board is initially powered.
 * Somehow need to label the silkscreen the strings "eVOLVER" "Motor Board" "Rev A" and "edf.bu.edu" in a legible size.  Ideally on the front.  Good luck!

*Design Review* 8/3/20:

 * Please actually make these changes to the copper area settings:
   * adjust the copper fill settings for GND to:  Clearance=0.007 Minimum width=0.007  Antipad clearance=0.01 spoke width=0.01
 * Why is there a note "Omit all 0603 Footprints" on the back silkscreen?

*Design Review* 7/30/20:

 * I think the pin assignments on the new package for H-bridge are wrong.  *This needs to be fixed before reviewing much more of the layout*.
 * Worried about narrow neck of +24V on In2 near 3V3 pin.
 * For the `PMODE` jumper I was thinking of 2x 0402 sites with a zero-ohm resistor on the BOM to connect it to GND.  If you remove the big 3-pin header then there is room to wrap the +24V plane across the top which would help with the previous concern.
 * ADC connector would need a GND to be useful, and maybe 3V3 too.  It could be a 2mm pitch if that helps.  We should really check with Brandon if he would ever use it.
*


*Design Review* 7/29/20:

 * Just out of curiosity, why did you use the larger HTSSOP package instead of the smaller VQFN package?
 * The ground plane is sliced up by the clearance around the thermal vias on the DRV chips.  Proposed changes:
   * reduce the number of thermal vias to a 3x3 array.  We are not running these chips near max power
   * adjust the copper fill settings for GND to:  Clearance=0.007 Minimum width=0.007  Antipad clearance=0.01 spoke width=0.01
 * There are several DRC errors "track near pad" in my Kicad 5.0.2
 * DRV8876 recommends "bulk capacitance" on V(M).  We should put at least an 0603 site or so on the board for this on +24V.
 * C13 etc are supposed to be "low ESR" types.  I couldn't find any data on ESR for this series (Murata GRM)
   * Maybe substitute 445-5932-1-ND
 * For flexibility, connect PMODE on all drivers (together) to solder jumpers to VCC and GND, with a default connection to GND via zero ohm R
 * Silkscreen text too small to be legible.  I don't see a good fix for this, and I guess we treat the silkscreen (in PDF form) as an assembly drawing.
