# RevAChecking

 * (Checked pinout/orientation/spacing of FE/VFE connectors vs FE/VFE gerber/schematic - OK)
 * Recommend changing all copper area min width and clearance to 0.007
 * U7 has wrong footprint.  ST715MR is SOT23-5, while the board is SOT223-5.
 * U9 and U14 (TPS72010) bias voltage must be at least 2.5V, not 2.2V

Gerbers

 * Soldermask appears to be 8 mils over pad size on both sides which is way too big
 * Suggest to increase outline of VCCInt zone on F.Cu to follow outline of similar zone on In4.  This will give better coverage of a few vias near the bottom of the area.
 * Does U5 (JTAG connector) leave enough space to plug in a cable with the SPF cage installed?
 * Various cosmetic issues with silkscreen (overlaps, etc)
 * remove the "PRELIMINARY" label :)




