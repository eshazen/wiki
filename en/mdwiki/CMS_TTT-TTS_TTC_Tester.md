# CMS_TTT-TTS_TTC_Tester
## Rev. B

See [#hardware Hardware] section for PCB layouts.

### Firmware

Firmware specification of the Phase 1 and Phase 2 firmwares can be found on the [TTC_TTS_FirmwareSpecification](TTC_TTS_FirmwareSpecification.md)

#### 2013-11-21 (INTERIM 0x04 Broadcast Firmware)

===== Changelog =====

 * Sends 0x04 at 3400 with an orbit count prescale of 10. Currently can't be deactivated.
 * Can still send custom commands as before way. Sends them at bx 1024 once.
 * Compatible with the same release of pychips and addresstable as before.

===== Download =====

 * Source : [2013-11-21_TTT_firmware_ISE13_3_interim.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-11-21_TTT_firmware_ISE13_3_interim.tar.gz)
 * Flash : [ttt_2013-11-21_interim.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_2013-11-21_interim.mcs)
 * Bit : [ttt_2013-11-21_interim.bit](http://ohm.bu.edu/~cwoodall/TTT/firmware/bit_files/ttt_2013-11-21_interim.bit)
 * Address Table: [2013-06-07_ttt_addrTable.txt](http://ohm.bu.edu/~cwoodall/TTT/firmware/addressTables/2013-06-07_ttt_addrTable.txt)
 * ttt_pychips :
   * [ttt_pychips-2013-10-21.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-10-21.tar.gz)
   * [ttt_pychips_2013-10-02.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-10-02_1-1-gdf8dfe8.tar.gz)
   * [ttt_pychips-2013-06-14.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-06-14-4-gdf8dfe8.tar.gz)

#### 2013-06-14 (STABLE)

=====  Upgrade Directions  =====

If upgrading from versions before 2013-06-07 then using TTTtool.py should work fine. If you are upgrading from version 2013-06-07 you will need to use a jtag programmer to program the SPI flash, or the bit file for 2013-06-14 and then use TTTtool.py to write the .mcs file to the flash.

The address table does not need to be upgraded from 2013-06-07 for TTTtool.py to work.

=====  Changelog  =====

 * Fixed major bug from 2013-06-07 where during programming you would hang on write to ''FLASH_WBUF' and crash, preventing programming.

======  SOFTWARE  ======

 * In 2013-16-14:
   * Fix where during RS and WS the program would get into a fatal error.
   * Fixed sorting of .mcs files.
   * Added flash (.mcs) file for firmware version 2013-06-14

 * In 2013-10-02:
   * Changed the way the BC command is executed. It no longer relies on the action register resetting to 0 correctly by manually writing 0s. This improves compatibility with older firmware versions and reduces the risk of confusion.

 * In 2013-10-21
   * Fixed the following error reported by Eric Hazen: The TTTtool won''t run because of a syntax error.  We edited line 139, change from "with open(script_file): pass" to "open(script_file)"


=====  Download  =====

 * Source : [2013-06-14_TTT_firmware_ISE13_3.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-06-14_TTT_firmware_ISE13_3.tar.gz)
 * Flash : [ttt_2013-06-14.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_2013-06-14.mcs)
 * Bit : [ttt_2013-06-14.bit](http://ohm.bu.edu/~cwoodall/TTT/firmware/bit_files/ttt_2013-06-14.bit)
 * Address Table: [2013-06-07_ttt_addrTable.txt](http://ohm.bu.edu/~cwoodall/TTT/firmware/addressTables/2013-06-07_ttt_addrTable.txt)
 * ttt_pychips :
   * [ttt_pychips-2013-10-21.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-10-21.tar.gz)
   * [ttt_pychips_2013-10-02.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-10-02_1-1-gdf8dfe8.tar.gz)
   * [ttt_pychips-2013-06-14.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-06-14-4-gdf8dfe8.tar.gz)

=====  Documentation  =====

 * Hardware/Firmware Documentation : [TTT User Manual](http://ohm.bu.edu/~cwoodall/TTT/TTT_documentation/archive/2013-06-07_TTT_User_Manual.pdf)
 * Software Documentation and Packages : [TTT Software Documentation and Packages](http://bucms.bu.edu/twiki/bin/view/BUCMSPublic/TTC_TTS_Tester)


#### 2013-06-07 (DO NOT USE)

=====  Bug Log  =====

 * For some reason all ethernet functions work, except flash writes. Flash reads work.

> Enter flash action, ''h' for menu: p
> 1) ttt_2013-06-03.mcs
> 2) ttt_2013-04-04.mcs
> 3) ttt_2013-06-07.mcs
> 4) ttt_2013-03-07.mcs
> 5) ttt_2013-05-24.mcs
>
> Select desired MCS file (enter integer)
> Type ''1-5' to select or '0' for menu: 3
> /home/cwoodall/Documents/Projects/ttt_pychips/firmware/ttt_2013-06-07.mcs
>
> WARNING!! You are about to program the flash. Would you like to continue?
> ''y' for yes, any other key to abort: y
> Reading MCS file.  May take many seconds...
>
> firmware file /home/cwoodall/Documents/Projects/ttt_pychips/firmware/ttt_2013-06-07.mcs has 0x5327c data bytes  ( 1331  pages)
> Erasing flash sector at address 0x00000
> Erasing flash sector at address 0x10000
> Erasing flash sector at address 0x20000
> Erasing flash sector at address 0x30000
> Erasing flash sector at address 0x40000
> Erasing flash sector at address 0x50000
>
> programming flash at address 0x53200
> FatalError(): Trouble writing to ''FLASH_WBUF'
> Quitting...

Replicated on 3 boards...
=====  Changelog  =====

 * The TTTActionReg_SendBcastCmd (bit 1) in TTTActionReg (address: 0x3) has now automatically turns to zero after the broadcast command in TTTBcastCmd (address: 0x4) is sent. In the past you needed to write a `1'' and then a `0' to TTTActionReg bit 1 every time you wanted to send a command.
 * Added error counters reset (bit 29) to TTTActionReg (address: 0x3). This auto zeros after reset is performed.
 * Added Error Counters, see address table and documentation.
 * Added a reset bit (bit 31) to TTTControlReg (address: 0x2)
 * Further tests ran on the LHCClock input
 * LVDS Modes added. See documentation for more information.

======  SOFTWARE  ======

 * Now handles named registers read in from address table correctly when using "RS"
 * added "BC" which sends a broadcast command
 * added "ST" which gets the error counter values and reports them

=====  Download  =====

 * Source (DO NOT USE): [2013-06-07_TTT_firmware_ISE13_3.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-06-07_TTT_firmware_ISE13_3.tar.gz)
 * Flash (DO NOT USE): [ttt_2013-06-07.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_2013-06-07.mcs)
 * Bit (DO NOT USE): [ttt_2013-06-07.bit](http://ohm.bu.edu/~cwoodall/TTT/firmware/bit_files/ttt_2013-06-07.bit)
 * Address Table (DO NOT USE): [2013-06-07_ttt_addrTable.txt](http://ohm.bu.edu/~cwoodall/TTT/firmware/addressTables/2013-06-07_ttt_addrTable.txt)
 * ttt_pychips (DO NOT USE): [ttt_pychips_2013-06-07.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/software/archive/ttt_pychips_2013-06-07.tar.gz)


=====  Documentation  =====

 * Hardware/Firmware Documentation : [TTT User Manual](http://ohm.bu.edu/~cwoodall/TTT/TTT_documentation/archive/2013-06-07_TTT_User_Manual.pdf)
 * Software Documentation and Packages : [TTT Software Documentation and Packages](http://bucms.bu.edu/twiki/bin/view/BUCMSPublic/TTC_TTS_Tester)

#### 2013-06-03

=====  Changelog  =====

 * Added Ability to send arbitrary Broadcast Commands by writing to the lower 8 bits of the register TTTBcastReg (Address: 0x4)
   * To send you must write a ''1' to TTTActionReg (0x3) bit 1. It is recommended to immediately write a '0'.

 * Added the ability to switch between the onboard clock and the LHCClock input using TTTControlReg (Address: 0x2) bit 1. Write a ''1' to select the LHCClock and write a '0' to select the onboard crystal. The Ethernet interface should work in all cases.

 * Now ships with address table.

=====  Download  =====
 * Source : [2013-06-03_TTT_firmware_ISE13_3.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-06-03_TTT_firmware_ISE13_3.tar.gz)
 * Flash : [ttt_2013-06-03.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_2013-06-03.mcs)
 * Bit : [ttt_2013-06-03.bit](http://ohm.bu.edu/~cwoodall/TTT/firmware/bit_files/ttt_2013-06-03.bit)
 * Address Table: [2013-06-03_ttt_addrTable.txt](http://ohm.bu.edu/~cwoodall/TTT/firmware/addressTables/2013-06-03_ttt_addrTable.txt)

=====  Documentation  =====

 * Hardware/Firmware Documentation : [TTT User Manual](http://ohm.bu.edu/~cwoodall/TTT/TTT_documentation/archive/2013-06-03_TTT_User_Manual.pdf)
 * Software Documentation and Packages : [TTT Software Documentation and Packages](http://bucms.bu.edu/twiki/bin/view/BUCMSPublic/TTC_TTS_Tester)
#### 2013-05-24

=====  Changelog  =====
 * Added 2 SFP channels.

 * Some optimizations to the clock network.

 * Added TTTControlReg (Address: 0x2). Minimal functionality as of now, some functions have been specified but are not documented, or implemented yet.
   * If you write a ''1' to the 4th bit (0x10) you will L1A's and BC0s received over the Channel A and Channel B fibers will be pushed out onto the NIM outputs as follows:

     * Channel A: L1A - L1A , BC0 - BC0
     * Channel B: L1A - NIM1, BC0 - NIM0

   * if you write ''0' to the 4th bit NIM0 and NIM1 will be inactive and BC0 and L1A will output the internally generated L1A's and BC0s.

=====  Sources  =====
 * Source : [2013-05-24_TTT_firmware_ISE13_3.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-05-24_TTT_firmware_ISE13_3.tar.gz)
 * Flash : [ttt_2013-05-24.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_2013-05-24.mcs)


#### 2013-04-16


Clock network modifications.

 * Source : [2013-04-16_TTT_firmware_ISE13_3.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-04-16_TTT_firmware_ISE13_3.tar.gz)
 * Flash : [ttt_2013-04-16.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_2013-04-16.mcs)

#### 2013-04-04

Fixed problems with the Ethernet MACs CRC evaluation.

 * Source : [2013-04-04_TTT_firmware_ISE13_3.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-04-04_TTT_firmware_ISE13_3.tar.gz)
 * Flash : [ttt_2013-04-04.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_2013-04-04.mcs)

#### 2013-03-28

 * Source : [2013-03-28_Phase2_ISE13_3.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-03-28_Phase2_ISE13_3.tar.gz)
 * Flash File (.mcs) : [ttt_2013-03-28.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_2013-03-28.mcs)

### Verification Firmware

#### 2013-05-13

First version of the testing firmware. Can be flashed using the Ethernet MAC, but cannot be restored via the same method (must use a Xilinx JTAG programming cable to go back to the original firmware).

The setup is as follows:
 * Nim Output to Nim Input connections (as labeled): L1A -> NIM_IN0; BC0 -> NIM_IN1; NIM0 -> NIM_IN2; NIM1 -> NIM_IN3
 * RJ-45 Channel A Rx to Channel A Tx; Same for channel B (loopback)
 * SFP hooked up in a loop-back configuration Channel A Rx to Channel A Tx and same for channel B.

On start-up the firmware expects to see the GPIO/Settings (also serial number selection jumpers) to be set to 0 (all grounded). This will initialize test mode. Each test is carried out as a counter which is then displayed on the LEDs.


| Setting   | Function | Verification Method |
| -------   | -------- | ------------ ------ |
| 0000      | Tests NIM I/O | Verify that the bottom four (closest to red) LEDs count up/ |
| 0001      | Tests RJ-45 Inputs | All LEDs should be counting up. Channel A is on the upper 4 bits and Channel B on the lower 4 bits. |
| 0010      | Tests Channel A of the SFP connection | All LEDs should be counting up. |
| 0100      | Tests Channel B of the SFP connection | All LEDs should be counting up. |
| Any Other | ERROR | Blinks All Green LEDS on and off in unison. |

 * Source : [2013-05-13_TTT_VERIFY_firmware_ISE13_3.tar.gz](http://ohm.bu.edu/~cwoodall/TTT/firmware/archive/2013-05-13_TTT_VERIFY_firmware_ISE13_3.tar.gz)
 * Bit File (.bit) : [2013-05-13_ttt_verify.bit](http://ohm.bu.edu/~cwoodall/TTT/firmware/bit_files/2013-05-13_ttt_verify.bit)
 * Flash File (.mcs) : [ttt_verify_2013-05-13.mcs](http://ohm.bu.edu/~cwoodall/TTT/firmware/flash/ttt_verify_2013-05-13.mcs)


### Serial Number Table


| *'Serial Number* | *Mac Address* | *IP Address* | *Location* | *Hardware Revision* | *Firmware Version (Shipped)* | *Firmware Version (Current)* | *Notes* |
| -------- ------- | ---- -------- | --- -------- | ---------- | --------- --------- | --------- ------- ---------- | --------- ------- ---------- | ------- |
| 000 | 08-00-30-F3-00-00 | 192.167.2.32 | FACTORY TEST MODE | N/A | N/A | N/A | Only use for Factory Test. |
| 001 | 08-00-30-F3-00-01 | 192.168.2.33 | BU EDF (Boston, MA)     | Rev. B | Dev        | 2013-06-14 | Used for testing and firmware dev. by Chris Woodall |
| 002 | 08-00-30-F3-00-02 | 192.168.2.34 | BU EDF (Boston, MA) | Rev. B | 2013-03-27 | 2013-06-14 | none |                                                 
| 003 | 08-00-30-F3-00-03 | 192.168.2.35 | CERN/904                     | Rev. B | 2013-03-27 | 2013-06-03 | Passed Factory Test. |
| 004 | 08-00-30-F3-00-04 | 192.168.2.36 | CERN/904                     | Rev. B | 2013-03-27 | 2013-06-03 | Passed Factory Test. |
| 005 | 08-00-30-F3-00-05 | 192.168.2.36 | BU EDF (Boston, MA)     | Rev. B | - | - | DEFECTIVE. Ethernet Link Does not open up. Hardware based issue. |
| 006 | 08-00-30-F3-00-06 | 192.168.2.38 | DESY     | Rev. B | 2013-04-16 | ? | Passed Factory Test. |
| 007 | 08-00-30-F3-00-07 | 192.168.2.39 | FermiLab      | Rev. B | 2013-04-16 | 2013-06-07 | Passed Factory Test. |
| 008 | 08-00-30-F3-00-08 | 192.168.2.40 | Cornell (Ithaca, NY)    | Rev. B | 2013-06-14 | 2013-06-14 | Passed Factory Test. |
| 009 | 08-00-30-F3-00-09 | 192.168.2.41 | BU EDF (Boston, MA)     | Rev. B | - | - | DEFECTIVE. NIM, LVDS, jumpers and buttons passed test. Ethernet having problems and Channel A SFP. Problems seem to be of a firmware-based nature. Not sure how to fix. |
| 010 | 08-00-30-F3-00-0a | 192.168.2.42 | University of Florida (Gainesville, FL)     | Rev. B | 2013-06-14 | 2013-06-14 | Passed Factory Test. |


### Software

[Documentation found here](http://bucms.bu.edu/twiki/bin/view/BUCMSPublic/TTC_TTS_Tester)

#### ttt_pychips releases

 * [ttt_pychips-2013-10-21.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-10-21.tar.gz)
 * [ ttt_pychips-2013-16-14.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-16-14.tar.gz)
 * [ttt_pychips-2013-06-11.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-06-11.tar.gz)
 * [http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-06-11.1.tar.gz ttt_pychips-2013-06-11.1.tar.gz
 * [ttt_pychips-2013-06-07.tar.gz](http://ohm.bu.edu/~cwoodall/archive/ttt_pychips/ttt_pychips-2013-06-07.tar.gz)
 * [ttt_pychips_2013-05-31.tar.gz](http://ohm.bu.edu/~chill90/ttt/python/ttt_pychips_2013-05-31.tar.gz)
 * [ttt_pychips_2013-04-05.tar.gz](http://ohm.bu.edu/~chill90/ttt/python/ttt_pychips_2013-04-05.tar.gz)
 * [ttt_pychips_2013-04-03.tar.gz](http://ohm.bu.edu/~chill90/ttt/python/ttt_pychips_2013-04-03.tar.gz)
 * [ttt_pychips_2013-03-29.tar.gz](http://ohm.bu.edu/~chill90/ttt/python/ttt_pychips_2013-03-29.tar.gz)

### [=#hardware Hardware]

All schematic and PCB layouts were done in [ExpressPCB](http://www.expresspcb.com/)

 * Full Schematic Source (Include BOM in CSV, PDF, XLSX, ExpressPCB files and PDFs)
   * [zip](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/CMS_TTCTTS_Adapter_RevB.zip) &bull; [tar.bz2](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/CMS_TTCTTS_Adapter_RevB.tar.bz2) &bull; [Directory](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/)

 * PCB
   * [ExpressPCB](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget.pcb) &bull; [PDF](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget_pcb.pdf)
   * [TTT_RevB_Layout.pdf](http://ohm.bu.edu/~hazen/CMS/TTT_RevB_Layout.pdf) -- Colorized layout

 * PCB Fake Bottom Silkscreen (WARNING: not actually a bottom silk)
   * [ExpressPCB](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget_bot.pcb) &bull; [PDF](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget_pcb_bot.pdf)

 * Schematic
   * [ExpressSCH](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget.sch) &bull; [PDF](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget_sch.pdf)

 * BOM
   * [CSV](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_TTC_TTS_Gadget_BOM.csv) &bull; [PDF](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_TTC_TTS_Gadget_BOM.pdf) &bull; [XLSX](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_TTC_TTS_Gadget_BOM.xlsx)

#### Changelog


 * Fixed LED footprints
 * Added convenient .1" spaced headers for use with Phase 1 firmware.
 * Fixed TTS connections (both input and output) to match a traditional Ethernet Patch cable
 * Fixed the situation for the Oscillator, now that the datasheet has been understood and we know which pin needs to be enabled. Alternatively put OE on a FPGA pin (current solution is two sites for 603 resistors or solder shorts)
 * Added more labels (these labels are still valid in "old" designs)
 * Add soft reset button to implement TTC Phase 1 reset features (Low Active)
 * Added trigger button (Low active)
 * NIM Outputs added.
 * NIM Inputs added
 * Fixed the situation for the Oscillator, now that the datasheet has been understood and we know which pin needs to be enabled. Alternatively put OE on a FPGA pin (current solution is two sites for 603 resistors or solder shorts)
 * Added more label
 * Moved U2 from the M25P32''s SOIC16 package to its SO-8W package version
 * Added bypass capacitors to comparators U14, U15, U16 and U17
 * Enlarged two holes on the SFP package to allow for easy fitting of the surface mount part.


#### Shipment Preparation

 * Install LEMO connectors in the following sites: J2, J4, J5, J20, J21, J22, and J23 (J18 and J19 are extra outputs).
 * Install jumper in J6.
 * Install jumpers for all GPIO jumpers (P29, P30, P32, P35).
 * Add 0 Ohm 603 resistor (or jumper) at site R16.
 * Remove 603 0 Ohm resistor at site R83 (bottom).

