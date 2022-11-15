# QuadPulserRev2ToDo
Nav: [QuadPulser](QuadPulser.md)

### Notes 9/7/17

*!Layout/Schematic - Critical*

 * Move FMCCLK2 pair to LA29 (G30/G31) of FC (Done HL)
 * Update footprint on flash to match drawing (Done HL)
 * Delete spurious trace/via to left of P1-7 (Done HL)
 * U21 needs a pin 1 mark (Done HL)
 * Fix FPGA footprint.  Should have .016 diameter pads, not .019.  See page 13 of this doc (we are using an FTG256 package) (Done HL)

https://www.xilinx.com/support/documentation/user_guides/ug1099-bga-device-design-rules.pdf

 * All thru-hole component pads must have thermal relief on all planes (Done -Eric)
 * Solder mask openings are too big on most components.  It seems as if the openings are .004 larger per side, .002 is preferred.  (Done - Eric)
 * Silkscreen text needs a quick editing pass to remove overlapping text here and there (Done - Eric)

*BOM Issues*

 * Specify VQFN package for level shifters (LVC8T245) (Done HL)

*Desired*

 * What is with the resistors on the mounting holes?  They should be plated-thru holes (normal pads) just connected to the ground plane.  Please delete R165...R170 and ground MH1-MH6. (Done HL)
 * Why are C1 and C2 different sizes? (Done HL)


### Older Notes

 * ADC clock must be external (from FMC) OK
   * Probably should have jitter cleaner OK
 * Check FMC pinout for compatibility with FMC on Enclustra base board for tesing: [PM3 Manual](http://download.enclustra.com/public_files/Base_Boards/Mars_PM3/Mars_PM3_User_Manual_R5.pdf) OK
 * Silkscreen should have "edf.bu.edu" OK
 * Check clearance on power planes, should be at least .010 from pads and traces
