# QuadPluserMainBoardNotes
## Quad Pulser Main Board

Nav: [QuadPulser](QuadPulser.md)

The main board will need the following major components:

 * (4) 8-channel ADC FMC boards
 * (1) or possibly (2) control FMC boards
 * (3) Enclustra Mars [MX3](http://download.enclustra.com/public_files/FPGA_Modules/Mars_AX3/Mars_AX3_User_Manual_V03.pdf) FPGA modules.  One per 2 ADC boards, 1 for control
 * (1) RJ-45 "magjack" type Ethernet connector per MX3 module
 * Power supply input connector and voltage regulators as needed

It should fit in an enclosure like [this one](https://www.hammfg.com/dci/products/accessories/rm) from Hammond
(I was thinking of the 3.5 x 16.6 x 13 or 18 inch size)

### Reference

 * [DDR2 SODIMM socket](https://www.digikey.com/product-detail/en/amphenol-fci/10033853-052FSLF/609-1006-ND/1001321) -- use one like this for the Enclustra MX3 modules

### AX3 Wiring

 * See [Pin connection guidelines](http://download.enclustra.com/public_files/Design_Guidelines/Module_Pin_Connection_Guidelines.pdf) document.  Note that this is a generic document which is not necessarily specific to the AX3
 * See [AX3_pinout.xlsx](http://ohm.bu.edu/~hazen/G-2/QuadLogic/AX3_pinout.xlsx) pinout of the AX3 module
 * Power:
   * Can power with single 3.3V input to VCC_MOD and VCC_3V3 (see section 2.10.3 of the manual)
   * VCC_IO:  can all be 2.5V?  Need to think about this
     * Must be powered only when PWR_GOOD and PWR_EN are active.  See p17 of the [manual](http://download.enclustra.com/public_files/FPGA_Modules/Mars_AX3/Mars_AX3_User_Manual_V03.pdf)


| *Name* | *Description* |
| ------ | ------------- |
| PCLK_P/N | External clock, probably from G-2 experiment.  Need a clock fanout chip to drive all 3 AX3 modules |
| IO_P/N | User I/Os.  Most will be differential pairs routed from FMC connectors |
| MGT_xxx | N/C |
| JTAG_xxx | Route to 14 pin JTAG header (see p15 of [DS593](https://www.xilinx.com/support/documentation/data_sheets/ds593.pdf)) |
| I2C_xxx | N/C |
| FLASH_xxx | N/C |
| BOOT_MODE | Removable jumper to GND |
| (other config pins) | N/C |
| USB_xxx | N/C |
| ETHx_xxx | Ethernet:  connect to magjack |
| VCC_MOD, VCC_3V3 | 3.3V power |
| VCC_IO | 2.5V or 3.3V ? |
| PWR_GOOD | Use to enable VCC_IO regulator |

*Ethernet*

See page 8 of the [PM3 Schematic](http://download.enclustra.com/public_files/Base_Boards/Mars_PM3/Mars_PM3-R5_User_Schematics_R5-1.pdf).  Use a Magjack like the ARJ-148 (Digikey).  I think only 0.1uF capacitors to GND on each center-tap pin are needed, not the MOSFET circuit on the PM3 board.

