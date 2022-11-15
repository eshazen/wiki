# TrackerReadoutModule
This page describes an electronics module which will provide a computer interface for power
management, clock, controls and readout of the G-2 traceback tracker.

## 2013 Prototype

The prototype is built on a [Diglent Nexys 3](http://www.digilentinc.com/nexys3)
A simple interface communicates with the TDC board using the C5 protocol described in
the paper linked below.

The TRM logic may be logically partitioned into 3 separate blocks described below.

 * [TRM_C5_Encoding](TRM_C5_Encoding.md)
 * [TRM_8b10_Decoding](TRM_8b10_Decoding.md)
 * [TRM_Interface](TRM_Interface.md)

Clocks required, generated from 100MHz oscillator using 2 DCMs:

 * 40MHz for C5 encoder
 * 125MHz for 8b10b recovery (25MHz * N (where n=5/6/7 or so)

A temporary USB computer interface is provided.

 * [Google Document](https://docs.google.com/document/d/1IGZqD2rKQFlQ4Jv8SmbXRmuNURDFEiVixDCB6grOYzA/edit?usp=sharing)

Nexys 3 programming on Linux:

 * Download Adept runtime and utilities from digilent web page
   * Uncompress both
   * Find "ftdi_drivers" folder and run the install.sh script using sudo
   * Go up to the runtime directory and run install.sh script using sudo
   * Go to the utilities directory and run install.sh script using sudo
   * (just take the defaults for all the questions)

Programming incantation:

```
  djtgcfg -d Nexys3 -i 0 prog -f ~/ISE/G-2/CDRTest/top.bit

```



## Resources

 * [UART6_User_Guide_30Sept12.pdf](http://ohm.bu.edu/%7Ehazen/DataSheets/Xilinx/UART6_User_Guide_30Sept12.pdf)
 * [KCPSM6_Release5_30Sept12.zip](http://ohm.bu.edu/%7Ehazen/DataSheets/Xilinx/KCPSM6_Release5_30Sept12.zip)
 * [Blind Oversampling Data Recovery](http://ohm.bu.edu/~hazen/Papers/blind_oversampling_CDR.pdf)
 * [OpenCores 8b10b Encoder/Decoder](http://opencores.org/project,8b10b_encdec)
 * [Xilinx XAPP1112](http://www.xilinx.com/support/documentation/application_notes/xapp1112.pdf)
 * [CACTUS](https://svnweb.cern.ch/trac/cactus/wiki)
 * [g-2TDC.pdf](http://ohm.bu.edu/~hazen/G-2/g-2TDC.pdf)
 * [C5_IEEE.doc](http://www-ppd.fnal.gov/eedoffice-w/projects/ckm/comadc/C5_IEEE.doc)
proposed for use in TDC clock/readout
 * [Talk on Programmable Logic](http://ohm.bu.edu/~hazen/NEPPSR2005/Trigger_Electronics_Hazen_part2.pdf)



