# KiCAD_Notes

# Tutorials

 * https://forum.kicad.info/t/tutorial-introduction-to-pcb-design-with-kicad-version-5-1-getting-started/20600
 * [KiCAD5SchematicTips](KiCAD5SchematicTips.md) - getting started with schematics in KiCAD 5 (Eric's notes)
 * [KiCAD5SchematicToLayout](KiCAD5SchematicToLayout.md) - moving from schematic to layout (Eric's notes)
 * [KiCAD5LayoutTips](KiCAD5LayoutTips.md) - getting started with layout in KiCAD 5 (Eric's notes)

# Other Random Notes

## No Global !Symbols/Footprints

If you find that you don't have global symbols/footprints available or you get the dreaded "rescue" dialog, you probably didn't allow KiCAD to create the default library paths the first time you ran it.  To fix this (on Linux):

```
  $ cd .config/kicad
  $ mv fp-lib-table fp-lib-table-save
  $ mv sym-lib-table sym-lib-table-save
```

Now start KiCAD and select *Preferences->Manage Symbol Libraries*.  A dialog box will pop up offering to create the default paths.  Leave that selected and click OK twice.

Same thing for *Preferences->Manage Footprint Libraries*.

## Buses

Buses are groups of signals.  See https://www.baldengineer.com/kicad-bus-labels-and-global-labels.html

Here are a few observations:

 * On a sheet, a bus (heavy blue line) must be named as e.g. `name[0..3]`.  The order doesn't seem to matter.
 * If the groups of signals have different net labels e.g. (A_0,A_1...A_n) and (B_0,B_1...B_n), then the bus connecting them needs to have both those net labels assigned (A_[0..n] and B_[0..n] respectively). If the groups of signals have the same net labels for the wires, assigning the bus a net label is not necessary.
 * Buses can be used to connect different groups of signals directly as well as with hierarchical pins and global labels. Buses can be connected between sheets in a similar manner to normal (Green) wires.

## !Cut/Paste between schematics (KiCAD 5)

Open schematic editor from shell (type `eeschema`).  Then you can open one schematic, copy a block, open another schematic and paste.  The claim is that in KiCAD 6 everything is re-done and re-broken and this will be different :(

"Append Schematic Sheet Content" can also be used to copy a whole schematic onto the sheet. Go to File > Append Schematic Sheet Content and select the schematic file that needs to be copied.

## Bill of Materials (KiCAD 5.1.10)

Be sure you have *xsltproc* installed.

Just click the "BOM$" icon on the schematic.  If there are no plugins installed, click the "+" icon and navigate to `/usr/share/kicad/plugins` and add the `bom2csv.xsl` and `bom2csv-grouped.xsl` plugins.  They work fine "out of the box" in my experience.

On the schematic, set the properties on each symbol as follows.  Use *Tools->Edit Symbol Fields* for editing of all symbols on a schematic in a spreadsheet-like way.

Below is a suggested convention for the fields to produce a useful BOM.  [=#bom-fields]


| *Field Name* | *Use* | *Example* | *Notes* |
| ------ ----- | ----- | --------- | ------- |
| Reference | Part Reference | C1 | Required on all symbols, usually automatic |
| Value | Passive Value | 33UF 350V | Required on all symbols |
| | _or_ part number | DMN2004DMK, 74LS04 |
| Footprint | -filled in automatically- | |
| Datasheet | URL of data sheet if available | | Useful but not required |
| !CatNo | Catalog Number | 493-12996-1-ND | Either !CatNo or !MfgNo required for BOM |
| Vendor | Supplier Name | Digi-Key | Useful but not required |
| Mfgr   | Manufacturer  | Nichicon | Useful but not required |
| !MfgNo  | Manufacturer P/N | UVY2V330MHD1TO | See above |

Note that you will have to add various fields by hand.  Usually *Reference*, *Value* and *!CatNo* or *!MfgNo* are visible and the others are hidden.  This is up to you to set correctly.



## Solder mask pull-back

To adjust the pullback of the solder-mask, open pcbnew and go to "Dimensions" pull-down and select "Pads Mask Clearance".
Then you can change the pullback around pads for when the gerbers are generated. (Helpful hint: Cirexx likes 40 mils (0.004"))


