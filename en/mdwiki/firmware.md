# firmware
[#ProgrammingFirmware Programming Firmware]

## Firmware versions

### Logic board
 * 2017-06-06 [v11.06.06.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-11-06-06-01.mcs)

```
     Added new C5 command that increments the spill number, but causes no spill.  This is C5 word 0x3.
```

 * 2016-06-06 [v10.06.06.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-10-06-06-01.mcs)

```
     Added new command("tdc_prog") to Logicboard to allow reprogramming of the TDC uC via the bootloader with no power-cycle.
```


 * 2016-06-01 [v10.06.01.02](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-10-06-01-02.mcs)

```
     Fixed bug in external clock reset register.
     Added hacked command to Logicboard to allow reprogramming of the TDC uC via the bootloader. (requires power cycle after)
```

 * 2016-05-30 [v10.05.1E.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-10-05-1e-01.mcs)

```
     Fixed bug in clock source switch which did not affect normal operation.
     Lengthened the recovery period in the onewire temperature sensors to fix issue with bus with four flexis.
```

 * 2016-04-15 [v10.04.0E.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-10-04-0E-01.mcs)

```
     First public release of firmware for a New Logic-board.  This has the commands to talk to a new IntegratedTDC.
```


### Integrated TDC board
 * [v20171102](http://ohm.bu.edu/~dgastler/g-2/firmware/IntTDC-2017-11-02.hexout)
```
  Changed how the spill increment C5 command works.
```

 * [v20170609](http://ohm.bu.edu/~dgastler/g-2/firmware/IntTDC-2017-06-09.hexout)
```
   Added new C5 command that increments spill number, but doesn't start a spill.  This is C5 value 0x3.
```

 * [v20170607](http://ohm.bu.edu/~dgastler/g-2/firmware/IntTDC-2017-06-07.hexout)
```
   Added new C5 command that increments spill number, but doesn't start a spill.  This is C5 value 0x3.
```

 * [v20170424](http://ohm.bu.edu/~dgastler/g-2/firmware/IntTDC-2017-04-24.hexout)
```
   First release of new timing binned firmware.  Untested channel masking.
```

 * [v20170308](http://ohm.bu.edu/~dgastler/g-2/firmware/IntTDC-2017-03-08.hexout)
```
   Changed timing bins
```
 * [v20170302](http://ohm.bu.edu/~dgastler/g-2/firmware/IntTDC-2017-03-02.hexout)
```
   Auto time stamping added to registers 0x9-0xc.  First crack at timing bins.
```
 * [v20160606](http://ohm.bu.edu/~dgastler/g-2/firmware/IntTDC-2016-06-06.hexout)
```
   New version that correctly sets the event number register to the number of events generated.
```
 * [v20160405](http://ohm.bu.edu/~dgastler/g-2/firmware/IntTDC-2016-04-05.hexout)
```
   First public firmware for the new Integrated TDC board.
```

### Integrated TDC uC
 * [v1.30](http://ohm.bu.edu/~collinsz/g-2/firmware_int_tdc_uC/inttdc_uC_v1-3.hex)
```
   Implemented a fix for all the strange led problems.
```

 * [v1.20](http://ohm.bu.edu/~collinsz/g-2/firmware_int_tdc_uC/inttdc_uC_v1-2.hex)
```
   Added a version command for the upcoming python script.
```

 * [v1.10](http://ohm.bu.edu/~collinsz/g-2/firmware_int_tdc_uC/inttdc_uC_v1-1.hex)
```
   First public firmware for the new Integrated TDC uC.
```
----
# OLD


### OLD Logic Board design
   * 2015-12-11 [v0F.0C.09.03](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-0C-09-03.mcs)

```
     Updated CDR set as power-up default.  Flash programming commands.
```

 * 2015-09-15 [v0F.09.0F.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-09-0F-01.mcs)

```
    Fixes to new event builder (missing CRC word) and connection of missed daq register fields (CDR historgrams, etc)
```

 * 2015-09-11 [v0F.09.0B.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-09-0B-01.mcs)

```
    New event builder
```
 * 2015-09-10 [v0F.09.0A.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-09-0A-01.mcs)

```
    New event builder
```


 * 2015-08-26 [v0F.08.1A.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-08-1A-01.mcs)

```
    Added some FLASH commands.  picoblaze clock dropped to 62.5Mhz from 125.
```

 * 2015-06-06 [v0F.06.06.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-06-06-01.mcs)

```
   Added longer CDR test time period.  Please add a event builder reset before this command is run.
```

 * 2015-05-29 14:15 EST [v0F.05.1D.01](http://ohm.bu.edu/~dgastler/g-2/firmware/Logicboard-0F-05-1D-01.mcs)

```
   Added cdr command to the SC interface that checks and corrects TDC serial data recovery for all enabled TDCs.
   This should be done after you enable the TDCs( on the LogicBoard reg 0x40), but before you call an event builder reset.
```
 * [v0F.05.1B.03](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-05-1B-03.mcs)

```
    New data format:
    Added several more registers to the TDC readout for debugging:
```


 * TOOL: [CDR.py](http://ohm.bu.edu/~dgastler/g-2/firmware/CDR.py)
```
    A tool for automatically doing the manual TDC CDR alignment.
    There are a few situations where this fails to work; power cycle in those situations.
```

 * [v0F.05.0F.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-05-0F-01.mcs)

```
    CDR phase controls.
    Bad firmware date (I'll fix tomorrow)
```


 * [v0F.05.14.06](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-05-14-06.mcs)

```
    Upgrade init script to [http://ohm.bu.edu/~dgastler/g-2/other/LogicBoard_config.py LogicBoard_config.py]
    Look for constant incrementing in misaligned idles or no incrementing in k-chars using [http://ohm.bu.edu/~dgastler/g-2/other/DumpTDCRegs.py DumpTDCRegs.py]
```


 * [v0F.05.13.05](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0F-05-13-05.mcs)

```
    Added slow control readout of full data, added CDR status (not useful though) and the current 10b and 8b words from the TDC.
    The next version will try the 4phase CDR lock-on code instead of the current 5phase one.
```
 * [v0F.05.0F.02](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-0f-05-0f-02.mcs)

```
    Stable readout if glib is reset after Logicboard initialization.
    Current bugs: TDC summary words in LB header always say there is a size error.
```

 * [v15.05.12.04](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-15-05-12-04.mcs)

```
    Better data alignment at BU.
    Current bugs: Still buggy word 15 in TDC.  TDCs are marked as bad size, but seem ok. Logicboard event number starting at two.
```

 * [v15.05.12.03](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-15-05-12-03.mcs)

```
   Removed buffer word in TDC fifo.
```

 * [v15.05.12.02](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-15-05-12-02.mcs)

```
  UART interface now shows the new version number on power-up and with the "version" command.
  Event builder has been updated to initialize more things on reset.
```

 * [v15.05.12.01](http://ohm.bu.edu/~dgastler/g-2/firmware/LogicBoard-15-05-12-01.mcs)

```
  Starting with this version, the firmware version number is stored in DAQ register 0x1 and is in the format of YYMMDDVV.
  Ex. This version reads: 0x0F050C01 meaning 2015-05-12 v1
```


### Old design TDC Board daughter-board firmware

 * [v20150519](http://ohm.bu.edu/~dgastler/g-2/firmware/TDCBoard-2015-05-19.pof)

```
   Minor changes to the clocking circuits.
```
 * [v20150514](http://ohm.bu.edu/~dgastler/g-2/firmware/TDCBoard-2015-05-14.pof) [New data format](http://edf.bu.edu/svn/edf/G-2/NewElectronics/TDCBoard/data_format/TDC.pdf)

```
   Added software and hardware addresses to the TDC data format in word 14.
```
 * [v20150512](http://ohm.bu.edu/~dgastler/g-2/firmware/TDCBoard-2015-05-12.pof)

```
   Back to non 2048 readout.
```

### Programming Firmware
**Instructions**
1. Plug in the Logicboard (slow control and power) and Integrated TDC if you want to reprogram the TDC or uC.
2. Download the most recent version of the firmware for the Logicboard, Integrated TDC, or Integrated TDC uC from this page.
3. Download the flash programming tool (both python scripts) [http://edf.bu.edu/svn/edf/G-2/NewElectronics/IntegratedTDC/Software/FlashProgram/]
4. run the programFlash.py file, followed by the firware you want to upload (and -i 0 or -i 1 for TDCs 0 or 1)
   * If you just powered up the Logicboard or TDC, you have to wait about 5 sconds for the logicBoard or until the fpgas program or fail to program before the script can connect.
**Explanation (what the python script does)**
(see [ohm](ohm) for command explanations)
 * The code for programming a Logicboard or Integrated TDC is very similar:
  1. Erase the flash memory with a "fe" command.
  2. Clear the  flash buffer (which is in the uC, not th flash memory) with a "fc" command.
  3. Set the memory address to be written to (Starting at 0) with "faw 000000".
  4. Write data into the flash buffer (up to 16 lines of data) with a "fww" followed by the line to write to and the data line.
  5. Write the flash buffer to the flash with the "fw" command.
  6. Repeat until all data has been written to the flash.
 * The code for programming an Integrated TDC uC is slightly different:
  1. Write "tdc_prog" followed by the integrated TDC to connect to (ex. "tdc_prog 0")
     a. This will connect to and restart the tdc, so that you can send commands to the bootloader.
  2. Send a series of bootloader commands to get in sync with the booyloader and enter programming mode.
  3. Send a bootloader command with the address to write to.
  4. Write a page of data (usually 128 bytes)
  5. Repeat until all data has been written.
  6. Send a command to leave the bootloader.
