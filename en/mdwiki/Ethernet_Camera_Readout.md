# Ethernet_Camera_Readout
Back to [WireChamberCamera](WireChamberCamera.md)

### Firmware
 * [ccd_8_13_08.zip](http://joule.bu.edu/~hazen/AhlenCCD/ccd_8_13_08.zip)
version from Bill
 * [WuSDRAM.zip](http://joule.bu.edu/~hazen/AhlenCCD/WuSDRAM.zip)
  using SDRAM by Mr Wu
 * [ccd2_test.zip](http://joule.bu.edu/~hazen/AhlenCCD/ccd2_test.zip)
  Working example of a simple design using SiTCP.  Unfortunately a bit of a mess, as it was
  adapted from the original SiTCP example design in verilog long ago.


### Documentation
 * [ccd_4.pdf](http://joule.bu.edu/~hazen/AhlenCCD/ccd_4.pdf)
 * [SiTCP Documentation](http://joule.bu.edu/~hazen/SuperK/Ethernet/060713SK.pdf)
  out of date)
 * [SiTCP.zip](http://joule.bu.edu/~hazen/AhlenCCD/SiTCP.zip)
   of SiTCP files plus
  [E-mail from Wu](http://joule.bu.edu/~hazen/AhlenCCD/80.txt)
 * Parameters are set as follows:
   * UDP port number: 0x1234
   * TCP port number: 0x17
   * MAC address 02:00:c0:a8:00:20
   * I/P address 192.168.128.1
   * MSS 1460 (decimal)

Xilinx Spartan-3E Starter Kit board
 * [http://www.digilentinc.com/Products/Detail.cfm?Nav1=Products&Nav2=Programmable&Prod=S3EBOARD
 Documentation Page]

