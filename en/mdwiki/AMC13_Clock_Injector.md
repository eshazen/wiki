# AMC13_Clock_Injector
NOTE:  THIS BOARD IS LARGELY OBSOLETE.

 As of AMC13XG firmware version 0x2257, please note the following change:

 "The TTS output clock frequency in loop back mode is now 160.31MHz and
 very close to four times that of the actual TTC clock. The output of TTS in
 loop back mode is not an 80MHz clock any more, but a true TTC stream with !BcntRes"

This is a small board which converts an electrical clock signal into an optical clock signal for use in AMC13 test stands.  The PCB layout was done with ExpressPCB.

The board accommodates a SiLabs Si590 programmable oscillator, with the nominal frequency chosen as 80.160 MHz (LHC nom. 40.08 MHz * 2).  A jumper option allows an external clock to be input.

Requires 5V power from micro-USB (e.g. any phone charger or computer).

*Assembly notes:*
 * LEDs must be installed with longer lead in round pad
 * Be sure to install 2 inductors and 4 capacitors on the bottom (see [notes](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Back_Place_V2.pdf)).

### PCB Design -- Latest (Rev 3)

 * [User Notes](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/UserNotes.pdf)
 * PCB Layout: [PCB](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V3.pcb) [PDF](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V3_pcb.pdf) (very small changes to improve solderablility in V3)
   * Note: design file was not updated until 3/29/16 for V3
 * Parts List: [XLS](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V2_BOM.xls) (about US$30 per board for parts)
 * Back side parts placement: [PDF](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Back_Place_V2.pdf)
 * [DigiKey Invoice](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/INVOICE_EMAIL51317807.pdf) from last parts order
 * 3-D printable box for the PCB: [top](http://ohm.bu.edu/~collinsz/amc13_clock_injector_top_v2.stl) [bottom](http://ohm.bu.edu/~collinsz/amc13_clock_injector_bot_v2.stl)

### PCB Design (Rev 2)

 * Schematic:  [SCH](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V2.sch) [PDF](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V2_sch.pdf)
 * PCB Layout: [PCB](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V2.pcb) [PDF](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V2_pcb.pdf)
 * Parts List: [XLS](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V2_BOM.xls) (about US$30 per board for parts)
 * Back side parts placement: [PDF](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Back_Place_V2.pdf)

### PCB Design (Rev 1)

 * Schematic:  [SCH](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V1.sch) / [PDF](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/clock_injector_sch.pdf)
 * PCB Layout: [PCB](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V1.pcb) / [PDF](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/clock_injector_pcb.pdf)
 * Parts List: [XLS](http://ohm.bu.edu/~hazen/CMS/AMC13/Clock_Injector/Clock_Injector_V1_BOM.xls)

### ECOs (fixed in v2)

 * pin 1 of JP1 not connected
 * pin 14 of U2 not connected
 * left end of C9 spuriously connected to 3.3V
 * U2-15 and U2-17 must be tied to GND
