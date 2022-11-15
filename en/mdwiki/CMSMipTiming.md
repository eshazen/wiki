# CMSMipTiming
## CMS MIP Timing Detector (MDT)

 * GitLab:  https://gitlab.cern.ch/cms-etl-electronics
 * SVN: https://gauss.bu.edu/svn/cms-mip-timing
 * DocCB:  https://cms-docdb.cern.ch/cgi-bin/DocDB/ShowDocument?docid=13863
 * TDR:  https://gauss.bu.edu/svn/cms-mip-timing/TDR/tdr_int_rdr.pdf
 * SH spec: https://docs.google.com/document/d/1_NJmnKWLqiO6KO-vl0kkdAXq7U0Rb3eE280yMmDICWU/edit?usp=sharing_eip&ts=5e4ea1bf
 * *Power Board*
   * CERN DC/DC: https://project-dcdc.web.cern.ch/project-dcdc/
   * [Optimization of Shielded PCB Air-Core Toroids forHigh-Efficiency DC–DC Converters](https://cds.cern.ch/record/1399742/files/05621918.pdf)
   * PB talks: [ETL-PowerBoard-S_Los-Apr29-2019.pdf](https://indico.cern.ch/event/816963/contributions/3410407/attachments/1835888/3008017/ETL-PowerBoard-S_Los-Apr29-2019.pdf) [ETL-PowerBoard-S_Los-Apr29-2019.pdf](https://indico.cern.ch/event/816963/contributions/3410407/attachments/1835888/3008017/ETL-PowerBoard-S_Los-Apr29-2019.pdf) [ETL-DC-DC-Converter-S_Los-Mar11-2019.pdf](https://indico.cern.ch/event/805404/contributions/3351449/attachments/1810161/2955880/ETL-DC-DC-Converter-S_Los-Mar11-2019.pdf)
   * [Prototype DC/DC Converter for ETL](https://indico.cern.ch/event/836184/contributions/3506802/attachments/1883016/3103089/FermilabDC2DCconverter.pdf)
 * Chip Datasheets and Documentation
   * LPGBT Manual: https://lpgbt.web.cern.ch/lpgbt/manual/
   * LPGBT Spec: https://espace.cern.ch/GBT-Project/LpGBT/Specifications/LpGbtxSpecifications.pdf
   * LPGBT Talk w/ Power Estimates: https://espace.cern.ch/GBT-Project/LpGBT/Presentations/20190118lpGBTnews.pdf
   * VLDB+ v1.1 Schematic: https://edms.cern.ch/ui/file/2339885/1/EDA-04075-V1-1sch.pdf
   * GBT-SCA Manual: https://espace.cern.ch/GBT-Project/GBT-SCA/Manuals/GBT-SCA_Manual_2019.002.pdf
   * VTRX+ Datasheet: https://edms.cern.ch/file/1719329/1/VTRxPlus_spec.pdf
   * VTRX+ Application Note: https://edms.cern.ch/file/2149674/1/VTRxPlusApplicationNote.pdf
   * ALDO2 Info Presentation: https://indico.cern.ch/event/836713/contributions/3507802/attachments/1883975/3105094/2019-07-22_ALDOv2_submission_and_plans.pdf
   * BPOL25 Datasheet: https://project-dcdc.web.cern.ch/project-dcdc/public/Documents/bPOL2V5_V2.2%20datasheet%20rev4.pdf
   * BPOL12 Datasheet: n/a
   * LINPOL12 Datasheet: https://project-dcdc.web.cern.ch/project-dcdc/public/Documents/linPOL12V%20datasheetV3.3.pdf
   * ETROC Datasheet: n/a
   * FEAST Datashset: https://project-dcdc.web.cern.ch/project-dcdc/public/Documents/FEAST2Mod_Datasheet_gb2016.pdf
 * DAQ
   * https://gitlab.cern.ch/groups/mtd-backend
   * https://gitlab.cern.ch/groups/mtd-backend/daq

This consists of two parts, Barrel Timing Layer (BTL) and Endcap Timing Layer (ETL).
We are joining the ETL effort.

P2 trigger/daq:  750kHz, 12.5us latency

### Working Notes


 * [ETLServiceHybridNotes](ETLServiceHybridNotes.md)

### On detector

On-chamber elx operate at -30C

<img src="http://ohm.bu.edu/~hazen/CMS/MTD/mtd-rad.png">

LGAD detectors

module 16x32 (21x42mm) LGAD array of 1.3x1.3mm pads

Two ETROC ASIC 20x20mm per module (16x16 pixels)

Service hybrid = power board + readout board

Serial output 320/640/1.28 eLinks 32-bit raw binary with some framing words.

 * Intro slides: [ETL_Feb2020.pdf](https://indico.cern.ch/event/886886/contributions/3739185/attachments/1982629/3302257/ETL_Feb2020.pdf)

### DAQ

Both Serenity and BCP are suggested as options in the TDR.

### Work Log

*2020-02-17*

Received from Frank Golf on 2/14:

 Below are links to (mechanical) layouts and possible connectors for the flex cable.  We have been considering two designs for now,
 one with a single connector on the service hybrid side and one with three connectors.  The three connector version has a connector
 for each ETROC and a separate connector to supply the sensor bias voltage.  We haven't looked into connectors beyond paper
 planning.  There are a few options we used for cost estimates in the folder linked below.  Both the flex design and the choice of
 connector are still open questions.

 * Layout: [dropbox](https://www.dropbox.com/sh/qvh7qaa2cm6994z/AADRpmDuqcoxNLNBWf2-cqmda?dl=0) [local](https://gauss.bu.edu/svn/cms-mip-timing/OP_dwg/Frank_Flex_Layout_2020-02-14/)
 * Connectors: [dropbox](https://www.dropbox.com/sh/vf0v2hdhn6uz956/AADwyauDQPbC9EccnGHzXk-ma?dl=0)

Drawings of two module types (2-sensor and 1-sensor):

 * [dropbox](https://www.dropbox.com/s/xgrm2d2x6jta05r/F10112956-ETL_MODULE_TYPES.stp?dl=0)

