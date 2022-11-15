# G2Wfd

# June 2014 Prototype Review

 * [gm2_wfd5_140529.pdf](http://ohm.bu.edu/~hazen/G-2/Wfd2014/gm2_wfd5_140529.pdf) -- PDF draft schematic of 5/29/14.  See also [Eric's Notes](http://ohm.bu.edu/~hazen/G-2/Wfd2014/Check_WFD5.pdf) from initial check of backplane connections.
 * [gm2_wfd5_140603.pdf](http://ohm.bu.edu/~hazen/G-2/Wfd2014/gm2_wfd5_140603.pdf) -- PDF draft schematic 6/3/14.  See also [Nate's Notes](http://ohm.bu.edu/~hazen/G-2/Wfd2014/notes_2014-06-03.txt)
 * [gm2_wfd5_140605.pdf](http://ohm.bu.edu/~hazen/G-2/Wfd2014/gm2_wfd5_140605.pdf) -- PDF draft schematic 6/5/14.  See also [Nate's Notes](http://ohm.bu.edu/~hazen/G-2/Wfd2014/notes_2014-06-05.txt)
 * [gm2_wfd5_140607.pdf](http://ohm.bu.edu/~hazen/G-2/Wfd2014/gm2_wfd5_140607.pdf) -- PDF draft schematic 6/7/14.

# Reference Information

 * [AMC 2.0 Spec](http://joule.bu.edu/~hazen/edf_joule/PICMG/AMC%5b1%5d.0_Spec_R2.0_2006-11-15.pdf) (password, DO NOT DISTRIBUTE)
 * [MTCA.0 R.10 Spec](http://joule.bu.edu/~hazen/edf_joule/PICMG/PICMG_MTCA.0_R1.0.pdf) (password, DO NOT DISTRIBUTE)
 * [AMC Pinout](http://joule.bu.edu/~hazen/edf_joule/PICMG/AMC_Pinout.pdf)
 * [MCH Pinout](http://joule.bu.edu/~hazen/edf_joule/PICMG/MCH_pinout.pdf)

# Design Comments

 * Maybe more bypass caps on DDR3 VREFs.  See AMC13XG T1 schematic: [T1.PDF](http://physics.bu.edu/~wusx/download/AMC13XG/T1.PDF) (page 4) for a known working design.
 * Is a resistor divider sufficiently low impedance for DDR3 VREFs?  Might consider a switching regulator like the TPS51116RGER (page 7 of AMC13 schematic).
 * Recommend GND on debug headers
 * I notice that the MMC is not wired to the FPGA in the way we have done it (we have an SPI bus used for configuration R/W from the MMC to the FPGA).  Therefore I'm assuming you have forked the MMC code and are taking care of all the pin assignments yourself.
