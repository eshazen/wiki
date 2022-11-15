# RoblyerDOSIRackMount
This page describes a 2017 project to develop a second-generation D-DOSI system.

See also http://ohm.bu.edu/trac/edf/wiki/RoblyerDOSIPortable and http://ohm.bu.edu/trac/edf/wiki/Roblyer_dDOSI

## Conceptual Design

 * Carrier board accommodating 3-5 FMC (FPGA Mezzanine Card) modules
 * FMC module with 2 or 3 digital frequency synthesizers
 * SVN (Current PCBs):  http://gauss.bu.edu/svn/botlab.dosi
 * SVN (Older docs):  http://gauss.bu.edu/svn/roblyer-ddosi-rack-mount/

## Production History Review (2/22)

 * 9/1/22: See [google doc](https://docs.google.com/document/d/1aYw62dYNRXWGI0C459B6jITdd1jEgigorsL1qB_4sPY/edit?usp=sharing) for updates on back-ordered parts

 * 8/9/19:  Newgrange layout for Rev 2 GPIO, ADC, DDS [bill](https://edf.bu.edu/edfdb/mysql/edf/purch/bill_view_new.cgi?bill_id=3168)
 * 9/30/19: Cirexx fab (DDS, GPIO, ADC) [bill](https://edf.bu.edu/edfdb/mysql/edf/purch/bill_view_new.cgi?bill_id=3190)

Tag the SVN as Rev 2.0:

```
 svn copy http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk \
  http://gauss.bu.edu/svn/botlab.dosi/hardware/tags/Rev-2.0 \
  -m "Tagging at 2.0 before re-spin in 2022"
```

Looking at SVN log and email, we find:

```
Carrier Rev 2 deliverables received 11/6/18 from Maggie at Newgrange.
These are now in
  /hardware/tags/Rev-2.0/CARRIER/DES
  /hardware/tags/Rev-2.0/CARRIER/FAB
along with the zipfiles

r288 | Mike | 2019-08-15 16:39:05 -0400 (Thu, 15 Aug 2019) | 1 line
Changed paths:
   M /hardware/trunk/ADC/ADC-BOARD.DSN
   M /hardware/trunk/ADC/D-DOSI-ADC.brd
   A /hardware/trunk/ADC/D-DOSI-ADC_DES.zip
   A /hardware/trunk/ADC/D-DOSI-ADC_FAB.zip

Final board and schematic files with FAB and DES packages
------------------------------------------------------------------------
r287 | Mike | 2019-08-15 16:25:06 -0400 (Thu, 15 Aug 2019) | 1 line
Changed paths:
   A /hardware/trunk/GPIO/D-DOSI GPIO_DES.zip
   M /hardware/trunk/GPIO/D-DOSI-GPIO.brd
   A /hardware/trunk/GPIO/D-DOSI_GPIO_FAB.zip

Final board and schematic with FAB and DES packages
------------------------------------------------------------------------
r286 | Mike | 2019-08-15 16:23:18 -0400 (Thu, 15 Aug 2019) | 1 line
Changed paths:
   M /hardware/trunk/DDS/D-DOSI-DDS.brd
   A /hardware/trunk/DDS/D-DOSI-DDS_DES.zip
   A /hardware/trunk/DDS/D-DOSI-DDS_FAB.zip
   M /hardware/trunk/DDS/DDS-BOARD.DSN

Final brd and dsn + deliverables
------------------------------------------------------------------------
r285 | Mike | 2019-08-14 13:19:22 -0400 (Wed, 14 Aug 2019) | 1 line
Changed paths:
   M /hardware/trunk/DDS/D-DOSI-DDS.brd
   M /hardware/trunk/DDS/DDS-BOARD.DSN

Rev 2 board changes and schematic changes (added foots to U201,202; added NC property U202.1; U1 ground change\
d from AGND to GND)
```


## Rackmount version Rev B

ECO/Notes on Rev 2.0:

 * DDS board:  C71 is wrong footprint, should be 1206.  Need to scrape some soldermask to install the correct 1206 part.
 * DDS board:  C8, C102, C201, C202 have value "CAP" should be 0.1uF
 * DDS board:  Increase trace width on 1.8V between two isolated areas

 * Carrier:  Oscillators were installed 90 deg rotated.  Fix/clarify silkscreen?

These are as built schematics for Rev B (aka Rev 2.0, dated Aug 2019).  Received from assembly 11/8/19.

 * ADC board [Schematic](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/ADC/ADC-BOARD-SCH.pdf)
 * DDS board [Schematic](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/DDS/DDS-BOARD-SCH.pdf)
 * GPIO board [Schematic](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/GPIO/GPIO-SCH.pdf)

(the Carrier/motherboard has not changed for Rev B)

## Rackmount version Rev A

 * Motherboard: [SVN](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/) [Schematic](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/DES/D-DOSI-CARRIER-SCH.pdf)[Schematic](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/carrier_sep_pages.pdf) (FMC site details)
   * [Layout Notes](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/Main_board/Docs/MotherboardLayoutNotes.pdf)
   * [Carrier_FMC_Pinout.ods](http://gauss.bu.edu/svn/botlab.dosi/Docs/SystemDocs/Carrier_FMC_Pinout.ods) -- pinout spreadsheet
   * [Mechanical](http://gauss.bu.edu/svn/botlab.dosi/Docs/Mech/CARRIER%20Model%20(1).pdf) [DXF](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/CARRRIER.dxf)
 * ADC board: [SVN](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/ADC/) [Schematic](http://gauss.bu.edu/svn/botlab.dosi/hardware/tags/RevA/ADC/adc-board.pdf) [Layout Notes](http://gauss.bu.edu/svn/botlab.dosi/Docs/ADC_Board_Layout_Notes.pdf) [Mechanical](http://gauss.bu.edu/svn/botlab.dosi/Docs/Mech/ADC%20Model%20(1).pdf) [DXF](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/ADC/ADC.dxf)
   * [ADCLayoutComments](ADCLayoutComments.md)
 * DDS board: [SVN](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/DDS/)[Schematic](http://gauss.bu.edu/svn/botlab.dosi/hardware/tags/RevA/DDS/dds-board.pdf) [Layout Notes](http://gauss.bu.edu/svn/botlab.dosi/Docs/DDS_Board_Layout_notes.pdf) [Mechanical](http://gauss.bu.edu/svn/botlab.dosi/Docs/Mech/DDS%20Model%20(1).pdf) [DXF](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/DDS/DDS.dxf)
 * GPIO board: [Schematic](http://gauss.bu.edu/svn/botlab.dosi/hardware/tags/RevA/GPIO/gpio.pdf) [SVN](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/GPIO/) [Layout Notes](http://gauss.bu.edu/svn/botlab.dosi/Docs/GPIO_Board_Layout_notes.pdf) [GPIOPinout](GPIOPinout.md)
 * [RoblyerDOSIRackMountDesignNotes](RoblyerDOSIRackMountDesignNotes.md) -- notes/observations on new design including *Debug Log* and *ECO Lists*


## Current Prototype Reference Materials

 * [DDS Schematic](http://ohm.bu.edu/~hazen/DOSI/DSAU_DDS_PDF_SCHEMATIC.pdf)
 * [Motherboard Schematic/layout](http://ohm.bu.edu/~hazen/DOSI/dsau-motherboard-revA-booklet.pdf)
 * [Roblyer_dDOS_Undersampling_dSAU](Roblyer_dDOS_Undersampling_dSAU.md) -- link to Senior Design documentation of first prototype

### 2018-10-30 Check for mfg

 * Created BOM with !DigiKey list [CARRIER_20181026A.ods](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/CARRIER_20181026A/CARRIER_20181026A.ods)
 * Temporary Gerbers/drill [Gerber](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/CARRIER_20181026A/Gerber/)
 * For impedance control layer 1-2 and 5-6 dielectric should be .005"
 * Missing FPGA "DONE" LED:  Added it.  Need to add parts to BOM.
   * [carrier_20181026a_rev.pdf](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/CARRIER_20181026A/carrier_20181026a_rev.pdf)  [CARRIER_20181026A_REV.DSN](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/CARRIER_20181026A/CARRIER_20181026A_REV.DSN)
 * Got Advanced price: ([quote](http://gauss.bu.edu/svn/botlab.dosi/Docs/CarrierQuoteAdvancedPre.pdf)) about $1500 for 3-5 pcs, 1-2 weeks plus $400 for test

### 2018-10-08 Edits

 * Created SVN tag 'RevA' from trunk, editing in trunk.

 * Updated: [carrier.pdf](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/carrier.pdf)
 * Updated: [CARRIER.DSN](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/CARRIER/DES/CARRIER.DSN)

ECO list below including Dan's from 8/13/18

Editing in ...hardware/CARRIER/DSN

 * Slots 2, 3, 4 for DDS need LA02 and LA04 wired while on carrier LA02 and LA03 are wired (done)
 * Add level shifters on SPI for the Si5340 from 2.5V to 1.8V (done, added U101 and U102)
   * Note default Si5340 is 1.8V (can set to 3.3V using SW bit).  PicoZed bank 13 is 2.5V.
 * Level shifters on FTDI serial are reversed! (done, ugh)

### 2018-08-13 Requests

 * On sheet 10 of Carrier schematic (all below done 10/8/18)
   * Connect CKIN_P0 to BANK13_LVDS_1_P
   * Connect CKIN_N0 to BANK13_LVDS_1_N
   * Connect CLK_P2  to BANK13_LVDS_0_P
   * Connect CLK_N2  to BANK13_LVDS_0_N
   * Connect CKIN_P1 to JX2_LVDS_12_P
   * Connect CKIN_N1 to JX2_LVDS_12_P
   * Connect CLK_P3  to BANK13_LVDS_8_P
   * Connect CLK_N3  to BANK13_LVDS_8_N

 * Please add "FPGA DONE LED" circuit from PicoZed FMC carrier board Page "07 - Switches, LEDs" [pdf](http://zedboard.org/sites/default/files/documentations/PZCC_FMC_V2_Rev1_Schematic_160315.PDF)


### 2/10/18 To-Do

 * Route two additional pairs on carrier to slot 5
 * Change GPIO connections to match carrier and add extra pairs
 * Eliminate slot 6 on carrier?
 * Carrier FMC pinout summary:  http://gauss.bu.edu/svn/g2-quad-pulser.hardware/Docs/Generic_Mobo_Pins.ods
 * Connect VAdj on carrier and check IO voltages carefully
   * Banks 13, 34, 35 all 2.5V (VAdj)
   * Bank 500 is 3.3V
   * Bank 501 is 1.8V (uSD and UART)

### ADC board Layout check

 * Fab Drawing (stack-up):
   * change L1-L2 and L3-L4 dielectric to 5 mils
   * change L2-L3 to omit dielectric thickness spec so "DIELECTRIC - FR-4"

### DDS board layout check

 * Fab Drawing (stack-up):
   * change L1-L2 and L5-L6 dielectric to 5 mils

## Meetings

### 7/11/17

In meeting on 7/11/17 we discussed the development of a new version of the dDOSI electronics.
The main differences from the existing hardware would be:

 * Compact rack-mountable design (target 1U enclosure height)
 * Variable gain and/or increased bit depth on ADC
 * Errors in prototype taken care of for easier manufacture
 * Update from MicroZED to PicoZED system-on-board

### 8/2/17

 * [dosi_2017_08_02.pdf](http://gauss.bu.edu/svn/roblyer-ddosi-rack-mount/Meetings/2017-08-02/dosi_2017-08-02.pdf) -- Slides by Eric

Candidate ADC is now ADS42LB69 dual-channel 16-bit 250MSPS converter

The PGA870 looks like a good candidate programmable-gain amplifier.

### 2/7/18

Meeting with Steven Larochelle, (Rachita Chaudhury), Thomas Floros,
Darren and Raeef.

Decided:

 * Power supply connector is 6-pin 2x3 mini-fit Jr (DigiKey WM11874-ND)
 * SMA connectors will all be vertical on the PCBs
 * Change GPIO design to include:
   * 4 SMA inputs
   * 4 SMA outputs
   * Header with 8 out + 4 in.
   * Change layout for vertical SMA connectors


