# BuTestCM
# APOLLO Command Module Test Article

This board is a Command Module compatible with the Apollo ATCA blade family (http://apollo-blade.info).  The Rev A board is primarily intended to validate the mechanical design and provide a platform for testing production service modules.  It has the following features:

 * Standard CM mechanics with two sets of high/low speed mating connectors and mounting holes
 * Loop-back of all high-speed serial links
 * Header connector access to all low-speed signals
 * High-current screw-type terminal access to 12V and GND

Rev A Board submitted to JLC and received 3/21/22.

Rev B board and Mezzanine submitted to JLC 4/27/22

## Links

 * Git: https://gitlab.com/BU-EDF/edf-projects/apollocm/templatecm (hardware)
   * AVR code: https://gitlab.com/BU-EDF/edf-projects/apollocm/templatecm/-/tree/develop/AVR_Code
 * [TestCmCodeNotes](TestCmCodeNotes.md) -- development/debug notes for uC code

## Rev B changes

 * Place header connectors on grid (0.1")
 * Change connectors from 2x20 to 2x25 to account for extra power pins.
 * Mounting holes:
   * Add front panel mounting hardware points (maybe reproduce Charlie's scheme using right-angle bus connectors?)
   * Correct splice plate mounting hole sizes
   * Add mounting holes for mezzanine board
 * Replace 3.3V regulator with a larger one to support mezzanine boards
 * Add 5V regulator if needed by mezzanine boards
 * Add 12V, 3.3V (and 5V?) pins to mezzanine connectors

## Low-speed connector pinout

Dir -> "In" means input to SM from CM

```
| Pin | Signal     | Dir | Notes                        |
|-----+------------+-----+------------------------------|
| A1  | PWR_GOOD   | In  | 3.3V CPLD                    |
| A2  | TMS        | Out | 30R series from 3.3V CPLD    |
| A3  | TDO        | Out | 3.3V CPLD                    |
| A4  | TX_IPMC    | Out | 3.3V TRST from UART Mux      |
| A5  | TX_ZYNQ    | Out | 3.3V Zynq                    |
| A6  | SENSE_SDA  | I/O | 4k7 pullup to 3.3V / I2C     |
| A7  | PWR_EN     | Out | 3.3V Zynq                    |
| A8  | GPIO0      | ?   | 3.3V Zynq                    |
|-----+------------+-----+------------------------------|
| B1  | GND/GPIO1  |     |                              |
| B2  | GND        |     |                              |
| B3  | GND        |     |                              |
| B4  | GND/GPIO2  |     |                              |
| B5  | GND        |     |                              |
| B6  | GND/GPIOC0 |     |                              |
| B7  | GND        |     |                              |
| B8  | GND/GPIOC1 |     |                              |
|-----+------------+-----+------------------------------|
| C1  | EN         | Out | 1k to GND on SM, 3.3V Zynq   |
| C2  | TCK        | Out | 30R series from 3.3V CPLD    |
| C3  | TDI        | In  | 30R series from 3.3V CPLD    |
| C4  | RX_IPMC    | In  | 4k7 pullup 3.3V, to UART Mux |
| C5  | RX_ZYNQ    |     | 4k7 pullup 3.3V, to UART Mux |
| C6  | SENSE_SCL  |     | 4k7 pullup to 3.3V / I2C     |
| C7  | MON_RX     | In  | 3.3V Zynq                    |
| C8  | PS_RST     | ?   | 10k pullup 3.3V, 3.3V CPLD   |
|-----+------------+-----+------------------------------|
```

Also we have a bunch of these Trenz modules: [TE0714](https://shop.trenz-electronic.de/en/TE0714-03-50-2IAC6-FPGA-Module-with-Xilinx-Artix-7-XC7A50T-2CSG325I-1.8V-Configuration-4-x-3-cm) which belong to Ed.  They can support up to 6.25 Gbps.

<img src="http://gauss.bu.edu/svn/common-atca-blade/Meetings/2019-09-03_TWEPP/figs/mech_in_crate.jpg" width="200">

## Useful Links

 * [APOLLO_MECH%20Model%20(1).pdf](http://gauss.bu.edu/svn/common-atca-blade.hardware/Blade/trunk/mech/APOLLO_MECH%20Model%20(1).pdf) - mechanical drawing ([DXF file](http://gauss.bu.edu/svn/common-atca-blade.hardware/Blade/trunk/mech/APOLLO_MECH.DXF))
 * [Cornell_6089-103-RevB_PCB_FAB_28Feb2019.zip](https://github.com/apollo-lhc/Cornell_CM_Rev1_HW/blob/master/Orcad/Allegro/Cornell_6089-103-RevB_PCB_FAB_28Feb2019.zip) - Gerber files for Cornell Rev 1 board
 * [TWEPP 2019](http://gauss.bu.edu/svn/common-atca-blade/Meetings/2019-09-03_TWEPP/APOLLO-Hazen.pdf) talk by Eric


