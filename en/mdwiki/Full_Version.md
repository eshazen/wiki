# Full_Version
This page describes the revisions to the test-beam version of the electronics needed to create the full g-2 tracker electronics.

Board Database:


| [LogicBoardID](LogicBoardID.md) | [TDCMotherBoardID](TDCMotherBoardID.md) | [TDCBoardID](TDCBoardID.md) | [FeedthruBoardID](FeedthruBoardID.md) | [FlexicableID](FlexicableID.md) | [ASDQBoardID](ASDQBoardID.md) |
| ------------------------------- | --------------------------------------- | --------------------------- | ------------------------------------- | ------------------------------- | ----------------------------- |

## Outstanding issues after the test beam
In general, everything worked well at the test beam.  Here's a (potentially incomplete) list of things that we want to test/get working before a full production run.  The last two are firmware and we don't need to wait for them.
 * CDR locking - this works well about 75% of the time but fails and we get garbled data back from the TDCs. Re-running the intialisation (without a power-cycle) often fixes this.  We think that this is all related to which CDR edge the automatic system locks on to.
 * Temperature sensors - some ECOs required already but it'd be good to make sure we can read these out properly before running the full run.
 * Remote loading of firmware - make sure we can do this with our current layouts.  Part of this should be re-visiting the programming cable connection which is very very flaky right now.
 * Flexi-length modifications - longest flexi is about 5 mm too long - others seems OK.
 * Reset counters via C5 commands
 * Hit edge studies - why don't we see both hit edges for all hits?  Can we do anything about this or do we just need to remove these hits.  They seem to happen when they're close together.  There looks to be useful physics information in the width so we would like to understand this.
 * Hit LSB timing histogram - does the new firmware have reasonable timing for the 0.625 ns bins?


## Logic Board
 * [LogicBoardECOs](LogicBoardECOs.md) Logic board ECOs
 * [LogicBoardID](LogicBoardID.md) Logic board IDs and info
 * [LogicBoard](http://edf.bu.edu/svn/edf/G-2/NewElectronics/LogicBoard/) -- SVN repository
 * [DB_Pinout](http://ohm.bu.edu/~hazen/G-2/LogicBoard/DB9_pinout.png) (final? 11/2/2014)
 * [SlowControlInterface](SlowControlInterface.md)
   * [SlowControl](http://edf.bu.edu/svn/edf/G-2/NewElectronics/SlowControl/) -- SVN repository
 * [firmware](firmware.md)

## Logic Board DB
 * [LogicBoardDbECOs](LogicBoardDbECOs.md) Logic board DB ECOs
 * [LogicBoardDbID](LogicBoardDbID.md) Logic board DB IDs and info
 * update 805 0.1 ohm resistors to correctly be 805 and not 805 wide
 * Add 1uF capacitors on the current monitor voltage divider
 * Update reset signal to correctly be not reset

## TDC Motherboard

 * Schematic:  [Rev A PDF](http://ohm.bu.edu/~hazen/G-2/2015/TDCMotherBoard/TDC_Mother_schematic_RevA.pdf)
 * Gerbers: [G2-TDC-MB_RevA.zip](http://ohm.bu.edu/~hazen/G-2/2015/TDCMotherBoard/G2-TDC-MB_RevA.zip)
 * [TDCMotherBoard](http://edf.bu.edu/svn/edf/G-2/NewElectronics/TDCMotherBoard/) -- SVN repository
 * [TDCMotherBoardID](TDCMotherBoardID.md) TDC Motherboard IDs and info
 * Parts Notes:
   * Install (6) ED90538-ND sockets in empty site for I2C

## TDC Daughter-Board

 * [TDCBoardID](TDCBoardID.md) TDC board IDs and info
 * Parts Notes:
   * Install at P1, P2 plugs TD-103-G-A-1
 * [firmware](firmware.md)

## Feedthru Board
 * [FeedthruBoardID](FeedthruBoardID.md) Feedthrough board IDs and info
 * Schematic: [Rev A pdf](http://ohm.bu.edu/~hazen/G-2/2015/FeedthroughBoard/Feedthru_board_schematic_RevA.pdf)
 * Gerbers: [http://ohm.bu.edu/~hazen/G-2/2015/FeedthroughBoard[FlexicableID](FlexicableID.md)/G2-FT-RevA.zip G2-FT-RevA.zip]
 * [FeedthroughBoard](http://edf.bu.edu/svn/edf/G-2/NewElectronics/FeedthroughBoard/) -- SVN repository
 * TDC Numbering: [](attachments/)
## Flexi cables
 * [FlexicableID](FlexicableID.md) Flexicable IDs and info
 * Photos:  [1](http://ohm.bu.edu/~dgastler/g-2/2015/01/Flexi-photos/2015-01-30%2013.58.22.jpg)[2](http://ohm.bu.edu/~dgastler/g-2/2015/01/Flexi-photos/2015-01-30%2013.59.20.jpg)[3](http://ohm.bu.edu/~dgastler/g-2/2015/01/Flexi-photos/2015-01-30%2013.59.21.jpg)[4](http://ohm.bu.edu/~dgastler/g-2/2015/01/Flexi-photos/2015-01-30%2014.01.25.jpg)

## ASDQ Board

The ASDQ Board (v3) is mechanically more compact and intended to stack end-to-end on large chambers.
The test pulse injection drivers and voltage regulators have been removed from the design.

   * [ASDQBoard](http://edf.bu.edu/svn/edf/G-2/NewElectronics/ASDQBoard/) -- SVN repository
   * [ASDQv3LayoutNotes](ASDQv3LayoutNotes.md) -- pending comments/notes on layout
   * PRELIMINARY Design files [SVN link](http://edf.bu.edu/svn/edf/G-2/NewElectronics/ASDQBoard/ASDQ_v3_OrCAD/)
   * PRELIMINARY schematic [PDF](http://ohm.bu.edu/~hazen/G-2/ASDQ/Rev3/ASDQv3_2014-09-30_sch.pdf)
   * PRELIMINARY mechanical [PDF](http://ohm.bu.edu/~hazen/G-2/ASDQ/Rev3/print.pdf) [DXF](http://ohm.bu.edu/~hazen/G-2/ASDQ/Rev3/ASDQ_V3_PRELIMINARY.DXF)
   * Mounting screws - M2 socket cap [Metric Screw Catalog Page 186](http://www.metricscrew-toolco.com/pg186.gif)

ASDQ v3 had socket holes that were too small.  v4 is identical with the exception that these holes are larger.
   * [ASDQBoardID](ASDQBoardID.md) ASDQ v4 board IDs and info


## High Voltage Board

   * [HVBoardID](HVBoardID.md) HV board IDs and info
   * Schematic: [Rev A PDF](http://ohm.bu.edu/~hazen/G-2/2015/HVBoard/HVBoard_schematic_RevA.pdf)
   * Gerbers: [http://ohm.bu.edu/~hazen/G-2/2015/HVBoard/G2-HV-RevA.zip]

## High Voltage Cables

   * Wire -- Daburn CRT24-2.5 03.  Marginally too fat to fit in connectors but best we could find
   * Connectors:  two options
     * Molex
       * 0050579003 (WM2801) 3 pin housing
       * 0050579005 (50-57-9005) 5 pin housing
       * 0016020087 (WM2512) crimp terminal 22-24 AWG
     * Harting
       * M20-1060300 (952-2228-ND) 3 pin housing
       * M20-1060500 (952-2230-ND) 5 pin housing
       * M20-1180042 (952-2158-ND) Crimp pins

Both work, though the Molex seem to fit the wire a bit better.

## Mechanical Info for "Electronics Inside" Option

   * [64 PQFP 10x10x1.4mm](http://www.ti.com/lit/ml/mpqf172/mpqf172.pdf) drawing from TI; should be similar to ASDQ package
   * 0402 Resistors and Capacitors (on back side) are 0.5mm high
   * [2D Models](http://ohm.bu.edu/~hazen/G-2/Models/2014_DES/2D_2014-09-95/) from John C on 9/5/14
     * Manifold end detail: [DXF](http://ohm.bu.edu/~hazen/G-2/Models/2014_DES/2D_2014-09-95/END_MODEL.DXF) * [PDF](http://ohm.bu.edu/~hazen/G-2/Models/2014_DES/2D_2014-09-95/END_MODEL%20Model%20(1).pdf) -- manifold end detail

## General updates

   * Evaluate performance from test beam data
   * Pin/socket interface
   * HV connection (3pin version of this: [2pin RA](http://www.digikey.com/product-detail/en/3-794618-2/A33252-ND/1114990) [1](http://www.digikey.com/product-detail/en/1445022-3/A30259-ND/684982) [2](http://www.digikey.com/product-detail/en/1445048-3/A30248-ND/684971) [3](http://www.digikey.com/product-detail/en/1445049-3/A30237-ND/684960) [4](http://www.digikey.com/product-detail/en/794617-2/A30293-ND/685016))
   * HV+LV cabling [](attachments/)
   * Feed-through box
   * [Power/cooling](Power/cooling.md)
   * Voltage regulator sizing for 32/48 channels

## End to End Noise Scan Testing
   * [Noise Scan Plots](Noise_Scan_Plots.md)

