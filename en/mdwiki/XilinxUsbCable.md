# XilinxUsbCable
*2021-05-24*

Clone "platform cable USB" bought on Amazon.  Running Ubuntu 18.04.  Installed driver using:

```
  $ cd /usr1//Xilinx/Vivado/2020.2/data/xicom/cable_drivers/lin64/install_script/install_drivers
  $ sudo ./install_drivers
INFO: Installing cable drivers.
INFO: Script name = ./install_drivers
INFO: HostName = hertz
INFO: Current working dir = /usr1/Xilinx/Vivado/2020.2/data/xicom/cable_drivers/lin64/install_script/install_drivers
INFO: Kernel version = 4.15.0-101-generic.
INFO: Arch = x86_64.
USB udev file exists and will not be updated.
--File /etc/udev/rules.d/52-xilinx-ftdi-usb.rules exists.
--File 52-xilinx-ftdi-usb.rules exists.
--File 52-xilinx-ftdi-usb.rules version = 0001
--File 52-xilinx-ftdi-usb.rules is newer than the destination file.
--Updating rules file.
--File /etc/udev/rules.d/52-xilinx-pcusb.rules exists.
--File /etc/udev/rules.d/52-xilinx-pcusb.rules version = 0002
--File 52-xilinx-pcusb.rules exists.
--File 52-xilinx-pcusb.rules version = 0002
--File 52-xilinx-pcusb.rules is already updated.

INFO: Digilent Return code = 0
INFO: Xilinx Return code = 0
INFO: Xilinx FTDI Return code = 0
INFO: Return code = 0
INFO: Driver installation successful.
CRITICAL WARNING: Cable(s) on the system must be unplugged then plugged back in order for the driver scripts to update the cables.
```

Now the Vivado 2020.2 hardware manager can see the device.


*2017*

I was able to get the Digilent USB-JTAG Programming Cable (rubber box model) working with ISE 14.7 under Ubuntu 14.04 using these instructions:

 * [xilinx_jtag_linux](https://www.george-smart.co.uk/fpga/xilinx_jtag_linux/)

