# Amc13BackplaneTester
## AMC13 Bench Test Fixture

This page describes a small bench-top test board used for initial power-up and
backplane loop-back testing on AMC13 modules.  This board provides power (3.3V and 12V)
plus loop-back connections on Fabric A and Fabric B.  In addition the CLK1 signals are
brought out to resistors where they can be checked with an oscilloscope.

 * SVN:  http://edf.bu.edu/svn/edf/AMC13/AMC13_test_breakout/
 * [Design Files](http://ohm.bu.edu/~hazen/CMS/AMC_BREAKOUT/) for Rev 1 and Rev 2
 * [AMC13_test_breakout_3](http://ohm.bu.edu/~aguld/AMC13_test_breakout3/) -- Rev 3 design files

Considering a 100+ qty build for FC7 gadgets for tracker in 2019

 * ExpressPCB prices (5 day, ground) 100 @ $672.24, 150 @ $896.12, 200 @ $1120.13
   * Shrink PCB for FPD profile 2 (3.8x2.2) 150 @ $680.33

Proposed power supplies for 12V from AC and 3.3V from 12V:

 * [12V Supply](http://www.digikey.com/product-search/en?vendor=0&keywords=ETSA120500UC-P5P-SZ)
 * [3.3V Converter](http://www.digikey.com/product-detail/en/R-78E3.3-0.5/945-1661-5-ND/3593412)

Changes from Rev 1 to Re 2:

 * Tie J1-41 (ENABLE#) to GND.  Required to power up AMC13. *OMITTED* by accident from Rev 2 layout
 * Provide a convenient scope GND point for clock testing - done
 * Add a header for CLK testing - done
 * Add some sort of computer interface - just a SIP header for Ethernet for now

Changes for Rev 3:

 * Add Ethernet SFP connection

Reference info:

 * [FTLF1318P3BTL](http://www.finisar.com/sites/default/files/pdf/FTLF1318P3BTL%20Spec%20RevA4.pdf) -- GbE fiber SFP
 * [ftp://ftp.seagate.com/sff/INF-8074.PDF SFP MSA spec v1.0]
 * [ftp://ftp.seagate.com/sff/SFF-8431.PDF SFP MSA spec v4.1]
 * TTT board schematics:  [PDF](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget_sch.pdf) / [SCH](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget.sch)
 * [CMS_TTC_TTS_Gadget_BOM.pdf](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_TTC_TTS_Gadget_BOM.pdf) -- parts list for TTT board
 * TTT board layout: [PDF](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget_pcb.pdf) / [PCB](http://ohm.bu.edu/~cwoodall/TTT/hardware/archive/rev/b/CMS_Gadget_bot.pcb)
 * [MCH Pinout](http://ohm.bu.edu/~hazen/CMS/MCH_pinout.pdf) / [AMC Pinout](http://ohm.bu.edu/~hazen/CMS/AMC_Pinout.pdf)


