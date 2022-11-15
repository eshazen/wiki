# MainGerberNotes
# Schematic Notes

Please change polarized capacitor symbols to non-polarized symbols where ceramic caps are used.
C1,C3,C10,C12,C15,C19,C105 *'(Completed)*

Please check polarity, and
C7,C8,C93,C94,C95,C96,C97,C98,C99,C103,C136,C137 *'(Completed)*

Should HV op-amps have low-frequency bypass caps per
[Application Note 1](http://www.cirrus.com/en/pubs/appNote/Apex_AN01U_F.pdf)

# Layout Notes

## Second Check (5/28)

Remove all "Preliminary" indications

Fix silkscreen spelling "Cation High Voltage".  *'(Completed)*

U21 has pads and solder mask openings on both top and bottom - remove bottom items *'(Completed)*

## First Check (5/16)

Remove ground plane isolation on HV region *'(Completed)*

Add smaller isolation with ~ 200 mil clearance around HV thru-hole pins/components. *'(Completed)*

Information block on DRD layer should have this additional information: *'(Completed)*

```
  PART#:  	STM-Z08
  REVISION:     B
  LAYERS:       4
  THICKNESS:    0.063
  MATERIAL:     FR-4
  FINISH:       Sn/Pb Solder

```
Solder paste layers (SPT, SPB) are missing.  They may not be used,
but should be included. *'(Completed)*

Please change the labels along the top of the board for the copper layers
as follows: *'(Completed)*

```
  TOP -> LAYER 1
  GND -> LAYER 2
  INNER1 -> LAYER 3
  BOTTOM -> LAYER 4

```
The "Label???" for connector P12 should be "SERIAL INTERFACE". *'(Completed)*

On silkscreen, please move pin numbers for QFPs (U10,U29,U31)
outside the footprint so they can be seen after the part is soldered. *'(Completed)*



