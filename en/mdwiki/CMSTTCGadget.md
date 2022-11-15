# CMSTTCGadget
## Rev. B  ===

### Firmware

Technically untested on new board.

*'MAC and IP Address Setting*

MAC address range reserved for AMC13 boards is
08-00-30-F3-00-00 thru 08-00-30-F3-00-7F.
Please use MAC addresses starting with the top of this range (08-00-30-F3-00-7F) and going
downwards for these boards.

### Hardware
#### Sources

All schematic and PCB layouts were done in [ExpressPCB](http://www.expresspcb.com/)

 * Full Schematic Source (Include BOM in CSV, PDF, XLSX, ExpressPCB files and PDFs)
   * [zip](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/CMS_TTCTTS_Adapter_RevB.zip) &bull; [tar.bz2](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/CMS_TTCTTS_Adapter_RevB.tar.bz2) &bull; [Directory](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/)

 * PCB
   * [ExpressPCB](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_Gadget.pcb) &bull; [PDF](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_Gadget_pcb.pdf)

 * PCB Fake Bottom Silkscreen (WARNING: not actually a bottom silk)
   * [ExpressPCB](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_Gadget_bot.pcb) &bull; [PDF](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_Gadget_pcb_bot.pdf)

 * Schematic
   * [ExpressSCH](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_Gadget.sch) &bull; [PDF](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_Gadget_sch.pdf)

 * BOM
   * [CSV](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_TTC_TTS_Gadget_BOM.csv) &bull; [PDF](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_TTC_TTS_Gadget_BOM.pdf) &bull; [XLSX](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/rev/b/CMS_TTC_TTS_Gadget_BOM.xlsx)

#### Notes

None at the moment.

#### Changelog


 * Fixed LED footprints
 * Added convenient .1" spaced headers for use with Phase 1 firmware.
 * Fixed TTS connections (both input and output) to match a traditional Ethernet Patch cable
 * Fixed the situation for the Oscillator, now that the datasheet has been understood and we know which pin needs to be enabled. Alternatively put OE on a FPGA pin (current solution is two sites for 603 resistors or solder shorts)
 * Added more labels (these labels are still valid in "old" designs)
 * Add soft reset button to implement TTC Phase 1 reset features (Low Active)
 * Added trigger button (Low active)
 * NIM Outputs added.
 * NIM Inputs added
 * Fixed the situation for the Oscillator, now that the datasheet has been understood and we know which pin needs to be enabled. Alternatively put OE on a FPGA pin (current solution is two sites for 603 resistors or solder shorts)
 * Added more label
 * Moved U2 from the M25P32''s SOIC16 package to its SO-8W package version
 * Added bypass capacitors to comparators U14, U15, U16 and U17
 * Enlarged two holes on the SFP package to allow for easy fitting of the surface mount part.

## Rev. A
### Hardware
The ExpressPCB and BOM files for the boards that we ordered are available [here](http://edf.bu.edu/~cwoodall/CMS_gadget/old/CMS_gadget06012012/schematic/)

 * Bill of materials
   * [PDF](http://ohm.bu.edu/~hazen/CMS/TTS_Adapter_VME/CMS_Gadget_BOM.pdf) &bull; [XLS](http://ohm.bu.edu/~hazen/CMS/TTS_Adapter_VME/CMS_Gadget_BOM.xls) &bull; [CSV](http://edf.bu.edu/~cwoodall/CMS_gadget/schematic/cms_gadget.csv)
 * [CMS_Gadget.sch](http://edf.bu.edu/~cwoodall/CMS_gadget/schematic/archive/CMS_Gadget_060112.sch)
 * [CMS_Gadget.pcb](http://ohm.bu.edu/~cwoodall/CMS_gadget/schematic/archive/CMS_Gadget_060112.pcb) &bull; [(pdf)](http://ohm.bu.edu/~hazen/CMS/TTS_Adapter_VME/CMS_Gadget_pcb.pdf)
 * [CMS_Gadget_bot.pcb](http://edf.bu.edu/~cwoodall/CMS_gadget/schematic/CMS_Gadget_bot.pcb) : "Bottom silkscreen" &bull; [PDF version](http://ohm.bu.edu/~hazen/CMS/TTS_Adapter_VME/CMS_Gadget_pcb_bottom.pdf)
 * [ExpressPCB library](http://edf.bu.edu/~cwoodall/CMS_gadget/schematic/library/)

#### Problems and Comments

 * Pad of R5 connected to U4 needs to be shorted to the pad of R16 that is not connected to U4

 * D1, D2, D3, D4, D5 and D6 are all backwards... datasheet was misread. DNP or put in 3mm LEDS cathode side towards the board edge. Its a tight fit. Preferably leads bent to point off the board

 * J3 DNP

 * R16, R5, R1 DNP

### Firmware

Follows the specification set down in the [TTC_TTS_FirmwareSpecification](TTC_TTS_FirmwareSpecification.md)


#### SFP Interface

[TTC_TTS_FirmwareSpecification](TTC_TTS_FirmwareSpecification.md)

The BiPhase Mark Code based SFP interface for the TTC data stream has been implemented.

Rx Implemented. Tx not yet completely finished, Can take a predetermined data stream and send it out...

#### TTS RJ-45 Outputs

Channel A displays top 4 bits of a Broadcast command sent from the AMC13. This has been tested. Currently a problem with the TTC Gadget''s RJ45 outputs, which will be fixed in future revisions. For now use a [Custom RJ45 Crimps (view is from the shiny gold crimp side of the connectors)](https://docs.google.com/drawings/pub?id=1z7iB2nHYvPc0fIcee3giTS-gFnTEbgTqFwxoy7Ys3kI&w=668&h=508)

Channel B displays the bottom 4 bits of a broadcast command. This is currently unused.

Tested by sending the output of the TTS to the TTS Test Gadget and reading out its buffer. To write to the AMC13 broadcast command test register first clear register 1 (wv 1 0) then set the 12th bit and put your ttc command into bits 8-11 (wv 1 0x1n00), where is n is hex between 0 and F.

#### Ethernet Interface/IPBus

The [OEthernetMac](OEthernetMac.md)

Successfully talking Ethernet Interface with IPBus interface.

The 100Mb/s Ethernet Mac is now functional on both the Digilent Nexys3 board and the CMS TTC/TTS Adapter Board (Rev. A).

