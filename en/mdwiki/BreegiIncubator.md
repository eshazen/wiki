# BreegiIncubator
This is a project to develop an inexpensive, portable incubator for infants.
An existing prototype has been developed using an ATMega328 microcontroller.

Documents:
 * [Google Doc](https://docs.google.com/document/d/1sFPGkz4w-PntlV5wjet0o_1TvfJrcIYcQn7ly9af23I/edit?usp=sharing) with my list of updates
 * [powerpoint](http://gauss.bu.edu/svn/breegi-incubator/phase-2-docs/NICI%20Phase%202%20-%20Design%20Requirement.pdf) with phase 2 summary

Current working proposal is to use an inexpensive SoM such as the [Neo](https://www.udoo.org/docs-neo/Introduction/Introduction.htmlUdoo).  This is a dual-core (ARM cortex M4 and A9) processor with two sets of Arduino-like I/O pins.  It would be mounted on an interface board (face down, likely).  The interface board would contain all necessary electronics.

Here is an approximate inventory for I/O required (see [spreadsheet](http://gauss.bu.edu/svn/breegi-incubator/phase-2-docs/phase-2-ports.ods)):

 * Touchscreen
 * Video (HDMI)
 * USB
 * UART
 * ~4 GPIO
 * ~8 PWM (some high power)
 * ~4 I2C
 * ~8 unknown sensors (probably I2C)
 * 2-3 SPI
 * ~8 temperature sensors
 * ~4 ADC inputs (power supply and battery voltages)

Some observations:

 * Essentially everything

## SoM options (theirs)

 * Fury-X [data](https://www.inhand.com/products-services/boards/fury-x/) ixMX 6SoloX ARM
 * Nit6 SoloX [data](https://boundarydevices.com/nit6_solox-freescale-i-mx6-solox-based-single-board-computer/)
 * Colobri eval board [data](https://www.toradex.com/computer-on-modules/colibri-arm-family/nxp-freescale-imx6#carrier_boards)
 * Udoo Neo full [data](https://shop.udoo.org/udoo-neo-full.html)
   * https://www.udoo.org/docs-neo/Introduction/Introduction.html

## SoM options (mine)

 * https://www.solid-run.com/nxp-family/imx8-som/#overview
 * https://www.emcraft.com/products/685
 * https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-imx-8
 * https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-freescale-imx-6
 * https://www.variscite.com/product/system-on-module-som/cortex-a72/var-som-mx8-nxp-freescale-i-mx8
 * https://www.phytec.com/product/phycore-imx8/
 * https://www.compulab.com/products/computer-on-modules/cl-som-imx8-nxp-i-mx-8-system-on-module-computer/
 * https://www.advantech.com/products/computer-on-module/rom-7720/mod_efa49d1d-5da2-4fc3-bb85-7621a8168055
 * https://boundarydevices.com/product/nitrogen8m-som/
