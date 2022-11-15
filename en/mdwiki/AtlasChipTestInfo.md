# AtlasChipTestInfo
# ATLAS Chip and Mezz Card testing

This page is created in 2018 to provide a summary of available documentation on various ASD chip and mezzanine card test hardware.

## Chip Tester (ca 2001)

This was a joint effort between Harvard and BU.  There are two PC board designs.

The main board (documentation below) contained all the mixed-signal circuitry to provide bias to the chip, input stimulus and readout the results.  It includes an FPGA which implemented much of the control functionality and a simple TDC to digitize the ASD output.  It communicated through a large cable with a National Instruments parallel interface board in a PC.  Unfortunately most of the firmware and software source code has been lost in time.

The second board with a clamshell socket was a passive board which provided connections to the main board.
Unfortunately all documentation for this board has been lost, although we have two of them with clamshell sockets at BU.
Here are [two](http://ohm.bu.edu/~hazen/ATLAS/ChipTester/ChipTesterHardware/Photos/2012-02-14_16-22-19_51.jpeg) [photos](http://ohm.bu.edu/~hazen/ATLAS/ChipTester/ChipTesterHardware/Photos/2012-02-14_16-22-36_430.jpeg) of this board.

 * Main Board
   * [chip-tester-schematic.pdf](http://ohm.bu.edu/~hazen/ATLAS/ChipTester/ChipTesterHardware/chip-tester-schematic.pdf) -- Schematic PDF for the main board.
   * [Photo](http://ohm.bu.edu/~hazen/ATLAS/ChipTester/tester_overview_photo.jpg)
   * [TESTER-DES.ZIP](http://ohm.bu.edu/~hazen/ATLAS/ChipTester/ChipTesterHardware/TESTER-FAB/TESTER-DES.ZIP) -- OrCAD design files
   * [TESTER-FAB.ZIP](http://ohm.bu.edu/~hazen/ATLAS/ChipTester/ChipTesterHardware/TESTER-FAB/TESTER-FAB.ZIP) -- Gerber PCB files
 * AtlasChipTesting -- page with information on testing procedures from ~ 2012

## Mezzanine Board Tester (ca 2014)

This is a new development at BU.  It consists of a single board with FPGA and all required mixed-signal circuitry to test a mezzanine board of any of the four standard 3 or 4-layer types.

Full documentation is here:  AtlasMezzTesting (if a bit disorganized)

Some missing files can be found here:  http://ohm.bu.edu/~dean/archive/mezz_t_misc/

It was anticipated to make a special mezzanine board version with a clamshell socket to implement a new chip tester.  This would still be possible but has not been done at BU.

### Resources

(duplicated from AtlasMezzTesting page for convenience)

 * Barcode software: http://ohm.bu.edu/~hazen/ATLAS/ChipTest2012/MDTASDChip_BarCodes_2012-03-28.tar.gz
 * [ATLAS Muon Drift Tube Electronics](http://bmc.bu.edu/ESH_NEW/jinst8_09_p09001.pdf) comprehensive paper on the whole system
 * [Presentation](http://bmc.bu.edu/bmc/papers/A3.1-Hazen.pdf) on MDT electronics testing from 2003 by Hazen
 * [MDT-ASD Chip Manual](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/gen_info/MDTASD_V2.1.pdf)
 * [ASD Chip parameter setup manual](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/octal_mezz_info/MDTparams_Ver1_05.pdf)
 * [Bar Code Label](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/gen_info/ChipCardLabels.pdf) description with explanation of card types
 * [File Archive](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/prod_info/) with data for various mezz card types including dimension drawings
 * [MDT-ASD Chip Tester Manual](http://bmc.bu.edu/ESH_NEW/UsersManual.pdf)
 * [AMT-3 TDC Chip Manual](http://atlas.kek.jp/tdc/amt3/AMT3manual_034.pdf)

