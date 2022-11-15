# DFM
This page is dedicated to analyzing how to keep costs low by Designing For Manufacturing (DFM).
To see the steps involved in PCB manufacturing click [here.](http://www.sunstone.com/pcb-products/pcb-manufacturing-tutorial)

### Definitions

 * Annular Rings
   * The donut ("annulus") created when your drill pierces a copper layer. It is defined as the radius of this donut. For example, a .030" pad with an .020" hole would have a .005" annular ring
 * Finished Hole Size (Plated Through Holes)
   * Size of through hole AFTER plating
   * Plated all the way through the board
   * Plated Through Holes are normally drilled 4-6 mils over nominal finished hole size. Copper and solder plating generally reduces hole diameter by ~3-5 mils
 * Unfinished Hole Size (Non-Plated Through Holes)
   * Size of through hole directly after drilling, BEFORE plating
 * Aspect Ratio
   * Board thickness divided by smallest drilled hole (via's).
   * HIGHER aspect ratios (bigger board thickness, smaller hole) increases probability for voids in holes.


 * Further Understanding of terminology with *pictures*
   * Sunstone Circuits has a great page [here](http://www.sunstone.com/pcb-capabilities/pcb-manufacturing-capabilities) that has fantastic pictures illustrating what is what in terms of lingo.

----
## Specs to Minimize Fabrication and Assembly Costs

*Note:* This list is very conservative, and if followed you should be able to send your design to any manufacturer, assembly house, etc. and get their lowest price possible.

### PCB Shape

 * *PCB’s must have 2 parallel sides (preferably the 2 longest sides)* for  process through most automated assembly equipment.
 * Breakaway rails and/or panelization can be used to accommodate a wide variety of odd board shapes.

### Board Layer Count & Construction

 * *Even number of layers.*
 * Odd number of layers lead to warpage problems.
 * Layer stackup should be symmetrical with regard to dielectrics, copper weights, and layer design. Asymmetrical designs are a primary cause of warped boards.

### Copper Weights / Trace Widths / Trace Spacings

 * Trace line/spacing
   * *7/7 mils minimum*
   * This is for most common copper weights, like .5oz, 1oz,2oz. For higher weights you will need larger width/spacing.
 * Copper Weights
   * *less CU weight is cheapest.* Such as .5oz for inner layers and 1oz for outer layers
  *Go as light as possible and still have good current handeling.

### Drill
http://www.atechcircuit.com/pcb-capability/rigid-pcb
 * Hole Size* * Annular Rings
   * *For cheapest price across all companies, go >=15mils* if you can. This includes vias.
 * Annular Rings
   * *7mil minimum*
 * Aspect Ratio
   * *No higher than 6:1*
 * Hole Tolerances
   * Plated Through Holes
     * 6 mil window is ideal (+/- 3 mils)
     * If PTHs over 100 mils are located at the edges of the board, they should have large outer layer pads to prevent too fast plating.
       * *Pads 200 mils larger than the hole*
   * Non-Plated Through Holes
     * 4 mil window



----

## Select PCB Fabricator Requirements and Minimums

### OSH Park (Only Fab, no Assembly)
 * Design Rules
   * 2 Layer Board Minimums:
     * Trace Width and Spacing
       * 6 mils
     * Traces to Edge of Board
       * 15 mils
     * Drill size
       * 13 mils
     * Anular Ring
       * 7 mils
   * 4 Layer Board Minimums:
     * Trace Width and Spacing
       * 5 mils
     * Traces to Edge of Board
       * 15 mils
     * Drill size
       * 10 mils
     * Anular Ring
       * 4 mils
   * 1.6mm thick (0.063")
   * 1oz copper on outer layers, 0.5oz on inner layers
   * Can have internal cutouts (draw on board outline layer)
   * NO plated slots
 * Prices and Turnaround times
   * For prototyping (price includes 3 boards)
     * 2 Layer boards: $5/square inch. Ship in under 12 calendar days from order
       * *NOTE:* You can get turn time to 5 business days for extra cost of $89 per design. Super Swift Service
     * 4 Layer boards: $10/square inch. They go to the Fab once a week and have a 2 week turn time once in fab.
   * Larger orders:
     * Minimum of 150 square inches (no upper limit)
     * You can have different designs, but each design must be ordered in multiples of 10 (and in total add up to 150 square inches)
     * 2 Layers
       * $1/square inch
       * Ship in ~3 weeks from order
     * 4 Layers
       * $2/square inch
       * Ship in ~1 month


### Advanced Circuits / 4PCB (Fab and Assembly)
 * Phone Number, sales department in East Cost: 1-800-979-4722 EX. 1339 (Ashley)
 * Design Rules
   * All board minimums
     * Trace Width and Spacing
       * *A premium is charged for trace width/spacing less than 7 mils*
       * 0.5oz CU (inner layers): 4 mils
       * 1oz CU (outer layers): 4 mils
       * 1oz CU (inner layers): 5 mils
       * 2oz CU (inner & outer): 6 mils
       * 3oz CU (inner & outer): 10 mils
       * 4oz CU (inner & outer): 12 mils
     * Copper to Edge of Board
       * Outer Layers: 10mils
       * Inner Layers: 15mils (20 mils preferred)
       * For Scoring, Outer Layers=15mils   Inner Layers=20mils
     * Drill size
       * 13 mils
     * Pad Size/Anular Ring
       * Vias:
         * Pad Size=10mils over finished hole size, so annular ring=5mils
       * Component Holes:
         * Pad Size=14mils over finished hole size, so annular ring=7mils
     * Inner Layer Clearances
       * 10mils
     * Hole Tolarances
       * 4mils (if we don't specify, default hole tolerance is 5mils)
     * Board Thickness (tolerance may vary 10% (min. +/-5mils))
       * 2 Layer: 20mils
       * 4 Layer: 20mils
       * 6 Layer: 31mils
       * 8 Layer: 47mils
       * 10 Layer: 62mils
     * Rout (board outline and internal cutouts)
       * +/-10mil tolerances
     * Slot Width
       * 31mils
     * Silkscreen (Legend)
       * 5mils line width
   * Offer 0.5,1,2,3,4 oz copper on inner layers, and 1,2,3,4 oz copper on outer layers
   * NO custom oz CU (like 1.5 or 2.5oz)
   * Links:
     * [Design Specs on website](http://www.4pcb.com/pcb-design-specifications/)
   * Standard Specs:
     * Non-plated slots & cutouts
     * Green soldermask, white legend, FR4
     * 1oz CU inner layers, up to 2oz CU on outer layers.
     * Overall thickness: 31,62,93, or 125 mils
     * Trace/Space at 5/5mils
    *Gold finders, lead-free solder
     * Rout Tolerance +/-10mils, Hole Tolerance +/-5mils
     * Minimum Hole Size=10mils
     * Fiducials and/or Tooling Holes
 * Assembly Considerations
   * PCB Fab MUST be done by 4PCB to have assembly here
   * [attachment:Advanced-Circuits-Assembly-Requirements.doc Assembly Requirments]

 * Prices and Turnaround times, fab and assembly
   * [DFM Check](http://www.4pcb.com/pcb-cam-based-quoting/index.html), which will give insight onto clearances that the manufactuer uses
   * For prototyping:
     * 2-Layer PCBs
       * $33 offer
         * $33/board, minimum of 4 boards *Note: with Student Program, no minimum PCB quantity. type word 'Student' in COMMENTS section when placing each board. Must have University shipping addresss*
         * Turn around time=5 days
         * Plated or non-plated holes
         * NO slots, internal routing (cutouts), scoring, tab rout, or drilled hole board seperations.
         * Minimum 6mils line/space, Minimum 15mil hole size
         * FR-4, 62mils, 1oz CU
         * Max size=60in square
         * Max 35 holes/sq. inch
       * BareBones
         * FR-4, 62mils, 1oz CU
         * Plated or non-plated holes
         * 6mil line/spacing minimum
         * Tin finish over 1oz CU
         * NO internal routing (cutouts), scoring, tab rout, or drilled hole board seperations, mask, legend
         * Rectangle only
         * Minimum size: 1.25" x 1.25"         Maximum Size: 12" x 16"
         * Gerber 274X prefered (274D also good)
         * English Units for drill (Excellon)
         * Minimum Hole size: 15mils
         * Max size=60in square
     * 4-Layer PCBs
       * $66/board, minimum of 4 boards *Note: with Student Program, no minimum PCB quantity. type word 'Student' in COMMENTS section when placing each board. Must have University shipping addresss*
       * Turn around time=5 days
       * NO slots, internal routing (cutouts), scoring, tab rout, or drilled hole board seperations.
       * Minimum 6mils line/space, Minimum 15mil hole size
       * FR-4, 62mils, 1oz CU
       * Max size=30in square
       * Max 35 holes/sq. inch
   * Larger orders:
     * Standard Specs are same as above listed.
     * Custom Specs will cost more.
   * Fabrication Quotes:
    *[Quote matrix here.](https://www.my4pcb.com/Net35/Quote/Quote_Code.aspx)
     * Need to know smallest hole size, # pads on top/bottom, thickness, etc
     * Max quote of 100 boards, larger you need to call
    *[FreeDFM quote.](https://www.my4pcb.com/net35/FreeDFMNet/FreeDFMHome.aspx#_ga=1.239944704.2020970432.1424274393)
     * Need gerber files and quote will be emailed to you in minutes.
     * Also shows potential issues with manufacturing
     * Talk to a person
   * Assembly Quotes:
     * Email the following to a sales rep:
       * [](attachments/)
       * BOM. Here is a [attachment: Assembly-Sample-BOM.xls sample BOM]
       * CPL (component placement list) or PNP (pick & place file). Here is a [attachment: Assembly-Sample-CPL.xls sample CPL]


### Sunstone Circuits (Screamiung Circuits for Assembly)
 * Design Rules
   * Depend on service, see below for details

 * Prices and Turnaround times
   * Detailed list for all options can be found [here.](http://www.sunstone.com/pcb-capabilities/pcb-manufacturing-capabilities)
   * *PCBExpress Quickturn* and *_ValueProto PCB Prototype Services*_
     * *Quantity: 1-100*, practically only for small runs 1-15
     * Lead times:
       * PCBExpress Quickturn:
         * Next Day (2-layer) , 2-Day (2,4-layers), 3-Day (2,4,6-layers)
         * [Pricing](http://www.sunstone.com/pcb-products/pcbexpress-quickturn/pcb-quickturn-pricing) in table form, no input required
       * Value ProtoPCB:
         * 5-Days (2-layer)
         * [Pricing](https://quoting.sunstone.com/quotevalueproto.aspx), need demensional input and quantity
         * *MUCH cheaper than Quickturn on most orders*
     * # of Layers:
      *1(treated as 2 layer)-6
     * Copper Weights:
       * Inner: 1oz
       * Outer: 1oz
     * Trace/Space minimums:
       * Inner: 6/6mils
       * Outer: 6/6mils
     * Clearance for TH drill
       * Inner: 25mils larger than finished hole size
     * Pads for TH drill
       * Inner: 18mils larger than finished hole size
     * Board Thickness Availible
       * 62mils ONLY
     * Soldermask color
       * Green
     * Soldermask minimum web (smallest strip possible, such as between two pads NOT INCLUDING soldermask relief)
       * 5mils
     * Silkscreen info
       * [Details](http://www.sunstone.com/pcb-capabilities/pcb-manufacturing-capabilities#silkscreen)
     * Drill info
       *  13.5 mils = smallest drill
       * ValueProto has 23 pre-determined drill sizes [Sizes availible](http://www.sunstone.com/pcb-products/pcbexpress-quickturn/file-drill-summary)
       * [More details](http://www.sunstone.com/pcb-capabilities/pcb-manufacturing-capabilities#drill)
       * *Note:* holes 18mils or less may be plugged
     * Board Size:
       * Max: 12" x 14"
       * Min: .25" x .25"
     * Slots, Cutouts, Routing, etc: For percise details go to [here](http://www.sunstone.com/pcb-capabilities/pcb-manufacturing-capabilities), and scroll down to Route (Tab) and V-scoring.
     * Tin-lead finish only
     * FR-4

   * PCBpro Full Feature
     * *Quantity: 1-15,000*
     * Lead times:
       * 2 days to 5 weeks
     * # of Layers:
       * 1-14 layers
     * Copper Weights:
       * Inner: .5, 1, 2oz CU
       * Outer: 1, 1.5, 2.5oz CU
     * Trace/Space minimums:
       * Inner: .5oz CU (5/5mils), 1oz CU (6/6mils), 2oz CU (8/8mils)
       * Outer: 1oz CU (5/5mils), 1.5oz CU (10/10mils), 2.5oz CU (13/13mils)
     * Clearance for TH drill
       * Inner: 20mils larger than finished hole size
     * Pads for TH drill
       * Inner: 18mils larger than finished hole size
     * Board Thickness Availible
       * 31, 47, 62, 93, 125 mils (and custom thickness)
     * Soldermask color
       * green/blue/black/red/white
     * Soldermask minimum web (smallest strip possible, such as between two pads NOT INCLUDING soldermask relief)
       * 4mils
     * Silkscreen info
       * [Details](http://www.sunstone.com/pcb-capabilities/pcb-manufacturing-capabilities#silkscreen)
     * Drill info
       * 10mils = smallest drill
       * [Details](http://www.sunstone.com/pcb-caphttp://www.atechcircuit.com/pcb-capability/rigid-pcbabilities/pcb-manufacturing-capabilities#drill)
       * *Note:* holes 18mils or less may be plugged
     * Board Size:
       * Max: 14" x 18"
       * Min: .25" x .25"
     * Slots, Cutouts, Routing all YES
     * FR-4 Tg, High Tg, High Td, Low CTE


   * Fabrication Quotes:
     * [DFMplus quote.](https://quoting.sunstone.com/dfm.aspx)
       * Need gerber files and quote will be emailed to you in 2 hours.
       * Also shows potential issues with manufacturing
     * Easy online quote, no gerber files or specific # of pads required. [Quotes are here](http://quoting.sunstone.com/QuoteExpress.aspx)
     * Talk to a person

   * Assembly Quotes:
     * What they need (look [here](http://www.sunstone.com/pcb-products/assembly-services/file-requirements) for specifics on the below):
       * BOM
       * Gerber Files (RS-274X - same as PCB fabrication)
       * Centroid (Pick and Place, CPL, and other names).
         * *They can generate this from Gerber for an extra charge*
       * ASCII-Formateed CAD data
         * *ONLY for Short-Run Production Orders*
       * Assembly Drawings, instructions or photos
         * NOT REQUIRED, but "Do help to ensure all special PCB assembly instructions are carried out properly. If requresting any non-standard processes or have ambiguous placements, provide helpful documentation.


### Gold Phoenix PCB (Fab and Assembly)

*Design Rules
   * Layers
     * 1-12 Layers of FR-4
   * Minimum Board Thickness
    *

 * Prices and Turnaround times
  *For Quick Online Quote:
    *


wiki:3Dprinting
