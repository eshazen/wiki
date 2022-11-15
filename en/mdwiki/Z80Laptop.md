# Z80Laptop
Dreaming of a CP/M Z80 laptop!

 * Github: https://github.com/eshazen/z80system
   * SVN: http://edf.bu.edu/svn/edf/EricHome/Z80System/ (obsolete)
 * Grant's systems: http://www.searle.wales/
 * http://www.glensstuff.com/trs80/trs80.htm
 * http://ohm.bu.edu/~hazen/HPCalc/Z80Ref/z-80.htm - Z80 Reference

## 2021 references

 * [RC2014](RC2014.md)
 * https://www.clockworkpi.com/devterm - portable pi-based system.  Very cool mechanics
 * https://www.retrobrewcomputers.org/doku.php?id=builderpages:plasmo:vgaxram - VGA in 128K RAM socket
 * https://groups.google.com/g/rc2014-z80 - RC2014 group
 * https://hackaday.com/2021/04/30/vga-graphics-card-in-74xx-logic/ - VGA in TTL!  Brillant.
 * https://github.com/hairymnstr/Z80-Project-Mark-2 Abandoned Z80 project but _FAT filesystem code_
 * https://ciernioo.wordpress.com/2015/08/12/fat16-file-system-implementation/ _Another FAT filesystem_

## Operating system / architecture

 * FUZIX: https://github.com/EtchedPixels/FUZIX [FuzixBuildNotes](FuzixBuildNotes.md)

## Evolution from calculator CPU

 * 512Kx8 SRAM with bank switching (including EEPROM)
 * Interrupt support
 * Add some hardware serial ports (maybe 2)
 * Add 2X SD card interfaces
 * PIO or at least an expansion bus

## Evolving Design

 * Z80 CPU, DART, PIO
 * AT28C256 32Kx8 EEPROM
 * AS6C4008 512Kx8 SRAM
 * Clocks:  8MHz osc /2 => 4MHz CPU clock
 * Clocks:  1.8432MHz / 12 => 16X 9600 clock
 * MAX232 or equiv; DB-25 for RS-232

## Useful Tools

 * https://github.com/Kris-Sekula/EPROM-EMU-NG
 * [TTL_Simulation](TTL_Simulation.md)

## Video

Video:

 * [LCD_on_Nexys3](LCD_on_Nexys3.md) and other FPGA ideas such as CMOD-A7
 * [VGA LCD](https://ebay.us/zFxD4P) or [Datasheet](http://ohm.bu.edu/svn/edf/EricHome/Z80System/documents/VGG644803-6UFLWB-EVERVISION.pdf)
 * [CRTCVideoIdeas](CRTCVideoIdeas.md) for designs based on CRT controllers
 * or directly [MC6845Board](MC6845Board.md).
 * [TTLVideoIdeas](TTLVideoIdeas.md) for TTL-only
 * FPGA:  [Basys 3](https://store.digilentinc.com/basys-3-artix-7-fpga-trainer-board-recommended-for-introductory-users/)?
   * There is even a [demo project](https://reference.digilentinc.com/learn/programmable-logic/tutorials/basys-3-general-io/start) which includes mouse and VGA support (not that we need the mouse!)
   * The XC7A35T has 50 BRAMs (36kb each) (CMOD A7)
   * The XC7S25 has 45 BRAMs (36kb each) (CMOS S7)

VGA modes (60Hz) (from [blog](https://timetoexplore.net/blog/video-timings-vga-720p-1080p#:~:text=VGA%20640x480%2060%20Hz&text=With%20analogue%20VGA%20monitors%20you,(rather%20than%2059.940%20Hz).)


| *Mode* | *Pixels* | *Clock* |  *RAM Adx (256 color)* |
| ------ | -------- | ------- |  ---- --- ---- ------- |
|  640x480   |    370k      |  25.175 MHz |  18 |
|  800x600   |    480k      |  40.000 MHz |  18 |
| 1024x720   |    922k      |  74.250 MHz |  20 |
| 1920x1080  |    2.1M      | 148.500 MHz |  21 |

For some sort of DIY video with an FPGA or even TTL logic, for 640x480 we need about 10 bits of row count (525 lines) and 10 bits of pixel count (800 total clocks).  Active area is 10 bits horiz and 9 bits vertical.  [Here](https://eater.net/vga#kits) is an inspiring project!

IMSG171 is a classic RAMDAC good for VGA output (and still available on eBay).

```
VGA timing (640x480 60Hz):
    horiz:  16 + 96 + 48 + 640 = 800 at 25.2 MHz
    vert:   11 + 2 + 31 + 480 = 524

Horiz line 800 pixels, 100 bytes
Various 8x16 fonts from IMB seem reasonable

For just bit-mapped graphics, need 100 x 480 = 48k RAM
Hardware character generator seems a good option.

Horizontal logic:

  Front porch:   2 byte times
  Horiz sync:   12 byte times
  Back porch:    6 byte times
  Horiz active: 80 byte times

  Most convenient is probably to start at 0 with first active

Vertical logic:

  480 lines (30 character frames of 16 lines each)
  44 lines of sync:
    VFP:  11 lines
    VS:    2 lines
    VBP:  31 lines
```

## Keyboard

 * Cherry G84 keyboard?
   * 11 x 5.2 x 1 in USB
   * It comes with a PS/2 interface!  (confirm).
 * Otherwise:
   * http://www.keyboard-layout-editor.com
   * http://builder.swillkb.com/  (for plate, $50 from Ponoko in steel)
   * https://github.com/jeroen94704/klepcbgen (to make PCB from KLE)

The options seem to be:  PCB only, Plate only (hand-wired), both.
3D printed plate is interesting but has to be segmented to fit on printer.
PCB only is also interesting, with a case around the outside which could
be 3D printed in sections.


## Other


 * NEC NL6448AC33-18 display (9.6 x 7.3 in  640x480  VGA timing) [data](http://www.taopanel.com/nec/datasheet/NL6448AC33-18A.pdf)
   * Mating connector Hirose H123172-ND (IDC)
   * Cable AE34A-5-ND
   * Other end WM14334-ND mated to WM6581-ND
 * https://robey.lag.net/2010/01/23/tiny-monospace-font.html
 * https://www.allelectronics.com/item/lcd-101/256-x-128-lcd-panel/1.html
 * https://sites.google.com/view/erics-projects/z-80-projects-page/hyundai-256x128-lcd-display

Lots of NVRAM / flash and RAM disk

Parts:

 * 128Kx8 flash:  GLS29EE010-70-4C-PHE
 * 32Kx8 flash:  AT28C256-15PU
 * 512Kx8 SRAM:  AS6C4008-55PCN
 * 128Kx8 SRAM:  AS6C1008-55PCN
 * Z80 8MHz CPU:  Z84C0008PEG
 * Serial I/O:
   * SCN2661 / SCN 68661 EPCI (single port w/ baud rate gen)
   * SCN68681 or SCC2681 (progr. baud rate, avail on eBay)
   * Z80 DART:  Z8470 (needs baud rate) or SIO same deal

Floppy controllers:
 * FD1797 (needs data separator) [sample schem](http://www.bitsavers.org/pdf/convergent/ngen/hardware/A-09-00328-01-A_Floppy_Hard_Disk_Manual_Jan84.pdf)
   * use with FDC9216 [ftp://bitsavers.informatik.uni-stuttgart.de/components/standardMicrosystems/TN6-1_9216_Floppy_Disk_Data_Separator_Jun82.pdf data]
 * WD2797 (on-chip PLL data separator)
   * http://swtpcemu.com/mholley/DC_5/DC5_Index.htm Nice example design
 * WD37C65C (NEC 765 clone?)
 * FDC9266
 * WD1770/1771/1772 (5-1/4 inch drives only?)

SDCard interfaces:
 * https://codeandlife.com/2012/04/02/simple-fat-and-sd-tutorial-part-1/
 * https://www.sdcard.org/downloads/pls/

CF/IDE interfaces:
 * https://www.pjrc.com/tech/8051/ide/wesley.html (command list)
 * https://ciernioo.wordpress.com/2015/02/10/compact-flash-8255-interface-card/
 * http://www.cosam.org/projects/z80/ata.html
 * http://blog.retroleum.co.uk/electronics-articles/an-8-bit-ide-interface/

N.B.:  the upper 8 bits of the IDE interface can be ignored if you only use half the disk capacity.  Not much of a problem for a Z80 CP/M system!

Software:
 * [FDU](https://github.com/wwarthen/RomWBW/blob/master/Source/Apps/FDU/FDU.asm) disk utility
 supports amongst other things formatting of 8" floppies

Emulators:

 * https://github.com/redcode/Z80
 * http://blog.retroleum.co.uk/electronics-articles/an-8-bit-ide-interface/

Design ideas:

 * In 13x9 inch box, keyboard and PCB ~ 12 x 2.8 would fit.
 * Need a terminal emulator to generate VGA timing and deal with USB/PS-2 keyboard.
   * Maybe an R-Pi?  Could do Wifi too
   * or this one: http://geoffg.net/terminal.html


