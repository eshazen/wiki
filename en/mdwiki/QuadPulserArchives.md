# QuadPulserArchives
## Reference

 * [Enclustra downloads](http://download.enclustra.com/)

## Prototype boards

### ADC Prototype PCB Rev 1

 * [SVN](http://gauss.bu.edu/svn/g2-quad-pulser.hardware)
 * [QuadPulserRev1ToDo](QuadPulserRev1ToDo.md) -- notes on PCB design *including problems found in prototype*
 * [QuadPulserRev1DebugLog](QuadPulserRev1DebugLog.md) -- Debug Log

### ADC 8-channel PCB

 * [QuadPulserRev2ToDo](QuadPulserRev2ToDo.md) -- notes on 8-channel PCB design

### Main Board PCB Rev 1

 * [QuadPluserMainBoardNotes](QuadPluserMainBoardNotes.md) -- Design notes for main board

# 2017 Archives

Here is most of the contents of the main Wiki page which is obsolete...

### Test on existing HW

 * Switch picoblaze comms back to USB/serial
 * Add registers to explicitly set ISERDES delays on both ends (Zynq, picoblaze)
 * Test / verify high speed serial comms (all 4 sets of FMC connections)
 * Restore simple ADC capture/readout via picoblaze
 * Test all ADC inputs and protection board
 * Test all SMA I/O and DB-9 as much as we can

### New hardware rev

 * ADC board
   * Check/correct all relevant ECOs
     * Check sequencer output resistors
     * Fix oscillator pinout
     * Check flash memory part number / footprint
     * Add pin 1 mark on U5 (check all footprints for orientation marking)
   * Move vias out from under chips (review layout for test probing and mods)
   * Change level shifter package
   * Delete all switching converters
   * Add power connector for all bulk voltages
     * Mounting holes for power board too
   * Check ADC channel number order
   * Ensure test points on every PS voltage, label test points on silkscreen
   * Convert front-end amps to 5V only (vs -1, +4)
   * Add two 5V LDO regulators for level shifters and ADC
   * Fix DB-9 buffer problems
   * Convert bi-directional SMAs to use two FPGA pins (in, out)
   * Larger series resistors on LEDs
   * FTDI serial vs HDMI serial (jumpers / duplicate I/o?)
   * New interface connector Micro-HDMI
 * Power supplies
   * Consider design of mezzanine board, or a single master power supply board

Zynq interface thoughts:

See PicoZed page.  FMC I/O pairs LA00-LA19 are LVDS-capable, and if JP5 is set to 2.5V on the carrier then they support differential termination on inputs.

New FMC interface board underway [(schematic)](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/FMC_interface/trunk/fmcint_sch.pdf) using Micro-HDMI connector for each board.  Requires only that LVDS be supported on the LA pairs of a LPC-FMC.

TTC interface:  Could use TTC-FMC but would have to provide a TTC carrier connector site somewhere.  In theory this could be added to the FMC interface board, but the mechanics are not obvious.  At least 3.3V and two LVDS pairs need to be connected, possibly some other things like I2C though level shifters from 2.5V/1.8V would need to be provided.

Obs:  The PMOD connectors A and B on the !PicoZed FMC carrier are on bank 13, which is fixed and VCCO=3.3V.

## ToDo to complete Rev 1

 * FMC Breakout:  https://www.xilinx.com/products/boards-and-kits/hw-fmc-xm105-g.html
 * See also [QuadPulserRev1ShoppingList](QuadPulserRev1ShoppingList.md)
 * Perform ECOs on ADC boards and program/test
 * Drill box per drawing [FRONT_PANEL.pdf](http://gauss.bu.edu/svn/g2-quad-pulser/Docs/mech/FRONT_PANEL%20Model%20(1).pdf) (prelimiary)
 * Assemble FMC adapter boards (4)
 * Assemble Input protection boards (4)
 * Make cables for power and signals -- [cables.pdf](http://gauss.bu.edu/svn/g2-quad-pulser/Docs/wiring/cables.pdf)
   * Need clock input.  Can come from HDMI but nominally CML output levels.  Need to either remove pull-ups to 3.3V or arrange for some AC coupling
 * Write/test firmware and software


## Reference

 * [TTC-FMC](http://www.ohwr.org/projects/optical-cdr-fmc/wiki) (OHWR site) or [schematic](https://edms.cern.ch/ui/file/1144619/1/EDA-02319-V1-0_sch.pdf) (direct link)
 * [PicoZed 7015 schematic](http://ohm.bu.edu/~hazen/DataSheets/PicoZed/Avnet-PicoZed-7Z015-7Z030-RevC-EN-Schematic.pdf)
 * [PicoZed FMC Carrier schematic](http://ohm.bu.edu/~hazen/DataSheets/PicoZed/SCH-AES-PZCC-FMC-V2-G-v1.pdf)
 * [Pinout Table for Picozed 7015/7030](http://picozed.org/sites/default/files/documentations/PZCC-FMC-V2%20JX%20pinout%20tables%20160503.zip)

## Version 1 Design Summary

The first hardware version will consist of an enclosure containing four
ADC/FPGA boards (Rev C), each with a protection board and FMC adapter attached.
These boards will be powered by an external 12V "brick" AC adapter with a wiring
harness to supply 12V to each ADC board.  The ADC boards will communicate with
the Zybo over twisted-pair cables connected to the four "high speed" PMOD connectors
on the Zybo.

_Note:  5V power for Zybo needed too, maybe a 7805 on the 12v?_

 * [ZyboNotes](ZyboNotes.md) -- pin mapping from ADC board through FMC Adapter to Zybo pins
 * [Proposal](http://gauss.bu.edu/svn/g2-quad-pulser/Docs/proposal/g2-quad-pulser.pdf) -- Draft document describing hardware and programming interface
 * [QuadPulserRev1ShoppingList](QuadPulserRev1ShoppingList.md) -- items for purchase to complete version 1

### ADC FPGA Rev C

 * [ADC-RevC-Debug](ADC-RevC-Debug.md) -- debug issues with ADC board
 * [ADC-RevC-ECO](ADC-RevC-ECO.md) -- list of required changes to ADC board
 * [QuadPulserRev2ToDo](QuadPulserRev2ToDo.md) -- notes on layout
 * HW SVN http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ADC_board/tags/RevC_as_built/
   * [Schematic (PDF)](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ADC_board/tags/RevC_as_built/adc_sch.pdf)
 * FW SVN http://gauss.bu.edu/svn/g2-quad-pulser.firmware/ADC_Board/trunk/

### FMC Adapter

 * [SVN directory](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/FMC_adapter/)
 * [Schmatic](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/FMC_adapter/fmc-adapter_sch.pdf) (PDF)
 * [PCB layout](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/FMC_adapter/fmc-adapter_pcb.png) (PNG)


### Zybo

 * [Zybo page](http://store.digilentinc.com/zybo-zynq-7000-arm-fpga-soc-trainer-board/) on digilentinc.com
 * [ZyboNotes](ZyboNotes.md) -- pin mapping from ADC board through FMC Adapter to Zybo pins

### Protection Board PCB Rev 1

 * [[SVN directory](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/ProtectionBoard/tags/RevA/) for "as built" Rev A
 * [QuadPulserProtectionBoardNotes](QuadPulserProtectionBoardNotes.md) -- notes on the protection board

### Firmware and Software setup process Rev 1

 * [PicozedZynqFirmware](PicozedZynqFirmware.md)
 * [PicozedZynqSoftware](PicozedZynqSoftware.md)

### Tested ADCBoards

*Bad flash*


| asm ID | edf ID | 2.2V | 3.7V | 5V | overall | Notes |
| --- -- | --- -- | ---- | ---- | -- | ------- | ----- |
| 90649 | ? | good | good | good | good | Fixed 2.5V only 12V needed now |
| 90650 | 1 | bad  | bad  | ? | bad | Did ECOs still no U17 outputs |

*Good flash*


| asm ID | edf ID | 2.2V | 3.7V | 5V | overall | Notes |
| --- -- | --- -- | ---- | ---- | -- | ------- | ----- |
| 90651 | ? | bad | 3.8V | ? | bad | remove regs |
| 90652 | 6 | bad  | 3.8  | ? | bad | remove regs |
| 90653 | 5 | good | good | good | good | Blinky OK |
| 90654 | ? | bad  | bad  | ? | bad | Brain surgery candidate |
| 90655 | ? | good | bad  | ? | good* | Blink OK -- Ext 3.7V |
| 90656 | 4 | installed | wrong | ? | bad | remove regs |
| 90657 | 7 | bad  | bad  | ? | bad | remove regs |
| 90658 | ? | good | good | good | good | Blinky	OK |

```
90649   1717/LTM4622V/N423/MY   OK [1]
90650   1717/LTM4622V/N423/MY   bad [1]

90651   1703/LTM4622AV/N637/MY  2.2V bad
90652   1703/LTM4622AV/N637/MY  2.2V bad
90653*  1703/LTM4622AV/N637/MY  OK
90654   1703/LTM4622AV/N637/MY  bad
90655   1703/LTM4622AV/N637/MY  3.7V bad
90656   1703/LTM4622AV/N637/MY  n/a [2]
90657   1703/LTM4622AV/N637/MY  bad
90658   1703/LTM4622AV/N637/MY  OK

Notes:

[1]  Flash memory was wrong package, board unusable
[2]  LTM4622 rotated 90 deg, board unusable
```
