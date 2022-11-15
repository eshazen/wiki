# Atlas5DTablet

This page contains documentation for the proposed tablet for the [ATLAS5D](http://www.atlas5d.com/) prototype tablet device.
See evolving [Specification](https://docs.google.com/document/d/1b43igQVFTdWdQHGKnRcD161T92od-ipqRbw3zeefu7w/edit?usp=sharing) document and [Block Diagram](https://docs.google.com/drawings/d/1Xu-cbdiB2Ku4xvbwKEMbFYBb1MKZ_Yj9cJlHjrosKFQ/edit?usp=sharing).

## Suggested Parts


 * [LTC4110](http://www.linear.com/product/LTC4110) backup battery manager
   * [DC1259A](http://www.digikey.com/product-search/en?mpart=DC1259A&vendor=855) Evaluation board
   * http://www.inspired-energy.com/ -- a possible battery pack supplier, e.g. PH2054 pack
   * [LTC4100](http://www.linear.com/product/LTC4100) smart battery charger controller (alternative part, full smart-battery compatible charger)
 * [ADXL345](http://www.analog.com/en/mems-sensors/mems-inertial-sensors/adxl345/products/product.html) digital 3-axis accelerometer
   * [ADXL345 Breakout](https://www.sparkfun.com/products/9836) board from !SparkFun
   * [ADXL345 Evaluation](https://www.sparkfun.com/products/9814) board from !SparkFun with MCU and SD card
 * [CY7C65642](http://www.cypress.com/?mpn=CY7C65642-48AXCT) 4-port USB hub
   * [CY4607M](http://www.cypress.com/?rID=62897) Eval board with CY7C65642 (48TQFP package)
   * [CY4608M](http://www.cypress.com/?rID=62899) Eval board with CY7C65642 (28QFM package)
   * [AN72332](http://www.cypress.com/?rID=54780) -- Guidelines on System Design using Cypress's USB 2.0 Hub (HX2VL)
 * [TPS542951](http://www.ti.com/product/tps542951) dual-output 2A/3A buck regulator
   * [TPS542951EVM](https://store.ti.com/TPS542951EVM-057-TPS542951-Evaluation-Module-P3132.aspx) Evaluation Module
 * [FT232R](http://www.ftdichip.com/Products/ICs/FT232R.htm) USB UART (USB/serial interface)
   * [FT232RL Breakout](https://www.sparkfun.com/products/718) board from !Sparkfun
   * [FTDI's Android Support Page](http://www.ftdichip.com/Android.htm)
   * [FTDI Tech Note:](http://www.ftdichip.com/Support/Documents/TechnicalNotes/TN_134_FTDI_Android_D2XX_Driver.pdf) Add Support for FTDI devices to an Android OS
   * [AN232R-01](http://www.ftdichip.com/Support/Documents/AppNotes/AN_232R-01_Bit_Bang_Mode_Available_For_FT232R_and_Ft245R.pdf): Bit Bang Modes for the FT232R and FT245R

Note that the FT232H is a better chip for e.g. SPI or I2C interfacing, but Android support is currently an unknown quantity.
