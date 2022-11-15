# AtlasMezzTesting
This page has some ideas for a modern mezzanine board tester to support
production of spares and long-term maintenance of the ATLAS MDT on-chamber electronics.


## Resources

 * [Preliminary Specification](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/ATLASMDTMezzanineCardTester-2014-04-07.pdf) document (Hazen) - updated 2/7/14
 * [ATLAS Muon Drift Tube Electronics](http://bmc.bu.edu/ESH_NEW/jinst8_09_p09001.pdf) comprehensive paper on the whole system
 * [Presentation](http://bmc.bu.edu/bmc/papers/A3.1-Hazen.pdf) on MDT electronics testing from 2003 by Hazen
 * [MDT-ASD Chip Manual](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/gen_info/MDTASD_V2.1.pdf)
 * [ASD Chip parameter setup manual](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/octal_mezz_info/MDTparams_Ver1_05.pdf)
 * [Bar Code Label](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/gen_info/ChipCardLabels.pdf) description with explanation of card types
 * [File Archive](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/prod_info/) with data for various mezz card types including dimension drawings
 * [MDT-ASD Chip Tester Manual](http://bmc.bu.edu/ESH_NEW/UsersManual.pdf)
 * [AMT-3 TDC Chip Manual](http://atlas.kek.jp/tdc/amt3/AMT3manual_034.pdf)

 * SVN repo (doco): http://gauss.bu.edu/svn/atlas-mezz-tester/
 * SVN repo (firmware): http://gauss.bu.edu/redmine/projects/atlas-mezz-tester/repository/atlas-mezz-hw

 * Barcode software: http://ohm.bu.edu/~hazen/ATLAS/ChipTest2012/MDTASDChip_BarCodes_2012-03-28.tar.gz


# Instructions for Use

## Set up and install software
1. Install gcc
1. Install Python 2.7
  a. Install numpy, scipy, and matplotlib
   (can install individually, or with [Anaconda 2.7](https://www.continuum.io/downloads) (recommended))
3. run "svn co [http://gauss.bu.edu/svn/atlas-mezz-tester.hw/tags/v001/Software/]"
4. Go to Software/cli and run make to build the software
5. Make sure the user has access to USB devices

## User instructions
Full user manual located at: [http://gauss.bu.edu/svn/atlas-mezz-tester/Documentation/User_Manual/mezzCardTesterUserManual.pdf]

1. Insert an MDT card in the tester
 a. Ensure the tester is switched off.
 b. Remove previous card if it is present by carefully pulling up around the headers.
 c. Line up the headers and firmly press down on card.
 d. Take care not to flex the card or the Mezz Tester PCB while removing or installing.
 e. Turn on tester.
 f. (if needed, cd ../tester)
2. Run the "!MezzTester.py" script.
 a. The default device is '/dev/ttyUSB0'. An alternate may be specified with the -D flag. ex. './MezzTester.py -D /dev/ttyUSB1'
3. Enter name and location to be logged in the database.
4. Let the scan run. It will output progress so you know it is running.
5. When it is done, it will tell if and what tests failed.
6. At the comment prompt, enter any comments you would like stored with the test, or just press enter for none.
7. Generate plots of the data if desired. (You can enter to skip).
8. Repeat steps 4-8 as needed.
9. type "q" to quit at any of the ID prompts.

# Project History

## Prototype I

The first prototype of the hardware will be based on a Xilinx evaluation board
with an adapter card designed by me (Hazen).   Documentation:

 * Adapter Schematic [PDF Page 1](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/Adapter_page1.pdf) [PDF Page 2](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/Adapter_page2.pdf) [SCH](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/Mezz_Adapter.sch)
 * Adapter PCB Layout [PDF](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/Adapter_pcb.pdf) [PCB](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/Mezz_Adapter.pcb)
 * Assembly drawing [PDF](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/Adapter_assembly.pdf)
 * Nexys 3 Board [Product Link](http://digilentinc.com/Products/Detail.cfm?NavPath=2,400,897&Prod=NEXYS3) [Manual](http://digilentinc.com/Data/Products/NEXYS3/Nexys3_rm.pdf)
 * Adapter Parts list [XLS](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/Adapter_BOM.xls)
   * [XLS](http://ohm/~lasiukza/ATLAS/Adapter_BOM_esh.xls) (almost done)
   * [DigiKeyOrder.csv](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/DigiKeyOrder.csv) -- ready-to-submit order
 * Pulse Injector
   * Schematic [PDF](http://ohm.bu.edu/~lasiukza/ATLAS/Mezz%20Tester/April%2011th/PDF%20Schematic/)
   * Kicad files [Mezz_Tester_Injector.tar.gz](http://ohm.bu.edu/~dean/Mezz_Tester_Injector.tar.gz)

## Revision A

The first revision of the hardware moved the FPGA, pulse injector, and card header on a single board designed by Dean De Carli.  This board was manufactured in July 2014 and is the "final" version.

 * SVN (Everything can be found in the SVN) [http://edf.bu.edu/svn/edf/ATLAS_mezz_tester/]
 * Schematic [PDF](http://ohm.bu.edu/~dean/Altium/mezz%20tester/mezz%20tester%20rev%20A.pdf)
 * BOM [xls](http://ohm.bu.edu/~dean/Altium/mezz%20tester/mezz%20tester%20rev%20A%20BOM%20for%20assembly%20new.xls)
 * Altium [zip](http://ohm.bu.edu/~dean/Altium/mezz%20tester.zip)
 * Assembly information [zip](http://ohm.bu.edu/~dean/Altium/mezz%20tester/mezz_tester_A_assembly.zip) (BROKEN LINK)
   * The gerbers sent out on 9-11-2014 were lacking the drill files for slotted holes, and a replacement SMT micro USB connector had to be ECO'd. These assembly files have the correct drill files.
   * [http://ohm.bu.edu/~dean/archive/mezz_t_misc/mezz_tester_A_assembly/ Assembly documentation

## Revision B To Do

The first revision of the hardware moved the FPGA, pulse injector, and card header on a single board designed by Dean De Carli.

 * Add the 390 ohm termination resistors.
 * External pulse injector
   * Use a new DAC that properly functions in the given voltage range
     * The original DAC was the LTC2635m, which was used on the prototype. There was a snafu with the assembly house in which they said they couldn't solder the part with leaded \\
    solder because it had a pad underneath the chip that was tinned with unleaded solder. The part was swapped out for the AD5625. This limitation ended up being an artificial one, \\
    and the boars were assembled with leaded solder anyway, but by the time they agreed to use leaded solder, the board and the gerbers were already altered.
   * Also adjust pulse injection resistor divider for a greater pulse height
   * Alternatively, one could look into connecting the existing DAC to 5V (not recommended)
   * This will require re-tuning of the DAC sweep tests. The Python verification routine and test parameters will need adjusted, and I suspect some of bounds programmed into the MezzTool will adjusted as well.

## Software from original tester

Due to the DAQ rate limitations of the TDC and difficulty locating the sources of the original tester, we
have experienced difficulties recreating the original results of the ASD tester. Besides the obvious plateau
in center of the data from the TDC pegging out, the data appears to be acceptable. Fortunately, we were able
to locate a cd with the source of the original tester at the EDF. The image can be [downloaded from here:](http://edf.bu.edu/svn/edf/ATLAS_mezz_tester/Archive/Tester-Software-3-3-04.iso).

Observations:
 * For the noise test, the ASD hysteresis register setting is set to 0 in the original tester, while the new tester has been setting it to 4.
 * I have been doing a non-linear least squares fit of the Gaussian equation listed in the ASD manual. The original tester takes the log of the y-values and does a least-squares quadratic fit on the data,
and then from A*x^2 + B*x + C, uses A, B, C as Voff, Sigma,and Rate, respectively.

## Changes made to hardware/software on September 14, 2015

 * Added 390 termination resistors on all the channels
 * Adding the termination resistors forced a change in the dac sweep fit parameters:
   * Increased slope range to 15 to 19.5.
   * Decreased ASD threshold step size
 * Corrected the offset spread test to compare the channels on each individual chip, not the entire card.
 * Set ASD hysteresis to 0 for threshold sweep test.

## Design Ideas

 * [Simple FPGA Ethernet Interface](Simple_FPGA_Ethernet_Interface.md) ideas

## Meetings
 * [2014-02-21 Mezz Tester Meeting](2014-02-21_Mezz_Tester_Meeting.md)
 * [2014-02-07 Mezz Tester Meeting](2014-02-07_Mezz_Tester_Meeting.md)
 * [2014-01-23 Mezz Tester Meeting](2014-01-23_Mezz_Tester_Meeting.md)

Mezz card connector signals from [the schematic](http://bmc.bu.edu/ESH_NEW/ATLAS/Files/prod_info/mdt316-schematic.pdf)


| *'Pin(s)* | *Name* | *Comments* |
| --------- | ------ | ---------- |
| 1,3,5,7 | AVdd_In | Power supply ~5V |
| 2,4,6,8 | AGND | Analog GND |
| 9,10 | Test in | LVDS test pulse |
| 11,12 | Temp_Sense | TMP32 temp sensor output (voltage) |
| 13,14 | AVdd_Sense | AVdd output for sensing |
| 15,16 | DVdd_Sense | DVdd output for sensing |
| 17,19,21,38,40 | DVdd_IN | Power supply 2 ~5V |
| 18,20,22,24,34,36 | DGND | Digital GND |
| 23 | nRESET | AMT Reset |
| 25,26 | SERDAT | LVDS output data 40/80 MB/s |
| 27,28 | CLK | LVDS clock in 40/80 MHz |
| 29,30 | ENC | Encoded control in 40/80 MB/s |
| 31,32 | STROBE | LVDS output strobe |
| 33,35,37,39 | JTAG | AMT JTAG signals (TCK,TDI,TMS,TDO) |

All required hardware interface functions could be provided by a rather
simple PCB with a modern FPGA and a few DAC and ADC channels.
