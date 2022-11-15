# TRM_Interface
Up to [TrackerReadoutModule](TrackerReadoutModule.md)


Two computer interfaces are envisioned.

## USB Interface

The Phase I interface will be
based on a USB emulated serial port.  A USB-to-serial converter chip
is provided on the Nexys 3 development board, which converts the USB
protocol into the standard asynchronous serial protocol described
[here](http://en.wikipedia.org/wiki/Asynchronous_serial_communication)

A device called a [UART](http://en.wikipedia.org/wiki/UART)
convert asynchronous serial data into a stream of bytes which can
be interpreted by logic in the FPGA.  The UART functions are available
in the following archives from Xilinx (edf username and password).

 * [KCPSM6 archive](http://ohm.bu.edu/%7Ehazen/DataSheets/Xilinx/KCPSM6_Release5_30Sept12.zip)
 * [Documentation](http://ohm.bu.edu/%7Ehazen/DataSheets/Xilinx/UART6_User_Guide_30Sept12.pdf)



## Ethernet Interface

