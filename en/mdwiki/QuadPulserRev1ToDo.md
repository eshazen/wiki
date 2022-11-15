# QuadPulserRev1ToDo
[QuadPulserRev1DebugLog](QuadPulserRev1DebugLog.md)

## Issues on prototype

 * Resistor wrong on -1V regulator (should be 20k not 2k)
 * Enables not connected to +V on LDO regulators (3.3V, 4V)
 * Missing cap on output of 3.3V LDO
 * ADC "reset" signal wired to incorrect pin on FMC connector
 * Clock must be AC-coupled to ADC (with 100 ohm term upstream)

## To Do list

(new items added at top)

 * Move L1 to the front.  It is likely to run into the carrier board on the back. OK
 * The input connectors should not be marked "U1" etc but "J1" or "P1" etc OK
 * The silkscreen text still needs some cleaning up, maybe Dan can say something about this. OK
 * On the back, the oscillator is too close to other components IMO
ok


 * Op-amp (THS4509)
   * Footprint, pinout OK
   * Need solder mask opening on center / thermal pad? OK
   * Add pin 1 mark (circle) on silkscreen between pins 1 amd 16 OK

 * ADC chip
   * See [adc_traces.jpg](http://ohm.bu.edu/~hazen/G-2/QuadLogic/pcb_review/adc_traces.jpg)OK
     * No traces wider than pads OK
     * No traces between pads and thermal pad OK
     * No traces or any other copper between pads OK
   * Add component body outline on silkscreen OK
   * Add pin 1 / orientation mark on silkscreen OK
   * LVdd is a long skinny trace.  Should be wider (25-40 mils) OK
   * Add traces from GND pins to thermal pad. OK
   * Ensure thermal pad is connected to GND, looks like it might be 3V3 now! OK
   * pins CFG1-4 and PDN are configuration pins we're not using and are GND.  This is OK, but they should have traces maybe 100-200 mils away from the chip to vias (one shared via is OK) so if we've messed up we can cut the traces and wire them to something else. OK
   * Solder paste layout on ADC thermal pad per data sheet OK-ish

 * U13 and U16 (regulators)
   * Shrink solder paste opening a bit away from other pins (check data sheet) OK

 * U12 (dc/dc dual output)
   * Move TP1 away from part OK
   * Check data sheet for solder mask and solder paste recommendations
     * "SOlder mask defined" (SMD) "Non solder mask defined" (NSMD) pad types | It didn't look like the datasheet said anything so I went with NSMD
   * double check if it's a BGA (with solder) or LGA (no solder) type package | Only available in LGA; LTM8045 (Neg. Converter) available in BGA

 * General
   * make all copper area boundaries on grid and separations all ~ 15 mils OK
   * Add mounting holes in front corners of board OK
   * Route SEN above power connector OK



