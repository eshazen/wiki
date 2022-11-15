# AtlasPhase2Muons
*Reference*

 * Main HDL gitlab: [l0mdt-hdl-design](https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-hdl-design) [Wiki area](https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-hdl-design/wikis/home)
   * Hardware:
     * MPI schematics (Demo): https://mdttp-files.web.cern.ch/mdttp-files/L0MDT/Demonstrator/CM/doc/Board/Schematic/
     * MPI schematics (Proto): https://mdttp.docs.cern.ch/Hardware/Command%20Module/prot/
   * Diagrams: https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/mdt-tp-diagrams
   * Official TWiki: https://twiki.cern.ch/twiki/bin/view/Atlas/Phase2L0Muon
 * Docs: https://mdttp.docs.cern.ch/  Mattermost: https://mattermost.web.cern.ch
   * [Spreadsheet](https://docs.google.com/spreadsheets/d/1oJh-NPv990n6AzXXZ7cBaySrltqBO-eGucrsnOx_r4s) [Block Diagram](https://mdttp.docs.cern.ch/Logic_Design/block-diagrams/)
   * PDR Docs: [L0MDT_Review_Docs](https://gitlab.cern.ch/atlas-hllhc-muon-mdt-trigger-doc/L0MDT_Review_Docs) (deprecated)
   * PDR Docs: [https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/docs/l0mdt-pdr]
 * BU SVN (Documents, meetings): http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/
 * [Butler's Library](https://physics.bu.edu/~jmbutler/L0MDT-TP/) of useful documents
 * TriDAS TDR:  https://cds.cern.ch/record/2296879/files/ATL-COM-DAQ-2017-185.pdf ([local](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Documents/ATL-COM-DAQ-2017-185.pdf))
 * Muon TDR: [CDS](http://cds.cern.ch/record/2285580/) [local](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Documents/ATL-COM-DAQ-2017-185.pdf)
 * Muon chamber layout [drawings](https://twiki.cern.ch/twiki/bin/viewauth/Atlas/MuonSpectrometerLayout)
 * ASD spec/review: https://indico.cern.ch/event/899259/
 * Mezz/CSM PDR: https://indico.cern.ch/event/888210/
 * TDC:
   * [FDR](https://indico.cern.ch/event/1056224/) with specs, etc
 * CSM: [spec](https://indico.cern.ch/event/888210/contributions/3787587/attachments/2003747/3350985/CSM_Spec_031220.pdf)
 (2019-08-07) [review](https://indico.cern.ch/event/776076/)
 * Data format, latency, link counting from 11/30/17 meeting and subsequent discussions
   * [update from 9/13/18](https://indico.cern.ch/event/740898/) leaves many open questions
   * [Data Format](https://indico.cern.ch/event/683886/contributions/2808122/attachments/1568006/2473594/muonTriggerMeeting_01_12_2017_mdt_data_format.pdf)
   * [Link Counting](https://indico.cern.ch/event/683886/contributions/2808120/attachments/1568020/2472104/yasuyuki.okumura.20171130.00.pdf)
   * [Latency](http://ohm.bu.edu/~hazen/ATLAS/Phase2MDT/Latency_20171130_2.xlsx)
 * [ATLAS Interfaces with Detectors](https://edms.cern.ch/document/1563801/1) evolving document
 * [List of Questions](https://twiki.cern.ch/twiki/bin/viewauth/Atlas/USMDTTRIG)
 * [Phase 2 BU/UIUC/CIT meetings](https://indico.cern.ch/category/498/)
 * [Segment Finding Algorithms](http://ohm.bu.edu/~hazen/ATLAS/Phase2MDT/mdt_trigger_algorithms.pdf) - Kostas, 10/20/16
 * [GBT Tutorial](http://indico.cern.ch/event/489996/contributions/2291863/attachments/1345764/2028939/GBTTutorial_-_TWEPP2016.pdf)
 * [Chios slides](https://indico.cern.ch/event/538558/contributions/2315896/attachments/1345678/2028760/l0mdt_chios_092916.pdf) for reference
 * [Discussion of TDAQ Architecture Options](https://indico.cern.ch/event/558269/) meeting 7/26/2016
 * [MiniPOD heatsink info](http://www.pa.msu.edu/hep/atlas/l1calo/cmx/hardware/details/cmx_ab_heat_sinks.txt) from MSU
 * Prototype0 document:  [ssh://git@gitlab.cern.ch:7999/atlas-hllhc-muon-mdt-trigger-doc/Proto0_Blade.git Proto0_Blade.git] or [browse](https://gitlab.cern.ch/atlas-hllhc-muon-mdt-trigger-doc/Proto0_Blade)
   * [GitNotesForMDTDocument](GitNotesForMDTDocument.md) -- cheat sheet for git
 * [L0MDT_URD](https://gitlab.cern.ch/atlas-hllhc-muon-mdt-trigger-doc/L0MDT_URD) - 1st version due end of March!
 * AM option: http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Hardware/PRM_Docs/
 * FELIX: https://atlas-project-felix.web.cern.ch/atlas-project-felix/
   * JIRA: https://its.cern.ch/jira/projects/FLXUSERS/summary


*Reviews*

 * [SL_PDR_July2020](SL_PDR_July2020.md)

*Development !Info/Log*

 * [L0MdtDaq](L0MdtDaq.md) -- notes on the DAQ portion of the firmware starting 2021-11
 * [L0MdtTestBench](L0MdtTestBench.md) -- notes on development of a common top-level test bench

*Hardware*

 * [Enclustra ZX2](https://www.enclustra.com/en/products/system-on-chip-modules/mars-zx2/) - Convenient footprint commercial Zynq
 * [CERN IPMC](https://espace.cern.ch/ph-dep-ESE-BE-ATCAEvaluationProject/PP_IPMC/SitePages/Home.aspx)
 * [CMS ECAL BCP](https://indico.cern.ch/event/677277/contributions/2784169/attachments/1558443/2451980/FNAL_BCP_Workshop_sdg_nov_2017.pdf) - current ATCA development for inspiration
 * [YUGE](https://indico.cern.ch/event/670216/contributions/2741495/attachments/1533563/2401434/YUGE_recap_and_status_October_2017.pdf) - Cornell presentation
 * [ATCA Test Blade](https://indico.cern.ch/event/670216/contributions/2741496/) - ICL presentation

*Things to remember*

 * Per Oliver K -- need one RT per chamber and one time offset per mezz card
 * Consider sector logic in same ATCA crate with MDT trigger --> backplane comms?
 * Dan's segment finder could pretty easily output multiple segments per ROI
 * Confirm that 200kHz ROI are all ATLAS and can be divided by 32 for A/C and sectors
 * Summary for ATLAS ATCA from [EDMS ATU-GE-ES-001](https://edms.cern.ch/ui/file/1304001/1/ATCA-Backupdoc-rev2.pdf)
   * Max power 400W (blade) + 50W (RTM)
   * Dual star backplane OK (full mesh option)
   * Prefer fiber to each blade for TTC
   * GbE base interface required
   * LAPP IPMC (presumably CERN is OK)?

*2019-09-24*

Trying to get organized.  Existing documents:

 * BU SVN [MDT_Trigger](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Documents/MDT_Trigger/trunk/) -- best functional description we have?
 * Gitlab [Proto0_Blade](https://gitlab.cern.ch/atlas-hllhc-muon-mdt-trigger-doc/Proto0_Blade) -- hopelessly out of date (FMC mezzanine)
 * BU SVN [Proto0_blade](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Documents/Proto0_Blade/trunk/) -- Hardware description, more or less up to date in 2019
 * BU SVN [Firmware Tasks](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Documents/Firmware_Tasks/trunk/) -- list of firmware tasks.  More or less up to date in 2019

*2018-12-18*

*SERDES speeds*


| Type | 0.9V || 0.85V || 0.75V  |
| ---- | ---- || ----- || -----  |
|     |  -3  | -2  | -1 | -2 | -1 |
| GTH | 16.375 | 16.375 | 12.5 | 12.5 | 10.3125 |
| GTY | 32.75 | 28.21 | 25.785 | 28.21 | 12.5 |

*2018-10-22*

   * [DanAgendaMuonWeekOct2018](DanAgendaMuonWeekOct2018.md)

*2018-10-10*

Preparation for Dan's talk.  Some observations:

In the [TDR](https://cds.cern.ch/record/2296879/files/ATL-COM-DAQ-2017-185.pdf) on page 190,
it is mentioned that the blade FPGA is VU125 and the mezz card has 3x KU115.
Wu proposes a KU15P + ZU11EG.

*2018-03-27*

Main blade FPGA (not Proto0) could be KU15P-A1760 which has a total of 76 MGT.
Started on mechanical dwg with 3 mezz cards in ohm:Proj/ATLASP2/Trigger

*2018-03-23*

Ethernet:

 * Ports
   * 1000Base-T (IPMC)
   * 1000Base-T (RJ-45)
   * 1000Base-T (ATCA 1)
   * 1000Base-T (ATCA 2)
   * RGMII/SGMII (Zynq)
 * Switch candidates:


|=Part=|=Datasheet=|=Used On=|=Notes=|
|------|-----------|----- ---|-------|
| Broadcom BCM53134M | NDA | ICL Serenity | works fine but hard to get docs |
| Microchip KSZ9897 | Yes | | |
| Microsemi VSC7512 | NDA | Wisconsin prototype | plan for WI mezzanine board |

CERN IPMC has on-board PHY (100Base-TX).  They suggest a TI dumb switch TS3L110 with control by an IPMC GPIO for backplane/RJ-45 selection.

Zynq can do anything but easiest is GMII, RGMII or [SGMII](http://ohm.bu.edu/~hazen/DataSheets/Cisco/SGMII_.pdf)


*2018-03-15*

Thinking again about FPGA choice for prototype.  Need bare minimum of 12, pref 24 MGT.
Revisit Link counting


| Target | Tx | Rx | Notes |
| ------ | -- | -- | ----- |
| MDT CSM | 3 | 9  | 3 MDT chambers |
| S.L. | 4 | 4 | 2 SL boards |
| FELIX | 2 | 2 | |
| AXI C2C | 1 | 1 | to Zynq |
| FMC | 1 | 1 | spare |
| FMC / AM | 3 | 3 | need 4 total for AM |
| Total | 14 | 20 | including AM |

Rough count of SelectIO


| Target       | Pairs | SE | Notes            |
| ------       | ----- | -- | -----            |
| AXI C2C Zynq |       | 20 |                  |
| DDR Memory   |  6    | 44 | est for DDR3 x16 |
| FMC HPC      | 76    |    | plus some clocks |

Some FPGA options


|=Part=| MGT | LCells | 36k BRAM |
|------| --- | ------ | --- ---- |
| KU040 | 20 | 530k | 600 |
| KU060 | 32 | 726k | 1080 |


Draft document on Prototype 0 in Gitlab:
https://gitlab.cern.ch/atlas-hllhc-muon-mdt-trigger-doc/Proto0_Blade

*2018-01-29*

Meeting at CERN, notes:  [AtlasL0MDTPrototypeNotes](AtlasL0MDTPrototypeNotes.md)]

*2017-12-19* Prototype !Goals/Requirements

 * FPGA 1: Input processing
   * MDT hit inputs
     * Receive a significant number of xGBT links (ideally up to 40 or so) for testing
     * Decode eLink, TDC protocol
   * DAQ Path
     * Receive L0A from TTC system (*details needed*)
     * Delay hits for 10uS or 35us L0 delay (see [talk](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Meetings/2017-07-06_TDAQ/mdt_daq_hazen_2017-07-06.pdf)) -- needs ~450 or 750 BRAMs for 10uS or 35uS
     * Match hits to L0A and buffer in DDR memory
     * Output to FELIX (simulated?) on many parallel links
   * Trigger Path
     * Receive ROI from SL
     * Process ROI and assign processor
     * Extract hits and send to segment finder
     * Transmit on low-latency links to (virtual) MC
 * FPGA 2:  (Virtual) DB Functions
   * Manage multiple segment finder processors (maybe resource limited to 1)
   * Receive low-latency hits
   * Proccess in segment finder
   * Transmit on low-latency links to track finder
 * FPGA 3:  Track Finder
   * Receive low-latency segments from (virtual) MC
   * Calculate P(t)
   * Output to SL


*2017-12-18* More prototype thoughts

 * Input FPGA could be a ZU19EG
   * Total 72 GTH+GTY, all speeds can run > 10.3125 Gb/s
   * 1M FF, 512k LUTs
   * *but* only one DRAM interface, so FELIX output with buffering would be a problem.

*2017-12-15* Prototype architecture

Required functions:

 * Input FPGA:
   * Large group of xGBT-FPGA receivers (36 or so)
   * DDR memory, DAQ output to FELIX
   * Inputs from SL
   * Hit extraction, calibration
 * "Virtual Mezz" or real mezz
   * Segment finding (Zynq or Legendre)
   * Requires ~ 100k LUTs and 100k regs for Legendre
 * Track fitter
   * Track fitting, coordinate transformation
   * Outputs to SL

*2017-12-15* Zynq selection

7000 series:  7030 and above have GTX SERDES, speeds below.  Need an FF
package and -2 speed grade to get above 10 Gb/s.  As of 12/15/17, the -2FFG676
and -2FFG900 are both in stock at !DigiKey for ~ $2k.

7035 and up have 16x SERDES.  8 usable in FFG676 package, 16 in FFG900.

7045 and 7100 both have 200k+ LUTs so barely enough for Legendre.

<img src="http://ohm.bu.edu/~hazen/ATLAS/Phase2MDT/Zynq7000SERDES.png">

*2017-11-12* AM mezzanine info

For FPGA version:

I/OSERDES run at 1000-1250 Mb/s on U(+) parts.
This is conveniently 3x the 360MHz pipeline speed, so one
set of 32-36 pairs could handle 3X segment finder inputs.
We need 3 of these for the 3 stations, I guess, so a total
of 96-108 pairs.
```
FMC-HPC pair counting:

LA00-LA33    (34 pairs)
HA00-HA23    (24 pairs)
HB00-HB21    (22 pairs)

    Total    80	pairs

Plus 20	additional SERDES pairs
```


AMC PRM info from Y.Okumura 4/26/17:
```
* Full implementation of LPC (C+D+G+H)
   - LVDS lines FMC LPC (34 pairs : LA00 - LA33)
   - I2C interface
   - JTAG interface
   - High speed line (DP0 C2M & M2C)
   - clock interface
* Partial implementation of HPC (only two additional high speed lines on A)
   - DP1 (C2M & M2C) and DP2 (C2M & M2C)
```

*2017-04-10* Zynq ARM-cortex9 info
 * Zynq ARM core speeds
   * [Feature Summary](https://www.xilinx.com/support/documentation/data_sheets/ds190-Zynq-7000-Overview.pdf)
   * ARM speed depends on Zynq device and speed grade.  667Mhz to 1Ghz
 * Integer multiplication
   * [Page 202](http://infocenter.arm.com/help/topic/com.arm.doc.ddi0388i/DDI0388I_cortex_a9_r4p1_trm.pdf)
   * Ignoring instruction pipeline status (stalled)


   | instruction | time (cycles) | latency(cycles) | notes |
   | ----------- | ---- -------- | --------------- | ----- |
   |MLA | 2 | 4 | (32 * 32) + 32 -> 32 |
   |(S/U)MLAL | 3 | 5 | (32 * 32) + 64 -> 64 |

 * Floating point multiplication
   * [Page 27](http://infocenter.arm.com/help/topic/com.arm.doc.ddi0408e/DDI0408E_cortex_a9_fpu_r2p0_trm.pdf)
   * Ignoring instruction pipeline status (stalled)


   |FPU instruction | time (cycles) | latency(cycles) | notes |
   |--- ----------- | ---- -------- | --------------- | ----- |
   |FMUL (single/double) | 1/2 | 5/6 | multiply |
   |FMAC (single/double) | 1/2 | 8/9 | multiply accumulate |
   |FDIV (single/double) | 10/20 | 15/25 | divide |
   |FSQRT (single/double) | 13/28 | 17/32 | |

*2017-03-07* ATCA blade layout

 * Considering blade with 144 fiber I/Os.  This means 24 miniPODs.
 * Looking at (2) XCVU125 in C2104 package.
 * RTM connector e.g. 1469286-1 with 48 pairs, 30 mm high.
 * [Airmax connectors](http://portal.fciconnect.com/Comergent/fci/documentation/datasheet/backplane/bpl_airmax_vs_coplanar.pdf)
   * 10034475-101LF can e.g. fit 50 pairs in 20mm using 5 rows (!)

*2017-02-16* Legendre resource use

Experimented with various things in Vivado.  Bottom line is it takes almost 1 LUT per bit
for 4-bit cells for a counter which stops at 0xf.  Removing that requirement reduces it
by 30%.  Not sure why, since that should just affect LUT contents.  Increasing counter bits
to 5 and using highest bit only as overflow reduces LUT use by 11%.

*2017-01-18* prep for summary talks

 * [usatlas_mdttriggger_weekly_29_11_2016.pdf](https://indico.cern.ch/event/590821/contributions/2383952/attachments/1379740/2097879/usatlas_mdttriggger_weekly_29_11_2016.pdf) -- Segment finding details

*2017-01-11* Revisit ROI rates

ROI rate for barrel from RPCs is ~ 200kHz for all ATLAS.
Per 1/32 sector A/C this is 6.25kHz.

Assume one ROI is 35BX long (875ns).  Probability of one ROI @ 6250Hz in one 35BX period is 1/183.
So for poisson PMF lambda - 1/183.  So P(k) = ((lambda^k)*exp(-lambda)) / k!



*2016-12-16* chat with Kai Chen about GBT

My questions and his answers:

Q: Are Tx and Rx separate, can be in separate FPGAs?

A: Yes, no problem.  Can choose to implement Tx, Rx or both in GBT-FPGA

Q: How to decode e-ports (e-links)?

A: Decoding to the word level (8 bits for 320 Mb/s option) is provided.  Framing for larger words must be done by the user

Q: What is largest number of links implemented so far?

A: BNL has implemented 48 links in a KCU115 for ATLAS LAr

Q: What is the latency and resource use for the cores?

A: He will send details

Other useful information provided:

 * KCU115 are $7000 in singles, $5000 in qty (64 links)

 * If we do not need the reduced/fixed latency option, all GBT-FPGA Rx can use same receiver clock using internal buffer, so no clock-domain crossing is required.

 * May need GBT-SCA ASIC on the front-end to configure/control the GBTX ASIC



*2016-11-15* with Thiago here

Some observations:

1. ROI can be

*2016-10-31*

LeGendre notes:

1. Establish "Legendre" coordinate space as polar (r, phi) WRT chamber origin  (or is this the seed track origin?)

2. Use seed track angle/intercept to set up r, phi binning for histogram

3. Iterate over phi bins, evaluate _r = x0 * cos(phi) + y0 * sin(phi) +/-R_
   for each tube hit, where R is the drift tube radius and x0/y0 are the center of the tube in local coords.

4. Increment 2D histogram at each r, phi.

5. Find the maximum bin



*2016-10-21*

Local discussion w/ John+Kevin.  RPC/TGC resolution ~ 3mrad.  This is ~1.5mm at 500mm height of BOL, e.g.

*2016-10-15*

Separate HE per station?  For typical sector-

```
  Sta  Cbrs  Tubes   Mezz   GBT  Rate[1]
  BO   6     2544    106    18   100 MHz
  BM   6     1728    72     14    66 MHz
  BI   6     1824    77     15    75 MHz
```

![1] Rate is n(tubes) * 200kHz * 20% for time match to 200kHz ROIs

 * [GBT Tutorial](http://indico.cern.ch/event/489996/contributions/2291863/attachments/1345764/2028939/GBTTutorial_-_TWEPP2016.pdf)

*2016-10-13*

Assuming:

```
 6500 tubes/sector
 54 links @ 4.8Gb/s (120Mhz 8b10b 40-bit words)
 200kHz / tube  144 tubes/link --> 30MHz hits / link
 trigger 200kHz per sector
 50Bx window
```

Tube# is 13-bit (0-8191).  Assume sort by eta.  Each ROI would be translated to tube# range (eta range).

As ROIs arrive, keep early/late BX window updated for each of ~4 ROIs.

Need to process ~1GHz total MDT hit rate, compare each against BX range and tube# (eta) range.
Could be parallel or sequential.

Assuming all agree on BC0, need only 6-8 bits of BCN.

200kHz ROI rate with 50BX time window --> 20% live time for >0 active ROIs.
So BX selection rejects 80% of hits resulting in ~200MHz rate of hits matching
only the BX selection.

Maybe 4 pipelines running at 250MHz would do the job, each comparing hits against
upper and lower tube#/eta limits.

*2016-10-12*

Hit extraction ideas:  Buffer ROIs and compare hits as they come in.  Given an average rate of 200kHz of ROIs, one can calculate using Poisson statistics the probability of seeing _n_ ROI inputs in a single BX period is:

```
k  P(n)       Rate(n)
1  4.98E-03   1.99E+05
2  1.24E-05   4.98E+02
3  2.07E-08   8.29E-01
4  2.59E-11   1.04E-03
5  2.59E-14   1.04E-06
```

A circular buffer with 4 or 5 ROIs x 50BX would be adequate.  A time window would be maintained by updating begin/end registers as the ROIs arrive and exit the circular buffer.  MDT hits would be compared as they enter against the begin/end registers, then against spatial coordinates of any live ROIs.

Alternatively one can estimate the probability of seeing _n_ ROIs in a 50BX window as (1/400)^n


|      |   P(n) at rate |             |               |
|      |   ---- -- ---- |             |               |
|      |   100kHz       |   200kHz    |      500kHz	  |
| 1/bx |   400          |   200       |      80	  |
| n	|		  |		 |		  |
| 1    |   2.50E-03     |   5.00E-03  |      1.25E-02 |
| 2    |   6.25E-06     |   2.50E-05  |      1.56E-04 |
| 3    |   1.56E-08     |   1.25E-07  |      1.95E-06 |
| 4    |   3.91E-11     |   6.25E-10  |      2.44E-08 |
| 5    |   9.77E-14     |   3.13E-12  |      3.05E-10 |
| 6    |   2.44E-16     |   1.56E-14  |      3.81E-12 |
| 7    |   6.10E-19     |   7.81E-17  |      4.77E-14 |
| 8    |   1.53E-21     |   3.91E-19  |      5.96E-16 |


So one need keep only ~4 ROIs active and compare the MDT hits against them.  This scheme seems like a winner.


*2016-10-06*

 * [Chios slides](https://indico.cern.ch/event/538558/contributions/2315896/attachments/1345678/2028760/l0mdt_chios_092916.pdf) for reference

<img src="http://ohm.bu.edu/~hazen/ATLAS/Phase2MDT/proposed_trigger_sector_overlap_sm.jpg">

[Enlarge](http://ohm.bu.edu/~hazen/ATLAS/Phase2MDT/proposed_trigger_sector_overlap.jpg)

Proposed overlap scheme would require double the number of links per sector, taking inputs from sector n and n+1.  The worst-case is sector 10+11 and 15+16 which would both require 104 total links.  (this assumes the GBT links are split optically).  Alternatively the links could be received by one sector and sent to the next one, but this would increase latency.

*2016-10-05*

Data extracted from parameter book.  Counts for one sector, one end, maximum.


| Region | Max Chambers | Max Tubes | Max GBT |
| ------ | --- -------- | --- ----- | --- --- |
| Barrel | 22 | 6432 | 54 |
| Endcap | 13 | 4320 | 34 |

(Endcap is EE, EM, EO only)


*2016-09-30*

Thoughts:  Average tube hit rate ~100kHz per current estimates.  One sector has ~6000 tubes (verify!) so total rate is 600MHz of hits in the sector.

This means an average of 600 "live" hits in a us.  Kostas claims for 2-way coincidences in RPC we need to handle 200kHz of trigger hits per sector (one per 5us).

In a simple-minded scheme one would need to compare each ROI against the 600 live MDT hits.  To me this implies storing the MDT hits in a multi-dimensional array by time and two spatial coordinates which can be trivially compared against the ROIs.  Have to figure out how to automatically "age out" the stale MDT hits.

*2016-09-28*

Altera Arria 10 (GX) family is interesting.  The 10AX090U (aka GX900) has 96 transceivers (17Gb/s) and goes for around $5k
(10AX090U4F45E3SG is $5100 at Arrow)

*2016-09-27* FPGA selection for pre-prototype


| Part | Delivery | Price | GTH | GTY |
| ---- | -------- | ----- | --- | --- |
| XCVU065-2FFVC1517 | stock | $7700 | 20 | 20 |
| XCVU080-1FFVA2104C | 16 weeks | $8050 | 28 | 24 |
| XCVU080-1FFVD1517C | 16 weeks | $8200 | 32 | 32 |

*2016-08-30* discussions at CERN

 * [Discussion of TDAQ Architecture Options](https://indico.cern.ch/event/558269/) meeting 7/26/2016
