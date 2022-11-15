# IntegratedTDC
This page describes a proposal to merge the two TDC daughterboards into a single 16-channel TDC module with two TDC FPGAs.

Some thoughts:

 * Use PS (passive serial) configuration scheme as shwon on page 36 of the [Cyclone III Handbook](https://www.altera.com/en_US/pdfs/literature/hb/cyc3/cyc3_ciii51016.pdf).  A JTAG connector should also be provided.  Delete the flash memory.
 * Optimize the voltage regulator scheme rather than duplicating the regulators on the TDC board
 * Remove all the voltage-measurement stuff

Useful links:

 * [Configuring Altera FPGAs](https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/cfg/cfg_cf51001.pdf)
 * [Cyclone III pinout](https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/dp/cyclone3/ep3c5.pdf)
 * [Cyclone III Pin Connection Guidelines](https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/dp/cyclone3/pgc-01003.pdf)

Configuration signal details gleaned from Altera docs:


| CONF_DONE | Open-collector | Driven low during configuration | 10k resistor |
| --------- | -------------- | ------ --- ------ ------------- | --- -------- |
| nSTATUS | Open-collector | Low during reset; high when ready to configure | 10k resistor |
| DATA[0] | Input | Configuration data in | |
| nCONFIG | Input | Pulse low to start configuration | |
| DCLK | Input | Clock for Data | |

Use an ATMega48/88/168/328 microcontroller (Arduino-TM compatible types) to configure the FPGA.
Connect it's UART !Tx/Rx to two of the JTAG backplane signals.  Extra ADC inputs can be used
to monitor voltages, etc.

svn: [http://edf.bu.edu/svn/edf/G-2/NewElectronics/IntegratedTDC/]

current consumption estimates: [](attachments/)

Here is a marked up version of the [TDC Schematic](http://edf.bu.edu/svn/edf/G-2/NewElectronics/IntegratedTDC/DesignNotes/MarkedUpTDC.pdf).

Board inventory and status:  [IntegratedTDC_Boards](IntegratedTDC_Boards.md)

Logicboards_daughterboards_SFPs moved to main page

## Rev B (production) problems/ECOs

 * LED level-shifter circuit doesn't work reliably.  The MOSFET takes a long time to turn off.
  1. First attempted fix:  Jumper R16 and remove R17. (no noticeable change)
  2. Second attempted fix: New MOSFET: **FDV301NCT-ND**. (Pulses are the correct shape, leds still don't work reliably)
  3. Actual Fix: Software fix, increased delay between commands to the leds. (v1.3 of uC firmware)

## Rev B Changes

 * Put smaller connector on for MCU programming
 * DNP JTAG connector
 * Remove 5V connector
   * Moved onto MCU programming connector
 * Put MCU_RESET signal (the net with the cap. between it and the MCU pin) on the test header
   * Moved C118 closer to MCU to facilitate this move
 * Fix ground pin labeling
 * ws2812b silkscreen labeling needs fixed. Right now the marking is at pin one, but the chip actually has a mark at pin 3.
   * Solution was to cut the corner on the silkscreen outline like it is on the package.
 * Gerbers were generated **with** tented vias.

## Programming a new board

See firmware page [ohm](ohm)

## To-do list

 * ~~Change i2c pins to "slow_control_rx/tx"~~
 * ~~Figure out power nets...~~
 * ~~Find the nCEO pin~~ Found on pin F16.
 * ~~Does it matter which pin is the SS? The Arduino library says you cannot have the SS pin as an in input, even in master mode?~~
 * Try to make regulator currents add up.
 * ~~Will not worry about pin remapping until layout.~~
   * ~~Looks like there are unused edge pins available on Bank 5!~~
 * ~~Add FPGA LVDS header~~.
 * ~~Add arduino symbol into local svn library~~
 * ~~Make arduino programming header like the JTAG header.~~
 * ~~Make arduino programming header 6-pin again and have another header for the TP's.~~
 * ~~Figure out key orientation of the programming connector for the AVR dude ribbon cable.~~
 * Make sure all symbols used (like the 2.5V symbol..) are in the local svn.
 * Solid fill or thermal relief for the vias under the tiny LDO's?

## Plan for power

 * Everyone will share 3.3V and 2.5V
   * Change main board reg to 3.3V
 * Each FPGA will get it's own 1.2V VCCA reg (analog PLL voltage)
 * Each FPGA will have it's own 1.2V VCC_INT/VCCD_PLL (digital PLL voltage)
   * Maybe use a 1210 0 ohm resistor as an inductor?
 * If I want to keep each TDC sheet identical, they will need to use normal nets and not power nets for where they are different

## Change log

11/30/2015
 * Eric took a quick look a the layout, suggested I separate the single ended traces more.
 * Found a big mistake where the LVDS pairs were 5 mils from the feedthrough connector to the LVDS buffer and then 7 mils to the FPGA. Corrected trace widths to 7 mils.

11/20/2015
 * Have been working on layout for the past two weeks.
 * LVDS is done, and power planes are planned out.

11/11/2015
 * Added another decoupling cap on the 2.5V net, there was one less than the number of power pins.
 * Figured out breakout for the BGA!

11/6/2015
 * Made "my_power.lib". Added 2.5V symbol.
 * Combined the 6-pin test point header and the 6-pin programming header on the microcontroller page into a single 10-pin header like the JTAG.
 * Worked significantly on component placement.

11/4/2015
 * Made arduino programming header right angle header.
 * Working on component placement.

10/30/2015
 * Eric made a separate library for resistors and capacitors called "my_discrete". The new libraries for KiCad 4 have shorter resistor and capacitor symbols, and it __breaks connectivity on all resistors and capacitors__. The my_discrete is a local library for resistors and capacitors that is stored in the svn.
 * Made footprint/symbol for 10-pin 2mm header for the FPGA LVDS header.


10/23/2015
 * Added Digikey part numbers for everything.
 * Changed M25P128 to M25P32.
 * Updating a lot of footprints so the pin 1 marker is not under the package.
 * Imported everything into pcbnew, and made the board outline.

10/21/2015
 * Changed default FPGA program mode from different to the same
 * Moved UART header to the MCU sheet, added two test points and a 3.3V pin
 * Changed standard LEDs to the WS2812B LEDs
 * Moved TDC_Out to a bank hat supports LVDS outputs

10/16/2015
 * Made python script to generate ugba-256 footprint
 * Switched over to the new KiCad
   * Nothing appears to break, the file formats are all the same, just integrity checking and tools have improved
 * Made the mod/ folder, and moved over .mod footprints from the previous project
 * Will be using the .pretty KiCad footprint library format from now on
 * Fixed the FPGA schematic symbol so that it doesn't break when it is annotated
 * Eliminated all DRC errors
   * "Severe" warning from the AREF pin of the arduino being connected to a power net (because the AREF pin is a bidirectional IO), but is of course not an actual issue


10/9/2015
 * Moved the slow_control_tx/rx and the board ID bits to a 3.3V bank because they are 3.3V signals.

10/7/2015
 * Changed the adjustable regulator to the fixed 3.3V version
 * Added a pullup resistor to the SPI flash CS line
 * Transplanted the regs from the TDC board. The 2.5V reg now supplies the LVDS banks for both TDCs.
 * Added 3 LEDs
 * Added 6-pin ICSP header from Arduino board for the MCU
 * Added TDCx_TX/RX bit-bang UART from the MCU to each TDC
 * Added hierarchical pins on the TDC sheet for VCC_INT, VCCD, and VCCA
 * Kicad seems to be randomly changing pin names on me....

10/5/2015
 * Made symbol for the TPS73701DRBT

10/2/2015
 * Changed backplane JTAG to uart rx/tx, MSB of board id, and MCU reset
 * Fixed the LSB of the board id's
 * Changed the I2C to "Slow_Control_RX/TX"
 * Moved all .sch files into sch/
 * Added 28-qfn ATMega328P
   * Connected an M25P32 to the SPI bus (same SPI bus as the ICSP)
   * Connected the FPGA signals to arbitrary pins on the 328.
   * Used the configuration where the FPGAs can be programmed separately

## Cli Commands

```
help:
   return a list of all commands (some listed commands do nothing)

fi: flash info
   gets info about the flash

fe: flash erase
   erases the flash for writing. You'll need to issue this command before you write an mcs file to flash.

fsr: flash status read
   read the status register of the flash

fsw: flash status write
   write to the status register for the flash

fww: flash word write
   This writes to the local uC memory in words of 64bits.  The first argument is one char long and is 0-F to set which of the 16 64bit words you are writing.
   The second and third arguments are the words to write to memory.
   Ex. "fww 4 01234567 89abcdef" would fill bytes 32 - 48 with the values 01234567 89abcdef

fc: flash clear
   clear 128 byte buffer in local uC memory

faw: flash address write
   set the 24 bit address to use on the flash

fwr: flash word read
   print the local memory buffer of 128 bytes to the screen (use this at first to confirm you know how fww works)

far: flash address read
   print the current flash address

fw: flash write
   write the local 128byte memory buffer to the address on the flash (address is auto incremented)

fr: flash read
   read the flash at the address into the 128 byte buffer on the uC (address is auto incremented)

conf_fpga: configure fpgas
   configure the fpgas using the flash memory. The leds will flash blue during configuration, If properly configured, the first led will flash green, if improperly configured, it will flash red

checkfpga: check fpgas
   check if the fpgas were configured. Prints back if they were or not

temp: temperature
    return the reading of the temperature sensor as two hex bytes

```
