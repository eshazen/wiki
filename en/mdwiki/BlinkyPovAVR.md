# BlinkyPovAVR
This is a re-engineering of the wonderful [BlinkyPOV](http://www.wayneandlayne.com/projects/blinky/)
We created our own because we prefer AVR microcontrollers to the PIC they used, but otherwise it is a brilliant design.

 * [http://edf.bu.edu/pov/] -- public page
 * [ScienceSolstice2013](ScienceSolstice2013.md) -- Planning Page
 * [ScienceSolstice2014](ScienceSolstice2014.md) -- Planning Page
 * [ScienceSolstice2017](ScienceSolstice2017.md) -- Planning Page

## PCB Files

 * Rev 4 - Fabricated October 2013 (too late for Science Solstice 2013) and November 2014
   * [BlinkyPov4Notes](BlinkyPov4Notes.md) -- notes on the Rev 4 PCB
   * [BlinkyPovAVR4.tar.gz](http://ohm.bu.edu/~cwoodall/archive/BlinkyPovAVR4.tar.gz) (same as below)
   * [SVN repository](http://edf.bu.edu/svn/edf/Eric/BlinkyPov/) (or [BlinkyPov_v4.zip](http://ohm.bu.edu/~hazen/BlinkyPovAVR/BlinkyPov_v4.zip) local copy of 12/12/2014)

 * Rev 3 - Fabricated October 2012
   * [BlinkyPovAVR4.tar.gz](http://ohm.bu.edu/~cwoodall/archive/BlinkyPovAVR4.tar.gz) -- revision 2013

 * Rev 2 - Fabricated November 2012, not really tested yet as of 10/7/13
   * [schematic_v2.png](http://joule.bu.edu/~hazen/BlinkyPovAVR/Rev2/schematic_v2.png)
   * [BoardScreenshot.jpg](http://joule.bu.edu/~hazen/BlinkyPovAVR/Rev2/BoardScreenshot.jpg)
   * [BlinkyPovAVR2.tar.gz](http://ohm.bu.edu/~hazen/BlinkyPovAVR/BlinkyPovAVR2.tar.gz)
   * [Firmware_v2.zip](http://ohm.bu.edu/~hazen/BlinkyPovAVR/Firmware_v2.zip)
   * [Firmware_v3.zip](http://ohm.bu.edu/~hazen/BlinkyPovAVR/Firmware_v3.zip)
 * Rev 1 (prototyped, a few problems exist)
   * [BOM](https://docs.google.com/spreadsheet/ccc?key=0AlkcEtLoMLBZdGo4TGlKcFlicldyMmZFSWY0eERLM2c)
   * [schematic](http://ohm.bu.edu/~hazen/BlinkyPovAVR/schematic.png)
   * [pcb_view](http://ohm.bu.edu/~hazen/BlinkyPovAVR/pcb_view.png)

First prototypes back.  There are some issues:

 * The Kicad LED footprints don''t have a bottom soldermask opening (or it is way too small)
 * The ISP pins should not be connected to LEDS

## Tools Etc

 * [KiCAD](http://www.kicad-pcb.org/)
 * [OSH Park](http://oshpark.com/)
 * [DigiKey Corporation](http://www.digikey.com/)

## Firmware Notes

There is no UART.  Have to bit-bang one if needed.

With default settings, ADC converts at ~15kHz as advertized (66 uS per conversion)



