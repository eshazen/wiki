# RoblyerDOSIRackMountOlderNotes
## Notes

*Clocks:*  Currently clocks run from mezzanine to carrier for ADC e.g. on H4/H5 (CLK0M2C).
This should be OK for the !PicoZed FMC board too.

## ADC ECO List

 * Change R25 to 20k
 * Connect `PWR_EN` to `VADJ`
 * Swap inputs and outputs on U11
 * Either remove PRSNT_M2C signal or connect JTAG TDO-TDI for bypass (jumper?)

### DDS ECO List

 * AGND to DGND needs a jumper!
 * Fix the `PWR_EN` somehow to supply 5V?  Suggest U5/U6/U3/U12 (5V input) all default to 'on' while `PWR_EN` just controls U2 and U4.
 * Serial interface changes:
   * Assign 'SPARE' (LA04_N) as "device select".  Route to one `nCS`, invert to other.  Wire to mux to select MISO output.

### Carrier ECO List

 * Slots 2, 3, 4 for DDS need LA02 and LA04 wired while on carrier LA02 and LA03 are wired.
 * Add level shifters on SPI for the Si5340 from 2.5V to 1.8V
 * Level shifters on FTDI serial are reversed!
