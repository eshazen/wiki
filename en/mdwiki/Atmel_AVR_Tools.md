# Atmel_AVR_Tools
## Atmel AVR Microcontroller Links

 * Atmel
   * [Atmel AVR](http://www.atmel.com/products/AVR/)
   * [AVR TV](http://www.avrtv.com/)
   * [Atmel AVR - Wikipedia](http://en.wikipedia.org/wiki/Atmel_AVR)

 * Software Libraries
   * [avr-libc](http://www.nongnu.org/avr-libc/)
   * [Procyon Engineering](http://hubbard.engr.scu.edu/embedded/avr/avrlib/index.html)
  library _'including TCP/IP stack_.  Development boards too.
     * [avr-libc v1.4.0 user manual](http://joule.bu.edu/~hazen/avr-libc-user-manual-1.4.0/)
     * [LCD Library](http://winavr.scienceprog.com/example-avr-projects/avr-4-bit-lcd-interface-library.html)
 &ndash; [AVR-LCD4b.zip](http://joule.bu.edu/~hazen/AVR/AVR-LCD4b.zip)
   * [Arduino Libraries](http://arduino.cc/en/Reference/Libraries)
   * [EDF AVR Starter Code](http://ohm.bu.edu/~pbohn/__Engineering_Reference/AVR_Starter_Code/avr_starter_code.zip)


 * Integrated Development Environments
   * [Winavr](http://winavr.sourceforge.net/)
   * [AVR Studio](http://www.atmel.com/dyn/products/tools_v2.asp?family_id=607)
   * [Arduino IDE](http://arduino.cc/en/Main/Software)
   * [IAR Embedded Workbench](http://www.iar.com/ewavr)

 * Operating Systems
   * [AvrX Real-time kernel](http://www.barello.net/avrx/AvrX-2.6/index.htm)
   * [FreeRTOS](http://www.freertos.org/)
     * [AVR Port](http://www.freertos.org/a00098.html)

 * Protothreads
   * [Protothreads](http://www.sics.se/~adam/pt/)
   * [open source protothread manager](http://protothread.wiki.sourceforge.net/)
   * [Embedded Covers Protothreads](http://www.embedded.com/2008/0805)

 * Arduino
   * [ArduinoNotes](ArduinoNotes.md)
   * [Hardware Fun with the Arduino board](http://lwn.net/Articles/262721/)
   * [Arduino](http://arduino.cc/)
   * [Wiring](http://wiring.org.co/)
   * [Aduino Gift Guide](http://blog.makezine.com/archive/2008/11/aduino_gift_guide.html)
   * [Arduino I2C](http://www.neufeld.newton.ks.us/electronics/?p=241)

 * AVR Projects Tutorials and Learning
   * [AVR Freaks](http://www.avrfreaks.net/)
   * [SmileyMicros](http://www.smileymicros.com/)
   * [Arduino Projects](http://www.tigoe.net/pcomp/code/category/category/arduinowiring/page/6)
   * [AVR Based Projects Collection](http://www.avrbox.com/)
   * [Amateur Radio Projects](http://sharon.esrac.ele.tue.nl/mirrors/zl1bpu/micro/index.htm)
   * [The AVR Assembler Site](http://avr-asm.tripod.com/)
   * [Newbies Guide to AVR Timers](http://www.avrfreaks.net/index.php?name=PNphpBB2&file=viewtopic&t=50106)
   * [AVR-Assembler - Tutorial](http://www.avr-asm-tutorial.net/)
   * [getting Started with AVRs](http://www.evilmadscientist.com/article.php/avrstuff)
   * [AVRsite](http://www.serasidis.gr)
   * [EDN Design Ideas](http://www.edn.com/search/SiteDesignIdeas?q=AVR&s=&t=)

 * Hardware and Programmer Solutions
   * [ELM - AVR programmer](http://elm-chan.org/works/avrx/report_e.html)
various "dongles" with schematics
   * [tuxgraphics](http://tuxgraphics.org/)
   * [avrdude](http://www.nongnu.org/avrdude/)
   * [Phidgets](http://www.phidgets.com/)

 * Video Demos
   * [YouTube Videos](http://www.youtube.com/results?search_query=avr+atmel&page=6)
   * [Microcontroller drives 20 LEDs](http://www.edn.com/article/CA6483826.html?spacedesc=designideas&industryid=44217)
   * [AVR TV](http://www.avrtv.com/)

 * Misc Microcontrollers
   * [Designing with Microcontrollers](http://instruct1.cit.cornell.edu/courses/ee476/)

 * Tutorials
   * [PWM Signal Generation by Using AVR Timers. Part II](http://extremeelectronics.co.in/avr-tutorials/pwm-signal-generation-by-using-avr-timers-part-ii/)
   * [Newbie''s Guide to AVR Timers](http://www.avrfreaks.net/index.php?name=PNphpBB2&file=viewtopic&t=50106)


### Notes

* 4/7/2015 *

Re-flashing Arduino Uno boot loader using AvrISPMkII or equivalent ($20 pololu USB works fine)

```
  $ cd arduino-1.6.3/hardware/arduino/avr/bootloaders/optiboot
  $ avrdude -p m328p -P /dev/ttyACM1 -c avrispv2 -U flash:w:optiboot_atmega328.hex
```

*12/15/2005*

Using USB programmer from [tuxgraphics.org](http://www.tuxgraphics.org)
Need to create [.avrduderc](.avrduderc.md)

```
   avrdude -p m8 -c avrusb500 -e -U flash:w:MyCode.hex

```
_'Fuses_ - enter interactive mode like this

```
   avrdude -p m8 -c avrusb500 -t

```
```
   r lfuse
   w lfuse 0 0xff
     -etc-

```
Installed avr-libc 1.4.0.  Works fine, but binutils, gcc still don''t support attiny45.

*'11/4/2005*

Programming ATTiny45.  STK200 parallel programmer no longer supported by Atmel at all!
Downloaded ''avrdude' (savannah) and it works dandy.

```
   avrdude -p attiny45 -c stk200 -U flash:w:avr_test1.hex

```
Building avr-gcc per instructions from
[this page](http://slacy.com/avr/compiler.html)
OK, but no support for ATTiny 25/45/85 or even ATTiny13 in avr-libc 1.2.5.
Seems as if we have to wait for the next release (1.4?).  _'sigh_

Summary:  use AVR studio to assemble to .hex file.  Use avrdude under linux to download.

