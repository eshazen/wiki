# Camera_Power_Supply_Board
This page documents the power supply board for the FLARE CCD camera.  It must provide the following voltages


| *'Voltage* | *Use* | *Total Current* | *Destination* | *Notes* |
| ---------- | ----- | ------ -------- | ------------- | ------- |
| -5V | Horizontal Clocks | 810mA | CCD Boards | See CCD spec p25, not clear what V should be! |
| -9V | Vertical Clocks | 105mA | CCD Boards | -8.5...-9.5 per spec |
| +12V | Vertical Clocks | 36mA | CCD Boards | +11.5...+12.5 per spec |
| +3V | Reset Gate | 30mA | CCD Boards | +2.5...+4.0 per spec |
| -3V | Reset Gate | 30mA | CCD Boards | -1.5...-3.5 per spec but diff must be <= 5V |
| +15V | CCD output amps and R(d) (12V via r-divider) | 300mA | CCD Boards | +14.5...+15.5 per spec |
| +3.3V | AD9928 supply | 300mA | CCD Boards | Should be 3.0V |
| +30V | Substrate Bias | 12mA | CCD Boards | +29...+40 per spec, shutter V(H) |
| +5.5V | Regulator Bias | 50mA | FPGA Board | |
| +3.6V | All FPGA, MGT, SFP, DDR3 | 2.5A (WAG) | FPGA Board | |
| +3.6V | TECs and Motors | 7.5A (abs max) | TEC/Motor Board | |

Current power-up and power-down sequencing must be observed.  The power input is 24V bulk from the cart.  A microcontroller provides control and monitoring, and is connected to the FPGA board by a 9600 baud asynchronous serial link.

### ECOs (Errors) in V1.0 Layout

 * Pins 11, 12 are swapped on J4, J5, J7 (power headers for CCD boards)
 * Missing pull-up resistors (10k) on I2C bus (SDA, SCL)
 * Change Pull-down to pull-up on EN_3.6V (R34).
 * Add two additional pins to 3.6V output for TEC/SMC board.  _confirm final pinout_
 * Add pull-down discharge resistor on -9V (VL). _check others_
 * Fix resistor divider for +15V (now +15.85 nom, 16V observed)  Max for AD9928 is +17.5, so maybe ok?
 * Change -3.0 to -2.0 ??


### Documents

 * [FLARE_CAMERA_POWER_SUPPLY_V1_0_update2011-09-06.pdf](http://ohm.bu.edu/~hazen/Frangioni_Public/PowerSupply/FLARE_CAMERA_POWER_SUPPLY_V1_0_update2011-09-06.pdf)
 * [Flare_Camera_Power_Supply_V1_0-fab.zip](http://ohm.bu.edu/~hazen/Frangioni_Public/PowerSupply/Flare_Camera_Power_Supply_V1_0-fab.zip)
 * [Flare_Camera_Power_Supply_V1_0-des.zip](http://ohm.bu.edu/~hazen/Frangioni_Public/PowerSupply/Flare_Camera_Power_Supply_V1_0-des.zip)
 * [FLARE_CAMERA_POWER_SUPPLY_V1_0.xlsx](http://ohm.bu.edu/~hazen/Frangioni_Public/PowerSupply/FLARE_CAMERA_POWER_SUPPLY_V1_0.xlsx)
[FLARE_CAMERA_POWER_SUPPLY_V1_0.csv](http://ohm.bu.edu/~hazen/Frangioni_Public/PowerSupply/FLARE_CAMERA_POWER_SUPPLY_V1_0.csv)
 * [FLARECameraPowerSupplyController.pdf](http://joule.bu.edu/~hazen/Frangioni_Public/PowerSupply/FLARECameraPowerSupplyController.pdf)

