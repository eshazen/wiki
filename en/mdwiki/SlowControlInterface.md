# SlowControlInterface
This page documents the "slow control" interface for the G-2 tracker electronics.
This interface is an optically-isolated serial interface which is used for control,
monitoring and firmware downloads.

### Interface

Connector is RJ-45 with the following pinout:

```
1 - TX-  or DATA-
2 - TX+  or DATA-
3 - RX-  or N.C.   (used for full-duplex option)
4 - N.C.
5 - N.C.
6 - RX-  or N.C.   (used for full-duplex option)
7 - +5V  (supplied by TRM)
8 - GND
```

Proposed commercial fanout/interface:  [USB2-H-50016-M](http://www.easysync-ltd.com/product/641/usb2-h-5016-m.html)




### Firmware Download

The tracker electronics located on the G-2 detector contain several devices with
firmware which may be updated remotely:

 * Xilinx FPGA on the logic board (via SPI flash)
 * Altera FPGAs on the TDC boards (via JTAG)
 * Atmel AVR microcontroller on the logic board (via boot loader)

We will need to discuss which device (Xilinx FPGA or AVR) provides the primary
serial interface to the host computer.

The Xilinx FPGA flash programming solution already exists in the form of a design
by Dan which allows flash downloading over a serial port.

The best software option for running on an embedded processor seems to be
the Altera JRunner tool.

 * Block Diagram (evolving) of slow control interface [ODG](http://edf.bu.edu/svn/edf/G-2/NewElectronics/Docs/SlowControlInterfaceBlockDiagram.odg) (open/libre office source)
 * [JTAG](http://en.wikipedia.org/wiki/Joint_Test_Action_Group) (Wikipedia)
 * [Altera JTAG Configuration](http://www.altera.com/support/devices/configuration/schemes/jtag/cfg-jtag.html)
   * [JRunner downloads](https://www.altera.com/download/legacy/jrunner/dnl-jrunner.html)
   * [AN414](http://www.altera.com/literature/an/an414.pdf) describing JRunner
