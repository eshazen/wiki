# PicoZedLinux2019

### Finding Stuff

 * http://zedboard.org/support/design
   * Download BSP for Vivado 2018.2 here
 * http://zynqhowto.blogspot.com/

*2019-04-12*

Looking to port Dan's zybo package to zedboard. Edited only `top.xdc`:

```
#-- Zedboard
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {LEDs[0]}]
set_property -dict {PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports {LEDs[1]}]
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {LEDs[2]}]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {LEDs[3]}]

# NOTE:  Zedboard clock is 100MHz
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports clk_in]
create_clock -period 10.000 -name clk_in -add [get_ports clk_in]
```

Now we have to change the chip from XC7Z010CLG400-1 to XC7Z020CLG484.  Hmm.



*2019-03-28*

Petalinux 2018.2 doesn't really work under Ubuntu 2018.4.  Heading off to VM-land.
Already have a 2016.4 VM.  Installing Vivado... no special requirements.
Next, Petalinux, following:

 * https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_2/ug1144-petalinux-tools-reference-guide.pdf

First, install the prerequisites using [petalinux_prerequisites.sh](http://gauss.bu.edu/svn/zynq-utilities/Installation/2018.2/petalinux_prerequisites.sh)

Then:

```
  $ mkdir /opt/petalinux/2018.2
  $ chown -R hazen /opt/petalinux
  $ ./petalinux-v2018.2-final-installer.run /opt/petalinux/2018.2
INFO: Checking installer checksum...
INFO: Extracting PetaLinux installer...
INFO: Checking installation environment requirements...
INFO: Installing PetaLinux...
INFO: Checking PetaLinux installer integrity...
INFO: Installing PetaLinux SDK to "/opt/petalinux/2018.2/."
INFO: Installing aarch64 Yocto SDK to "/opt/petalinux/2018.2/./components/yocto/source/aarch64"...
INFO: Installing arm Yocto SDK to "/opt/petalinux/2018.2/./components/yocto/source/arm"...
INFO: Installing microblaze_full Yocto SDK to "/opt/petalinux/2018.2/./components/yocto/source/microblaze_full"...
INFO: Installing microblaze_lite Yocto SDK to "/opt/petalinux/2018.2/./components/yocto/source/microblaze_lite"...
INFO: PetaLinux SDK has been installed to /opt/petalinux/2018.2/.
```

A few other things.  The shell must be `bash`, not `dash`.
```
  $ sudo rm /bin/sh
  $ sudo ln -s /bin/bash /bin/sh
```

Now give it a try:
```
  $ petalinux-create -t project -s ./xilinx-zc702-v2018.2-final.bsp
INFO: Create project:
INFO: Projects:
INFO: 	* xilinx-zc702-2018.2
INFO: has been successfully installed to /home/hazen/Petalinux/
INFO: New project successfully created in /home/hazen/Petalinux/
```

*2019-03-20*

Looking into UIO drivers for Linux.  See these threads:

 * https://www.osadl.org/fileadmin/dam/rtlws/12/Koch.pdf -- Very useful intro to UIO drivers
 * http://fpga.org/2013/05/28/how-to-design-and-access-a-memory-mapped-device-part-one/
 * https://forum.digilentinc.com/topic/16550-uio-access-including-interrupts-when-using-petalinux/#comment-40229
 * https://forums.xilinx.com/t5/Embedded-Linux/Petalinux-2017-2-no-UIO-devices-found/td-p/802250
 * http://painlessdev.blogspot.com/2017/12/petalinux-from-scratch-using-xilinx_19.html
 * http://microzedchronicles.com/

Hopefully this is documented better somewhere... looking

Looking to start now with Petalinux again.  2018.3 tools installed at /usr1 but don't work with multiple monitors (go figure!).  Installing petalinux 2018.2 at /usr1/petalinux.


*2019-03-19*

 * Following [UG1165](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_2/ug1165-zynq-embedded-design-tutorial.pdf) to create a minimal design

In Vivado:

 * Create a design based on the FMC Carrier with Picozed 7020
 * Connected "FCLK_CLK0" to "M_AXI_GP0_ACLK".
 * Ran synthesis, implementation, build bitstream

In SDK:

 * Create a "hello world" project per UG1165.
 * In "platform_config.h" change UART_DEVICE_ID to 1 and build (_this may not be needed_)
 * Add xilffs library to BSP:
   * Double click system.mss and "Modify this BSP's Settings"
   * Find and enable xilffs library
 * Create a new Application Project "eric_fsbl" referencing the existing BSP
 * In "hello_world" project right click "Create boot image".  Should be 3 partitions in boot image:
   * eric_fsbl.elf (from FSBL project)
   * design_1_wrapper.bit (from hardware design, bitfile)
   * hello_world.elf
   * This creates a *BOOT.bin* file
 * See [MakingBootableCard](MakingBootableCard.md) and copy to FAT partition

Managed to make a blinking LED on GPIO!

In Vivado:

 * added an AXI GPIO
 * set output width to 2
 * figured out that the pins are named "gpio_rtl_tri_o[1:0]"
 * added a constraint file:

```
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS25 } [get_ports {gpio_rtl_tri_o[0]} ]
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS25 } [get_ports {gpio_rtl_tri_o[1]} ]
```

 * Generated a new bitfile
 * Did File->Export->Export Hardware
   * (SDK automatically picked up the change)

In SDK:

Added this stuff to the program (excerpt key parts only):

```
#define LED 0x01   /* Assumes bit 0 of GPIO is connected to an LED  */
#define GPIO_EXAMPLE_DEVICE_ID  XPAR_GPIO_0_DEVICE_ID
#define LED_DELAY     10000000
#define LED_CHANNEL 1
XGpio Gpio; /* The Instance of the GPIO Driver */
  ...
main() {
  int Status;
  volatile int Delay;
  XGpio_Initialize(&Gpio, GPIO_EXAMPLE_DEVICE_ID);
  XGpio_SetDataDirection(&Gpio, LED_CHANNEL, ~LED);

  while (1) {
    XGpio_DiscreteWrite(&Gpio, LED_CHANNEL, LED);
    for (Delay = 0; Delay < LED_DELAY; Delay++);
    XGpio_DiscreteClear(&Gpio, LED_CHANNEL, LED);
    for (Delay = 0; Delay < LED_DELAY; Delay++);
  }
}
```

Re-build all, make new boot image.  It works!

Next step, user IP in VHDL.

Trying to follow this rather out-of-date tutorial:

http://www.fpgadeveloper.com/2014/08/creating-a-custom-ip-block-in-vivado.html

It seems to work.  Haven't actually tried running the code
