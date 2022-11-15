# ApolloKiraAdapter
# Kira Adapter

 * Git: https://gitlab.com/apollo-lhc/enclustra-kira-adapter
 * Xilinx: https://docs.xilinx.com/r/en-US/ug1091-carrier-card-design
*

*2022-07-14*

Open questions:

 * Ethernet ("1000-BaseFX") on GTR or GTH?
 * What clock(s) are needed to support this?
 * What about other PL clock(s)?  (none on the Kria except a PS clock)

Si5344 are unobtainable.  Best use some fixed-freq LVDS oscillators.

 * GTR refclk for Ethernet, etc.  Is a single 100MHz OK?

*2022-07-12*

Power:  Header with 5V, 3.3V 1.8V inputs.

LEDs on all supplies.

DC/DC modules are hard to source.  Probably need to use an LTM4622.

*2022-07-11*

Looking at *power*.  SM/Adapter must provide:

 * The main 5V for the SoM (DC/DC from 12V)
 * VCCO for HPIO and HDIO
   * HPIO are 1.8V
   * HDIO are 3.3V

Power-up sequence:

 * Carrier deasserts POWER_OFF_C2M_L (5V pull-up, drive with open-collector or MOSFET from ZYNQ_EN).
 * SOM asserts VCCOEN_PS_M2C
 * Carrier turns on PS peripheral power (PS MIO and PS GTR connected devices)
 * SOM asserts VCCOEN_PL_M2C
 * Carrier turns on PL power (GPIO connected devices and VCCO to SoM)

Power inputs on SOM (from pinout)

 * VCC_SOM (5.0V max 4A)
 * VCC_BATT (1.2-1.5V battery or GND)
 * VCCO_HPA (Bank 66) 1.8V max 1A
 * VCCO_HPB (Bank 65) 1.8V max 1A
 * VCCO_HPC (Bank 64) 1.8V max 1A
 * VCCO_HDA (Bank 45) 3.3V max 1A
 * VCCO_HDB (Bank 43) 3.3V max 1A
 * VCCO_HDC (Bank 44) 3.3V max 1A

On the SM we have, controlled by ZYNQ_CORE_GOOD (Merc A-12 "PWR_GOOD")

 * +3V3_Zynq (max 3A)
 * +1V8_Zynq (max 3A)

Hopefully we can just use these directly for VCCO_HPx and VCCO_HDx.
Important power-related status/control signals on Kria:

 * VCCOEN_PS_M2C - permission to power up MIO peripherals
 * VCCOEN_PL_M2C - permission to power up GPIO peripherals and VCCO
 * PWROFF_C2M_L - master power-up for SoM

Optional power-related stats signals (connect to IPMC or at least header/LEDs?)

 * PWRGD_FPT_M2C - power good for "full power domain" rails
 * PWRGD_LPD_M2C - power good for "low power domain" rails
 * PWRGD_PL_M2C - power good for all PL power rails
 * PS_ERROR_OUT_M2C - PS error indications
 * PS_ERROR_STATUS_M2C - PS error status (?)

So in the end I think we can route:

 * ZYNQ_EN to POWER_OFF_C2M_L with OC driver
 * VCCOEN_PS_M2C to PWR_GOOD

Need to check levels on VCCO_EN_PS_M2C.  On the SM this is the "Run" input to LTM4622 so should be fine (~ 1.2V threshold).

*2022-07-08*

Enclustra uses total 64 3.3V IOs while Kria has only 48 available.

Connector A:  17/64 are undefined direction (I2C, GPIO), so should be on Kria 3.3V banks.

 * 17+23 = 40 on 3.3V bank (leaving 8 unused now)
 * 24 on 1.8V bank with fixed-direction level shifters (maybe 6 NLSV4T244)

Connector B:  48 1.8V I/Os used, with 84 HP I/Os available on Kria

*Wirelist codes*

 * *3VI* - 3.3V input (carrier to module).  Use level shifter
 * *3VO* - 3.3V output (module to carrier).  Use level shifter
 * *HD* - connect to HD I/O (1.8V)

*2022-07-07*

Made a new big spreadsheet (mostly yesterday) with all the pins.

Dan says:
 * I2C for SI chips should be on the PS
 * UART for console should be on the PS
 * Other I2C and UARTs can be on the PL

UARTs are mux'd as follows:

 * "console" is either front-panel or IPMC controlled by USB_UART_EN.  Then 4-way mux as:
   * Zynq PS UART
   * Debug header J701
   * Mezz 1
   * Mezz 2

All are 3.3V.  We'll need a level shifter.

*2022-07-06*

Power for Kria is 5V but SM delivers 12V.  Need a hefty DC/DC.

Enclustra has e.g. XCZU7EV-2FBV900 (we ordered ME-XU8-7EV-2I-D1 on 3/27/20)

*2022-07-05*

Ethernet on Rev 2a:

 * ESM has 6 ports
   * SGMII 0 - front-panel RJ-45 via PHY on SM
   * SGMII 1 - not used
   * PHY 0 - Zynq port 1
   * PHY 1 - ATCA A
   * PHY 2 - ATCA B
   * PHY 3 - IPMC
 * Enclustra has 2 ports wired:
   * PHY 0 - rear mag jack
   * PHY 1 to ESM PHY 0

So on the adapter ideally there would be two PHY, but DP83867 are unobtainable (72 weeks lead time!).
If we just want to test all the GPIO etc we could operating without a PHY to the adapter for some time.
We do need Ethernet to the Kria though.  What about an SFP?

