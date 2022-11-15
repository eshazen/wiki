# TofPCBComments27Nov2019
PCB design / layout comments (mark when finished)

## Preamp

 * Schematic incomplete

## LV Mixer

 * Small changes per lab meeting
 * Perform PCB layout

## HV Pulser

 * Remove the LMG1210 and all associated passive components.  Replace with circuit below.

<img src="http://ohm.bu.edu/~hazen/elbat_tof/2019/hv-driver.png">

 * Increase silkscreen text height to 0.05 or 0.06
 * Add mounting holes
   * put on 0.25 inch grid
   * 0.25 inch dia pad, 0.15 inch diam hole

## Filament supply

 * Ground the coax shields on the schematic
 * Add a 10k resistor between the + and - output connectors
 * Please add a connector for remote monitoring of voltage/current.

I suggest a DB-9 female connector mounted on the PCB edge with pinout
as follows (so a twisted pair cable can be used):
```
1 - output+ (J4 center) (through 100 ohm resistor)
2 - output- (J3 center) (through 100 ohm resistor)
3 - -VDC (through 100 ohm resistor)
4 - P2 (pot wiper) (through 100 ohm resistor)
5-9 - GND
```
 * Choose a panel meter (2-1/2 or 3-1/2 digits is fine) and figure out
how to power it and add appropriate pins to J5

 * Fix the mounting holes:
   * put on 0.25 inch grid
   * 0.25 inch dia pad, 0.15 inch diam hole

 * All silkscreen text is too small and mostly too close to components
   * On a large, non-crowded board like this, use ~ 0.08 inch (please set to inch settings) height text and move a bit away from components to easier to read.
