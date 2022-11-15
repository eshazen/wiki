# Roblyer_dDOSI
This page describes a possible development project for Darren Roblyer
(new BU faculty) to support his
research in diffuse optical spectroscopic imaging (DOSI) methods to study breast
tumor hemodynamics and metabolism during chemotherapy.

A data acquisition run is defined in terms of "sweeps" where the modulation frequency
for lasers is swept from 50MHz to 400MHz in 1MHz steps.  At each step 4k samples are
captured.  Thus the total data volume for a sweep is approximate 5.6MBytes.

 * [SnrDsgnDOSI](SnrDsgnDOSI.md)
 * [Google Document](https://docs.google.com/document/d/1iR1E2-k7db6B9Q2btlIoGyC2WG1WLKMNHTiAwsF2x5w/edit)
 * [DosiFirmware](DosiFirmware.md)
 * [DosiEnclosure](DosiEnclosure.md)
 * [DosiSerialNumbers](DosiSerialNumbers.md)
 * [DosiSoftware](DosiSoftware.md)
   * [Dosi_Setup_uHAL](Dosi_Setup_uHAL.md)
   * [DDS_Interface_Notes](DDS_Interface_Notes.md)


### PCB Layout

 * [DOSI.PDF](http://ohm.bu.edu/~hazen/Roblyer/FPGA_Board/Wu/DOSI.PDF)
 * [DosiNew.zip](http://ohm.bu.edu/~hazen/Roblyer/FPGA_Board/Wu/DosiNew.zip)
 * [PCB Sketch](http://ohm.bu.edu/~hazen/Roblyer/PCB%20Sketch.pdf)


### Other Documents

 * [Slides](http://ohm.bu.edu/~hazen/Roblyer/dDOSI%20Lab%20Presentation%201_11_2012%20%5bRead-Only%5d.pdf)
 * [AD9914](http://www.analog.com/static/imported-files/data_sheets/AD9914.pdf)
 * [ADC12D1800RF](http://www.national.com/pf/AD/ADC12D1800RF.html#Overview)
 * [ANSI-VITA-57-1-Rev2010.pdf](http://joule.bu.edu/~hazen/edf_joule/vita/ANSI-VITA-57-1-Rev2010.pdf)
 * [AdapterBoardDescriptionV2.pdf](http://ohm.bu.edu/~hazen/Roblyer/AdapterBoardDescriptionV2.pdf)
 * [AdapterBoardFPGAPinCount.pdf](http://ohm.bu.edu/~hazen/Roblyer/AdapterBoardFPGAPinCount.pdf)

Current proposal is to use the
[ADC2D1800RFRB board](http://www.national.com/pf/AD/ADC12D1800RF.html#Boards) [(datasheet)](http://ohm.bu.edu/~hazen/DataSheets/National/ADC12D1800RFRB.pdf) &bull; ([Schematic/Layout](http://joule.bu.edu/~hazen/Roblyer/AD12D1800RFRB/)
[AD9910/eb](http://www.analog.com/en/rfif-components/direct-digital-synthesis-dds/ad9910/products/EVAL-AD9910/eb.html)
board for the DDS chip.

The ADC board has a high pin count FMC connector (400 pins).

### PXI Data

 * [Agilent M9210A](http://ohm.bu.edu/~hazen/Roblyer/Agilent-5990-6462EN.pdf)
 * [PXI-1033](http://ohm.bu.edu/~hazen/Roblyer/cat_pxi1033chassis-1.pdf)

### VME Data

 * [CAEN V1761](http://ohm.bu.edu/~hazen/Roblyer/CAEN_V1761.pdf)
 * [CAEN VME8004A](http://ohm.bu.edu/~hazen/Roblyer/CAEN_VME8004A.pdf)
 * [CAEN A3818](http://ohm.bu.edu/~hazen/Roblyer/CAEN_A3818.pdf)
 * [CAEN V2718](http://ohm.bu.edu/~hazen/Roblyer/CAEN_V2718.pdf)
 * [CAEN V1718](http://ohm.bu.edu/~hazen/Roblyer/CAEN_V1718.pdf)

Notes:

*'2012-03-27* - Obtained pricing on VME and PXI digitizer options
*'2012-02-28* - ordered 4 samples of FMC connector ASP-134485-01 from Samtec

