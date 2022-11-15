# AtlasMichiganMezzCard
This page documents a new mezzanine card design for ATLAS MDT chambers.  This mezz card will use the original BU/Harvard MDT-ASD chips and new TDC ASIC developed by the University of Michigan.

## !User/Programming Documentation

 * [MezzNgMicrocontroller](MezzNgMicrocontroller.md) -- microcontroller *protocol details*
 * [MezzNgBreakoutBoard](MezzNgBreakoutBoard.md) -- documentation for small breakout board used for initial programming / testing
 * [MDT-ASD Configuration](MDT-ASD_Configuration.md) -- ASD configuration details
 * [MezzNgTestLog](MezzNgTestLog.md) -- debugging info

## Design Issues

From Markus Fras, e-mailed 6/1/2017:
```
These are the signals I found inverted:
- BCR
- CLK
- TDC_OUT0
- TDC_OUT1

If You look at the 40-pin connector, the *p and *n lines are swapped compared to the MDT316 card.
```

## Board Inventory

Unfortunately did not update this when shipping out boards :(


|=S/N=|=Location=|=Firmware=|=Notes=|
|-----|----------|----------|-------|
| 1 | Mich | 1.2 | TDC installed, seems ok |
| 2 | Mich | 1.2 | TDC installed, seems ok |
| 3 | Mich | 1.2 | TDC installed, seems ok |
| 4 | Mich | 1.2 | TDC installed, seems ok |
| 5 | AZ | 1.2 | TDC installed, seems ok |
| 6 | AZ | 1.2 | TDC installed, seems ok |
| 7 | BU | 1.2 | Damaged in shipment:  repaired but no J400 |
| 8 | BU | 1.2 | TDC installed, seems ok |

Guessing that 9, 10 were sent to U of M on 2/6/17.
S/N 7 was sent to AZ and damaged in shipping.  Repaired by Chris,
but uC programming connector J400 is irretrievably damaged.

In 5/2017, S/N 1-6 were sent to Michigan and Arizona


## Design Files

 * 2016-12-20 (As Built)
   * [SVN Link](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Hardware/MichMezzBoard/AsBuilt/) for "As built" design files
     * [MEZZNG_V1_sch.pdf](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Hardware/MichMezzBoard/AsBuilt/DES/MEZZNG_V1_sch.pdf) -- schematic
 * 2016-12-06
   * [schematics_draft_2016-12-06.pdf](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/schematics_draft_2016-12-06.pdf) -- Updated schematic
   * [MEZZNG_REV0_2016-12-06.zip](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/MEZZNG_REV0_2016-12-06.zip) -- Updated OrCAD design
 * 2016-12-05
   * [schematics_draft.pdf](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/schematics_draft.pdf)
   * [MEZZNG_REV0.zip](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/MEZZNG_REV0.zip) -- OrCAD design
   * [MEZZNG_REV0_BOM.xls](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/MEZZNG_REV0_BOM.xls) -- BOM notes

## Reference Documents

 * [tdc_v2_2017-04-10.docx](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/tdc_v2_rev_2017-04-10.docx) -- Data sheet for new TDC (ref "TDC1" on schematic) including package drawing and pinout (rev 4/10/17)
 * [MDT_TDC_config_note.pdf](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/MDT_TDC_config_note.pdf) -- New TDC Configuration note

 * [MDT.08.pdf](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/prod_info/MDT.08.pdf) -- Parts list for old design (use for P/N details)
 * [MDT446](https://physics.harvard.edu/websites/lppc/atlas/mdt_elx/octal_mezz_info/MDT446/) -- Design files for existing Mezz design
 * [ASD_Protection.png](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/ASD_Protection.png) -- details of input protection subcircuit

## Design Notes

 * Layout should respect dimensions given in this drawing:  [mdt-446-dimension.pdf](https://physics.harvard.edu/websites/lppc/atlas/mdt_elx/octal_mezz_info/MDT446/mdt446-dimension.pdf)
 * All passive components can be 0402 size unless otherwise indicated
 * Referencing [drawing](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/MDT446_top_mark.png), place/route in red (analog) area should be kept as close as practical to the original layout.  The green (digital) area may be expanded as suggested to fit new voltage regulators (VR3, VR4) which should go in the digital area.
