# QuadPulser
# Control electronics for G-2 Quadrupole pulser

 * [Archive](http://ohm.bu.edu/~hazen/G-2/QuadLogic/) of documents from FNAL / BNL
 * [UW Elog](https://muon.npl.washington.edu/elog/g2/Vacuum+chambers/314) with scope traces
 * [FNAL eLog](https://www.phy.bnl.gov/bloknot/g-2/folder_view.php?folder_id=6) with more scope traces
 * [PicoZED documentation](http://microzed.org/product/picozed)
 * [DocDB 4913](http://gm2-docdb.fnal.gov:8080/cgi-bin/ShowDocument?docid=4913) collection of documents
 * [DocDB 4403](http://gm2-docdb.fnal.gov:8080/cgi-bin/RetrieveFile?docid=4403&filename=Quad_electronics_proposal.pdf&version=1) note "Quad electronics and data acquisition: Proposal"
 * [DocDB 4436](http://gm2-docdb.fnal.gov:8080/cgi-bin/RetrieveFile?docid=4436&filename=Quad_electronics_CD.pdf&version=1) note "Control Electronics for High Voltage Pulsers Conceptual Design"
 * [DocDB 4417](http://gm2-docdb.fnal.gov:8080/cgi-bin/ShowDocument?docid=4417) pulser user manual
 * [Beam timing](http://ohm.bu.edu/~hazen/G-2/QuadLogic/beam_timing.jpg)
 * [QuadPulserChecklist](QuadPulserChecklist.md)
 * [QuadPulserControlDesignNotes](QuadPulserControlDesignNotes.md)
 * [QuadPulserArchives](QuadPulserArchives.md) -- info on early prototype/ideas (look here if missing something!)

### Inventory
   [QuadPulserInventory](QuadPulserInventory.md)
### 2020 Spares Build
[QuadPulser testing](QuadPulser_testing.md)
 * Input Protection Board - Rev B
   * *Order 10 PCBs, 8 assembled*
   * Gerber: [G2-PROT-RevB.zip](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ProtectionBoard/tags/RevB/gerber/fab/G2-PROT-RevB.zip)
   * BOM: [ProtectionBoardGrouped.ods](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ProtectionBoard/tags/RevB/ProtectionBoardGrouped.ods)
 * ADC Board - Rev D
   * *Requested 10 PCBs, 6 assembled 11/5/20*
   * Gerbers: [G2ADC_RevD_2018-03-06.zip](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ADC_board/tags/RevD_as_built/gerber/G2ADC_RevD_2018-03-06.zip)
   * BOM: [ADC_BOM.csv](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ADC_board/tags/RevD_as_built/bom/ADC_BOM.csv)
 * Power Supply Board - Rev D
   * *Build 6*
   * ExpressPCB: [dc_converter.pcb](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/tags/RevD/dc_converter.pcb)
   * BOM: [BOM.ods](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/tags/RevD/BOM.ods) ([DigiKey Order](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/tags/RevD/Digi-Key%20-%20Print.pdf))
 * FMC Board - Rev B
   * *No new boards required*
   * Gerbers: [FMC_INT_REV_B_2018-05-11.zip](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/FMC_interface/trunk/gerber/FMC_INT_REV_B_2018-05-11.zip)
   * BOM: [fmcint_BOM.ods](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/FMC_interface/trunk/fmcint_BOM.ods)
 * Trigger Interface Board (aka timing receiver) - Rev F
   * *Build 6*
   * ExpressPCB: [G2_timing_receiver_pcb.pcb](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/timing_receiver/tags/RevF/G2_timing_receiver_pcb.pcb)
   * BOM: [BOM_RevF.ods](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/timing_receiver/tags/RevF/BOM_RevF.ods)

## 2018 (Final?) Implementation

 * [QuadMultiPulser](QuadMultiPulser.md) -- Development of new multi-charge feature in 2018
 * [QuadPulserMeetings](QuadPulserMeetings.md) -- meetings in 2018
 * PicoZed mezzanine on FMC carrier (both from Avnet).
 * ADC Board (Rev D) [schematic](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ADC_board/trunk/adc_sch.pdf) [SVN](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ADC_board/trunk/)
   * [ADCBoardRevDTesting](ADCBoardRevDTesting.md) - Test
 * FMC Interface [schematic](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/FMC_interface/trunk/fmcint_sch.pdf) [SVN](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/FMC_interface/trunk/)
   * [FMCInterfaceRevDTesting](FMCInterfaceRevDTesting.md) - Test log
 * Power Supply Board [SVN](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/trunk/)
   * [DC_ConverterRevDTesting](DC_ConverterRevDTesting.md) - Test log
 * [G-2 Quad Pulser assembling notes](G-2_Quad_Pulser_assembling_notes.md)



### Power Supply Notes

 * [ADCBoardNewPowerSupply](ADCBoardNewPowerSupply.md) -- Details / thoughts on new power supply scheme

### Testing Feb 2021
