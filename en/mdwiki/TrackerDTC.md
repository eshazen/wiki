# TrackerDTC
## Reference

 * Tracker DAQ Development [espace](https://espace.cern.ch/Tracker-Upgrade/DAQ/SitePages/Home.aspx)
 * Data format: [GitHub](https://github.com/CMS-ITDTC/DataFormat)
 * uDTC [firmware](https://gitlab.cern.ch/cms_tk_ph2/d19c-firmware) (aka d19c) [IT-firmware](https://gitlab.cern.ch/cmstkph2-IT/d19c-firmware) [middleware](https://gitlab.cern.ch/cmsinnertracker/Ph2_ACF/tree/chipPolymorphism)
 * uDTC [manual](https://gitlab.cern.ch/cms_tk_ph2/d19c-firmware/blob/master/doc/d19c_manual.pdf) (aka d19c)
 * RD53A Chip: [manual](http://cds.cern.ch/record/2287593)
   * RD53B Chip: [Draft manual](http://cds.cern.ch/record/2665301?ln=en) [local copy 2020-05-29](http://ohm.bu.edu/~hazen/CMS/RD53B_Main_2020-05-29.pdf)
 * Aurora protocol [specification](https://www.xilinx.com/support/documentation/ip_documentation/aurora_64b66b_protocol_spec_sp011.pdf) (Xilinx) * [10 GbE](http://ohm.bu.edu/~hazen/DataSheets/Ethernet/802.3-2008_section4.pdf) page 262+
 * IT Services: [shared documents](https://espace.cern.ch/Tracker-Upgrade/Pixel_electronics/Shared%20Documents) [Rates from 7/18](https://indico.cern.ch/event/742831/contributions/3075713/attachments/1689894/2718903/IT_DTC_ratesv2.pdf)
 * Tracker TDR:  [TWiki](https://twiki.cern.ch/twiki/bin/view/CMS/Phase2TrackerTDR) ([local](http://ohm.bu.edu/~hazen/CMS/CMS-TDR-014.pdf))
 * LUMI talks:  [July 2018](https://indico.cern.ch/event/651807/contributions/2662174/attachments/1496389/2328473/BRIL_Phase2lumi.pdf) [Oct 2017](https://indico.cern.ch/event/671629/contributions/2760284/attachments/1548095/2430578/BRIL_LumiRnD.pdf)
 * [DTH page](https://cms-daq-dth-p1.web.cern.ch/) [TDCS2 page](https://cmstcds2.docs.cern.ch/)
 * CMS DAQ: [CmsPhase2Daq](CmsPhase2Daq.md) collection of links to Git repos, etc
   * [Custom Hardware Network Interface Specification...](https://edms.cern.ch/document/2735323/1.0) for IP addresses etc
   * [DTH spec](http://ohm.bu.edu/~hazen/CMS/TrackTrigger/IN2018_001.pdf) [Interface spec](http://ohm.bu.edu/~hazen/CMS/TrackTrigger/IN2018_002.pdf) (updated April 2019) ([source](https://cds.cern.ch/record/2309743/))
   * Interim TDR: [pdf](https://twiki.cern.ch/twiki/pub/CMS/DaqIDPhase2/p2uDAQ-20170906.pdf) [DocDB](https://cms-docdb.cern.ch/cgi-bin/DocDB/ShowDocument?docid=13356)
   * 2020-04-01 [Talk](https://indico.cern.ch/event/902339/contributions/3798300/attachments/2013805/3365920/UserForum_2020-04-02.pdf) with details of DTH and firmware
 * LPGBT: [ACES 2016 talk](https://indico.cern.ch/event/468486/contributions/1144369/attachments/1239839/1822836/aces.2016.03.08.pdf) [forums](https://vldbplus.web.cern.ch/) [ACES 2018 talk](https://indico.cern.ch/event/681247/contributions/2928992/attachments/1638547/2615288/aces2018_kulis_lpgbt.pdf) [Tutorial](https://indico.cern.ch/event/697988/contributions/3075493/attachments/1720215/2776777/lpGBTtutorialTwepp20180921.pptx)
 * GBT-FPGA [Project page](https://espace.cern.ch/GBT-Project/GBT-FPGA/default.aspx)
 * LpGBT [Manual](https://cern.ch/lpgbt) [LpGBT-FPGA](http://lpgbt-fpga.web.cern.ch/doc/html/)
 * VL+ [site](https://espace.cern.ch/project-Versatile-Link-Plus/SitePages/Home.aspx) [TWEPP19](https://indico.cern.ch/event/799025/sessions/317612/attachments/1901284/3138633/VLplus_Vasey_TWEPP_03Sep2019.pdf) [EDMS](https://edms.cern.ch/ui/#!master/navigator/project?P:1930058715:1767090345:subDocs) (Samtec specs)
 * !Compression/Readout: [Yangyang talk](http://ohm.bu.edu/~hazen/CMS/InnerTracker/pixeldatarate_hllhc_110717.pdf) Nov 2017
 * YY Pixel Layout: [drawings](http://test-yangyang-tklayout.web.cern.ch/test-yangyang-tklayout/OT613_200_IT4025/layoutpixel.html)
 * [status](http://ohm.bu.edu/~hazen/CMS/InnerTracker/RD53_CMS_meeting_dec_2016.pdf) Dec 2016
 * Data Compression: [Androsov](http://ohm.bu.edu/~hazen/CMS/InnerTracker/2016-07-28_On-chip_data_compression.pdf) July 2016
 * DTC Rates: [Spreadsheet](http://ohm.bu.edu/~hazen/CMS/DTC_workbook_V1.xlsx) from Mark P/Stella O 6/14/18
   * [DTCChipsLinksTable](DTCChipsLinksTable.md) -- table from Andreas with links/DTC and chips/DTC
 * Serenity: [talk](https://indico.cern.ch/event/670216/contributions/2741496/attachments/1533624/2401495/ATCA_Development_Platform_v2_2017-10-02.pdf) Oct 2017
 * uDTC: [eSpace](https://espace.cern.ch/Tracker-Upgrade/DAQ/SitePages/Home.aspx)
 * [Trk BE gitlab](https://gitlab.cern.ch/cms-tracker-phase2-backend-development-engineering)
 * [TIF Twiki](https://twiki.cern.ch/twiki/bin/viewauth/CMS/Ph2TrackerTIF)

 * [TrackerDTCFirmwareNotes](TrackerDTCFirmwareNotes.md) -- notes on firmware
 * [UsefulSlideReviewOct2019](UsefulSlideReviewOct2019.md)

## !Cost/Schedule

 * [Peter's Budget](https://www.dropbox.com/s/vqgzyypuy7lmd71/MAGA%20cost%20estimate%20post%20PDR.xlsx?dl=0) (Dropbox link)
 * [BU Proposal](http://gauss.bu.edu/svn/cms-tracker/Documents/DTCProposal_BU/trunk/DTCProposal_BU2018.pdf) (SVN link to current PDF)

## Documentation

 * SVN:  http://gauss.bu.edu/svn/cms-tracker (see [Meetings](http://gauss.bu.edu/svn/cms-tracker/Meetings/) folder for BU-created slides)
   * [DTCProposal_BU](http://gauss.bu.edu/svn/cms-tracker/Documents/DTCProposal_BU/) -- draft proposal / SOW by Zeynep
 * [PixelDTCDesignNotes](PixelDTCDesignNotes.md)
 * [AuroraProtocolDevelopment](AuroraProtocolDevelopment.md) -- starting work on Aurora encode/decode
 * [ITDTCSimulation|Simulation Studies for IT DTC](ITDTCSimulation|Simulation_Studies_for_IT_DTC.md)
 * [PixelGeometryExplained](PixelGeometryExplained.md) for the befuddled

## Obsolete outer tracker stuff

 * [Eva Oct 12th DTC update](https://indico.cern.ch/event/572324/contributions/2322029/subcontributions/209630/attachments/1353781/2046330/cabling_l1tkmeeting_tkweek_20161012.pdf)
 * [Outer Tracker](https://indico.cern.ch/category/3550/) (Indico)
 * [CMSTrackerWeek12May2016_DTC.pdf](https://indico.cern.ch/event/526356/contributions/2155733/attachments/1272231/1886022/CMSTrackerWeek12May2016_DTC.pdf) -- Useful DTC talk by F. Vasey from May 2016 tracker week

## Notes

 * 72 inputs (9.6 Gb/s) and 30 outputs (25 Gb/s)
 * 100G to DAQ (?) so 4 additional 25G.  Should plan for 8 for two DAQ cards so total 72 GTH, 38 GTY
 * FPGA options for one device:


| *Part* | *Package* | *GTH* | *GTY* |
| ------ | --------- | ----- | ----- |
| XCVU190 | A2577 | 60 | 60 |
| XCV7190 | A2577 | 60 | 60 |
| XCVU9P | A2577 | | 120 |
| XCVU13P | A2577 | | 128 |
