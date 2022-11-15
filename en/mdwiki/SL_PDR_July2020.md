# SL_PDR_July2020

 * Indico: https://indico.cern.ch/event/929522/
 * [Documents](http://ohm.bu.edu/~hazen/ATLAS/SL_PDR_2020/table.html) in handy table
   * SPR agenda: https://indico.cern.ch/event/837348/
   * SPR report: https://edms.cern.ch/document/2234087/1 ([local](http://ohm.bu.edu/~hazen/ATLAS/SL_PDR_2020/L0Muon-Specs_docx_cpdf.pdf))
   * Specification documents: https://edms.cern.ch/document/2377908/1
   * Interface documents: https://edms.cern.ch/document/2377909/1

*2020-07-19 Notes*

GENERAL:

Following ATLAS guidelines for firmware development?

 * Is the firmware in a repository?  All TDAQ developers are supposed to have access.
 * Are they using HOG?
 * Do they have a coding style document

 * http://ohm.bu.edu/~hazen/ATLAS/SL_PDR_2020/Data/VUP_table.png

*TGC*

 * URAM are 4096x72 (288k).  in VU90 there are 960.
 * BRAM are 512x72 (or 1024x72). in VU90 2048 (1024)

 * Trigger path
   * TGC-BW wire reconstruction
     * 92 "units" per SL
     * 4x URAM per Unit = 368 URAM
   * TGC-BW strip segment reconstruction
     * 88 "units" per SL
     * 1x URAM per 2 units = 44 URAM
   * Strips+wires combined using BRAMS (not yet developed)
   * TGC+NSW combined using BRAMs (not yet developed)
   * TGC-EI/RPC/Tilecal combined using BRAMS

 * DAQ path
   * 4 BX per L0A
   * 6700 ch bitmap convert to hits (40 hits/BX for PU=200)
   * convert in parallel
   * prototype for 32 channels implemented

 * Missing
   * All interfaces
   * TTC
   * Control/monitoring

No power estimates.  Resource estimates sketchy.

*RPC*

Algorithms described fairly well but no power or resource estimates.

### Review 7/22

 * "Design ready"?  If so, where is it?  Can we look at the design files?
 * Over-temp, over-current shutdown on blade?
 * Sensor access by SoC
 * Power-up and power-down (SoC startup and shutdown)
 * Can recover from SoC boot failure?
 * HW slide 10 - where are chip-to-chip transceivers?
 * Slide 11 - only one reference clock freq?
 * Power control - can SoC shut down blade
 * How to set MAC / IP address?
 * Take care of level shifting and power zones in I2C network

