# HpCalculatorSim
This is a retro-tech implementation of the classic HP-25 calculator.  I love the HP-25, and wanted to create a larger-than-life (literally) recreation.  Using the original chips is out of the question, so I've chosen to use a Z80, which was introduced at about the same time (1976 vs 1975 for the HP-25).  I started with some inspiration from Eric Smith's excellent [nonpareil](https://nonpareil.brouhaha.com/) simulator and the equally excellent [reverse-engineering](https://archived.hpcalc.org/laporte/Woodstock/ws_intro.htm) done by Jacques Laporte (R.I.P.).

## Events

 * https://hhuc.us/

[HpCalcBuildLog](HpCalcBuildLog.md)

## Hardware

<a href="http://ohm.bu.edu/~hazen/HPCalc/retro/case1.pdf"><img src="http://ohm.bu.edu/~hazen/HPCalc/retro/case1_sm.png" width="150"></a> <img src="http://ohm.bu.edu/~hazen/HPCalc/retro/kb_pcb_gerber.jpg" width="150">
<img src="http://ohm.bu.edu/~hazen/HPCalc/retro/cpu_pcb_gerber.jpg" width="150">

 * Github: https://github.com/eshazen/retro-25
 * SVN: http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/
 * !Keyboard/Display: [SVN](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/hardware/led-display/tags/Rev1/) [sch(svn)](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/hardware/led-display/trunk/led-display.pdf) [Schematic](http://ohm.bu.edu/~hazen/HPCalc/retro/led-display.pdf) (preliminary) [layout](http://ohm.bu.edu/~hazen/HPCalc/retro/lkb_pcb_layout.jpg) [gerbers](http://ohm.bu.edu/~hazen/HPCalc/retro/retro-25-v1.zip) (Rev 1)
   * Board with Cherry MX switches in classic HP-25 layout and 10mm 12 digit red LED display driven by two ICM7218A.
 * CPU:  [(SVN sch)](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/hardware/cpu/trunk/cpu.pdf) [Schematic](http://ohm.bu.edu/~hazen/HPCalc/retro/cpu.pdf) (preliminary)
   * Z80 10MHz cpu with 32k EEPROM, 32k SRAM and dedicated I/O for the keyboard/display.

 * Keyboard
   * Best bet seems to be Cherry MX keyboard switches
   * Keycaps:  https://pimpmykeyboard.com/dsa-relegendables-pack-of-10/
   * Very Useful:  https://matt3o.com/book/ (book on custom KB)
   * Custom jobs: http://www.wasdkeyboards.
   * http://www.keyboard-layout-editor.com
 * LED [LTC-4627JR](http://optoelectronics.liteon.com/upload/download/DS30-2000-185/LTC-4627JR.pdf) (10mm common Anode)
   * Driver: ICM7218A (common anode, 8 digit driver).  Recommend common anode as no external drivers or resistors are needed.
 * Case - Hammond 1456FH3 ?
 * CPU
   * Z84C0020PEG (20MHz Z80 or 10MHz if 20MHz not available)
   * AT28C256-15PU (32Kx8 150nS EEPROM)
   * AS7C256B-15PIN (32Kx8 15nS RAM)


## References

 * https://medium.com/@erikvanzijst/diy-eeprom-programmer-4fd11a486ea
 * https://hackaday.io/project/7306-np25-calculator
 * https://github.com/simpleavr/NP25
 * http://ohm.bu.edu/~hazen/Eric/NP25-master.zip (backup of GitHub)
 * https://www.hpcalc.org/authors/1105 (Eric Smith, Nonpareil and CSIM downloads)
 * http://www.teenix.org/ Another PIC based set of emulators
 * http://home.citycable.ch/pierrefleur/Jacques-Laporte/index-old.html - the famous Jacque Laporte (RIP) site
 * http://z80.info/z80-op.txt
 * https://archived.hpcalc.org/laporte/Woodstock/ws_HW_main.htm
 * http://www.vcalc.net/hp-code.htm


