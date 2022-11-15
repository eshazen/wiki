# Xilinx_Programming_Cables
A [Digilent](http://www.digilentinc.com/)
[programming cable ](http://www.digilentinc.com/Products/Catalog.cfm?Nav1=Products&Nav2=Cables&Cat=Cable)
(parallel or USB) can be used in place of a Xilinx parallel or USB
programming cable in applications where the JTAG logic power supply
is in the range of 2.8V-5V.

A [http://joule.bu.edu/~hazen/jtag_test/JTAG_dongle.jpg
small adapter] from 0.1" male single row header to 2mm 14 pin ribbon
cable connector is needed.

The pinout for the adapter is as follows.  Note that there is an alignment key
on the 2mm connector... this should be on the side with odd-numbered pins.

```
  Digilent   Signal      2mm
  pin                    pin
   1          TMS         4
   2          TDI         10
   3          TDO         8
   4          TCK         6
   5          GND         1,3
   6          Vcc         2

```
For reference, here is the
[data sheet](http://www.xilinx.com/bvdocs/publications/ds097.pdf)
for the Xilinx Parallel Cable IV.

[XILINX JTAG tools on Linux](http://rmdir.de/~michael/xilinx/)


