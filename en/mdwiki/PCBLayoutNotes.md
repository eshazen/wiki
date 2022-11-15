# PCBLayoutNotes
### Reference

 * [uCAMco archive](https://www.ucamco.com/en/gerber/downloads) -- the home of the Gerber spec
 * [Local archive](http://ohm.bu.edu/~hazen/DataSheets/Gerber/) (EDF password) of Gerber documents

### Grids / Traces

 * Use English measurements (mils, not mm)
   * (for metric components of course, define the footprint in mm)
 * Place all components on .050 grid to start, .025 if required
 * Trace width spacing minimum .006 / .006 (wider for power)
 * Route on .025 grid to start, .0125 if required
 * For metric / off-grid pads, route nearby then short off-angle segment to pad

* ALWAYS WORK WITH GRID SNAP ON* and set to a sensible value.  "Sensible"
means normally .025 for placement, no smaller than .0125 for routing.
Use smaller only for special requirements or silkscreen text placement.

### Holes / Pads

 * Hole sizes specified are *finished* which are typically .003-.004 smaller than the drill size.
 * A good minimum via size is .015 pad with .005 hole.
 * For thru-hole component leads, specify a hole size at least .005 largerthan the lead diameter.
 * CAVEAT In vsn 4.0.7, KiCad's gerber generating code will convert slots to circular drills.

### Silkscreen

 * Minimum text height .040 and minimum line width .006
 * Silkscreen text cannot overlap other silkscreen graphics, pads or holes
 * Start with all text right-side up, rotate 90 degrees in one direction if needed

### Useful Writeups on Footprint Design

 * [http://www.ti.com/lit/an/sbfa015a/sbfa015a.pdf]


### Selected PCB capabilities from mid-range houses as of June 2016


| *Feature*                   | *Advanced* | *Sunstone* | *Sierra* |  *JLCPCB* | *OshPark* |
| ---------                   | ---------- | ---------- | -------- |  -------- | --------- |
| Outer Layer Trace Width (1 oz)  |     .005 |     .006 |   .003 | .0035 | .006 |
| Outer Layer Trace Spacing       |     .005 |     .006 |   .003 | .0035 | .006 |
| Innner Layer Trace width (1 oz) |     .004 |          |        | | |
| Inner Layer Trace Spacing       |     .005 |          |        | | |
| Pad size over drill (dia)       |     .010 |          |   .006 |.006 | .010 |
| Pad size over finish hole       |          |     .018 |        | | |
| Via size over drill (dia)       |     .008 |          |        | | |
| Minimum drill (full spec)       |     .006 |          |        | .008 | .010 |
| Minimum drill (quick proto)     |     .010 |     .010 |   .008 | | |
| Soldermask minimum web          |     .004 |     .005 |   .004 | | |
| Soldermask clearance (std)      |     .002 |          |   .002 | | |
|                                 |          |          |        | | |

### Manufacturer Notes

*Sierra* (aka protoexpress.com) have "No Touch" service ([guidelines](http://media.protoexpress.com/notouch-pcb-design-guidelines.pdf)).  Around $100 for 3 pcs 2.5x5.5 for example.

*Advanced* (aka 4pcb.com) has "$33 special" (min 3pcs) up to 50 in^2.  Could batch these.

*Sunstone* ValueProto service is around $115 plus shipping for a 2.5x3.5 board.
