# AtlasL0MDTPrototypeNotes
## Notes from CERN meeting January 29, 30 2018

### Links

 * [YUGE](https://indico.cern.ch/event/670216/contributions/2741495/attachments/1533563/2401434/YUGE_recap_and_status_October_2017.pdf) - Cornell test board
 * [ATCA Test Board](https://indico.cern.ch/event/670216/contributions/2741496/) - Imperial College
 * [CMS ECAL](https://indico.cern.ch/event/677277/contributions/2784169/attachments/1558443/2451980/FNAL_BCP_Workshop_sdg_nov_2017.pdf) - ATCA board (Virginia, Wisconsin)
 * [Exclustra ZX2](https://www.enclustra.com/en/products/system-on-chip-modules/mars-zx2/) Zynq module
 * [CERN IPMC](https://espace.cern.ch/ph-dep-ESE-BE-ATCAEvaluationProject/PP_IPMC/SitePages/Home.aspx)

### Slides from [Meeting](https://indico.cern.ch/event/693838/)

 * [mdt_trig_hw_2018-01-29.pdf](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Meetings/2018-01-29/mdt_trig_hw_2018-01-29.pdf)

Current thinking is:

 * Input FPGA (7 series or Ultrascale) with all MDT links, SL inputs, DAQ outputs
   * GBT-FPGA receive/decode
   * SL receive/process
   * hit extractor
   * DAQ functions
   * Maybe DDRx SDRAM
 * "Virtual Daughterboard" FPGA (Zynq) with SL outputs
   * Segment finder
   * Track fitter
 * Control FPGA with Linux (likely a mezzanine e.g. Enclustra Mars)
 * Chip-to-chip links
   * ~20 SelectIO plus serdes
   * Could be AXI chip-to-chip or simple custom link
 * CERN IPMC

Prototype could just have two copper Ethernet ports to IPMC, control Zync

### Prototype link counting (board, bare minimum):


| Target | Tx | Rx | Notes |
| ------ | -- | -- | ----- |
| MDT CSM | 3 | 6 | 2 MDT chambers |
| SL      | 4 | 4 | 2 SL boards |
| Ethernet | 1 | 1 | Maybe XAUI or? |
| FELIX | 2 | 1 | |
| Total | 10 | 12 |

## Input FPGA thoughts

Minimum size part KU040 (20 SERDES) maybe A1156 pkg

Should be upward-compatible footprint in case KU040 resources inadequate

## "Virtual Daughterboard" FPGA thoughts

Some conflicting requirements here:

 * For FPGA Legendre, would like ~600k FFs, LUTs
 * For Zynq algorithm, would like 7045 or 7100 Zynq for compatibility (but largest 7100 has "only" 277k LUTs, only enough for one Legendre engine)

Possibly an FMC mezzanine even here?

## Control FPGA

 * E.g. 7010/7020
 * System control only
 * Enclustra or PicoZED module?

