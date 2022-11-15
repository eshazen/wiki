# RedSeatMedia
This page contains documentation for the RedSeat Media Gyro sensor project.

FINAL DOCUMENTATION: [Deliverables](Deliverables.md)

Design files require user name and password.
## Rev 2 Prototype
 * [SVN Archive](http://edf.bu.edu/svn/edf/External/RedSeat/BLE%20Gyro%20Device/Kicad/2nd%20prototype/)
 * [Rev 2 PCB Layout Notes](Rev_2_PCB_Layout_Notes.md)
 * [Rev 2 Programming Fixture](Rev_2_Programming_Fixture.md)
 * [](attachments/)
 * [ECOs](ECOs.md)

## Rev 1 Prototype

 * Schematic: [GyroBLE.pdf](http://ohm.bu.edu/~hazen/External/RedSeat/GyroBLE.pdf)
 * [SVN Archive](http://edf.bu.edu/svn/edf/External/RedSeat/)


## Documentation Links
 * HM-11 BLE module:  [Seeed Studio Wiki](http://www.seeedstudio.com/wiki/Bluetooth_V4.0_HM-11_BLE_Module) * http://www.huamaosoft.com/ * [bluetooth40_en.zip](http://ohm.bu.edu/~hazen/DataSheets/BLE/bluetooth40_en.zip) (local copy)
 * [AAA Energizer battery](http://data.energizer.com/PDFs/E92.pdf)
 * [TPS61097A-33](http://www.ti.com/lit/ds/symlink/tps61097a-33.pdf) regulator
 * [L3GD20H Gyro](http://ohm.bu.edu/~hazen/DataSheets/ST/L3GD20H.pdf)
 * [ATmega328](http://www.atmel.com/images/Atmel-8271-8-bit-AVR-Microcontroller-ATmega48A-48PA-88A-88PA-168A-168PA-328-328P_datasheet_Complete.pdf)

[Thoughts about Power Down Mode](Thoughts_about_Power_Down_Mode.md)

## Board Inventory / Status


| *Board* | *Notes* |
| ------- | ------- |
| 001 | Modified by Chris -3.3v/GND short |
| 002 | Testing board, modified by Eric, probably cooked |
| 003 | Short some parts |
| 004 | Fuses programmed; LEDs working; Gyro communicates |
| 005 | Untested - programming connector needs to be replaced  |


## Test Log

 * 3.3V regulator OK.  Negligible current drawn
 * Switches mis-wired (see ECO)
 * Pololu programmer doesn't work out of the box with 3.3V board.  Have to reprogram.  Install pololu sdk ([here](https://www.pololu.com/docs/0J41)).  Use executable "!PgmCmd" to reset the voltage range to 3V-5.5V and it works OK.
 * See notes below on setting up Arduino environment
 * Reset fuses to (H=0xd9 [default], L=0xe2 [changed from 0xd2], E=0x7 [default]).
   * `$ avrdude -P /dev/ttyACM0 -p m328 -c avrispv2 -U lfuse:w:0xe2:m`
 * *Pinout incorrect on J1* (programming connector).  Making an adapter.  The footprint has a wrong (at least unconventional) pin numbering, plus some pins are mis-assigned on the schematic.
 * Pin 5 (CS) of U2 (Gyro) is floating.  Should be tied to switched VCC
   * In fact switched VCC is probably a mistake as the Gyro has it's own power-down mode
 * Board 4 patched U2-5 to VCC:   Gyro responds sensibly to most I2C commands but seems stuck rebooting.
 * Boards 4 and 5 seem to work consistently if powered off, disconnected USB, wait 10's of seconds.
 * Install BLM module on board 005
   * Pin 4 of BLM is input, 2 is output.  So Tx/Rx are swapped on the PCB (sigh).  Not easy to patch on PCB after BLE module installed.  Going to try using two software serial ports.

## ECO List

 * Fix switch wiring  --done
 * (Fix programmer connector pinout)   --done
 * Add LEDS (either in buttons or separate)   --done
 * Tie U2-5 to VCC
 * Remove PMOS switched power circuits   --done
 * Change U2 (gyro) footprint: lengthen pads for hand soldering   --done

## Pin Naming

The Arduino software refers to pin names/numbers as on the Arduino board.  Most of the device pins can be accessed by using the mapping table below.  Unfortunately the pins marked "N/A" below cannot be directly accessed in the Arduino environment without either hacking the environment or using low-level code.

```
AVR       MLF  Function    IDE
---       ---  --------    ---
PB4/MISO  14   Prog        12
PC6/RST   25   Prog        N/A
PB5/SCK   15   Prog        13
PB3/MOSI  13   Prog        11

PD3       1    BLE_nPWR    3
PD4       2    BLE_nRST    4
PD2       28   BLE_PIO     2
PD0/RXD   26   BLE_RX      0
PD1/TXD   27   BLE_TX      1

PC1       20   GY_nPWR     A1
PC2       21   GY_INT1     A2
PC3       22   GY_INT2     A3
PC4/SDA   23   GY_SDA      A4
PC5/SCL   24   GY_SCL      A5

PB7/XTAL  6    SW1         N/A
PD5       7    SW2         5
PB6/XTAL  5    RGB_LED     N/A

PC0       19   VBATT       A0

PB1       11   USB_RX      9
PB2       12   USB_TX      10

PB0       10   TEST1       8
PD6       8    TEST2       6
PD7       9    TEST3       7
```

## Software

1. Install the Arduino tools (1.6.3 is known to work).  Suggest installing as *~/arduino-1.6.3*.

2.  Install avrdude.  (In Ubuntu Linux, just type "sudo yum install avrdude".  In other OS you're on your own!)

3.  edit the file (assuming you installed in recommended location):
```
  ~/arduino-1.6.3/hardware/arduino/avr/boards.txt
```
Add the following lines at the end of the file and save it.

```
##############################################################
# added below thanks to "RiBi"
# http://forum.arduino.cc/index.php?topic=302659.0
##############################################################
atmega328bb.name=ATmega328 on a breadboard (8 MHz internal clock)
atmega328bb.upload.tool=avrdude
atmega328bb.upload.protocol=arduino
atmega328bb.upload.maximum_size=30720
atmega328bb.upload.speed=57600
atmega328bb.bootloader.tool=avrdude
atmega328bb.bootloader.low_fuses=0xE2
atmega328bb.bootloader.high_fuses=0xDA
atmega328bb.bootloader.extended_fuses=0x05
atmega328bb.bootloader.file=atmega/ATmegaBOOT_168_atmega328_pro_8MHz.hex
atmega328bb.bootloader.unlock_bits=0x3F
atmega328bb.bootloader.lock_bits=0x0F

atmega328bb.build.mcu=atmega328p
atmega328bb.build.f_cpu=8000000L
atmega328bb.build.core=arduino
atmega328bb.build.variant=standard
```

4.  Edit the file

```
   ~/arduino-1.6.3/hardware/arduino/avr/programmers.txt
```

change the line
```
  avrispmkii.program.extra_params=-Pusb
```
to read
```
  avrispmkii.program.extra_params=-P{serial.port}
```

5.  Start the Arduino IDE and select *Tools->Board->Atmega328 on a Breadboard*

6.  Select the correct port (maybe */dev/ttyACM1*?) for your programmer cable using *Tools->Port*

### Programming a Sketch to Board

 * Compile the design as usual (just compile, don't use the download button)
 * Use *File->Upload Using Programmer* to upload the file through an ISP cable

### Connecting to app
 * Pin of HM-11: 000000

Useful Links:

 * https://www.ashleymills.com/node/327 - HOWTO compile Arduino code using GCC and make
 * http://forum.arduino.cc/index.php?topic=302659.0 - Targeting a breadboard Atmega328 from Arduino 1.6



----


## Zach Lasiuk's Progress Log and Notes==


| *Date* | *Progress* |
| ------ | ---------- |
| Mon 05/11 | Updated BOM with illuminated vs non-illuminated button choices, Updated and added several footprints, including new buttons and connectors|
| Teu 05/12 | Updating Schematic to replace USB serial interface with external conn, Researched several options for programming during mass production and for consumers |
| Wed 05/13 | Calling PCB manufacturers & assembly houses to see best option for mass programming |
| Thu 05/13 | Best option seems to be integrating programming of chip with testing interface, and am doing research on how much this step will cost in the process. Additional DFM research |

Notes and Links:

 * Teu 5/12: Mass-Programming is going to be a point of concern. We have two basic options it seems: 1) Include cheap 3x2 header, requires just a ribbon cable to plug in, no precise setup. 2) Have SMT pads on the board; this requires precise alignment and thus a custom jig made by (most likely) us to ensure the mechanical alignment.

 * Thu 5/14: We have learned that the most cost-effective option will be to test the boards as well as program them, and are perusing this option.

Mass Programming Notes:

 * Cirexx Assembly -- Don't do much programming. Recommends not uploading code before the assembly process as existing code could be corrupted from assembly operations (heat, shorting of pins, etc). We could supply testing setup for them and have them upload code & test it, in which case they can quote for us.

 * DigiKey -- DO NOT offer to program our board since it is a QFN package, but if we were to switch to the standard DIP package ([ATMEGA328 in DIP](http://www.digikey.com/product-search/en?x=0&y=0&lang=en&site=us&keywords=atmega328-pu-nd)) their rates are 0.25$ per chip as a programming fee.

 * Since there must be a step for testing in the process already, it seems like the best option is to program the chips after the testing is done in a testing rig we make up. We are perusing this option now.

 [wiki:DFM] Design For Manufacturing Notes
