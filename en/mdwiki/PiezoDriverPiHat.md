# PiezoDriverPiHat
Up: [MRI_Stimulator](MRI_Stimulator.md)

Propose to develop a simple Raspberry Pi add-on "Hat" board with 5 Piezo drivers.
The board would have (5) DRV2667 haptic driver chips.  Each is controlled by I2C.
The Pi has 2 official I2C interfaces, but probably best to just use the primary one.
An easy way to control the 5 piezos is to use an I2C switch like the TCA9548A.



 * http://www.ti.com/product/DRV2667
 * http://www.ti.com/product/TCA9548A
 * https://github.com/jonbuford/kicad-library/tree/RPi_HAT/template/raspberrrypi_hat

See the schematic on page 30 of the DRV2667 [datasheet](http://www.ti.com/lit/gpn/drv2667).
We need 5 copies of this schematic (no MSP430) with the I2C busses connected to the
ports of a TCA9548A.

Each Piezo needs a 4-pin output connector with GND, OUT-, OUT+ and BST.

BOM from existing design:


|= Ref =| =Value= | =Their P/N= | =Stock P/N= | =DigiKey= |
|- --- -| ------- | ------ ---- | ------ ---- | --------- |
| C1 | 0.1uF 250V X7R | C2012X7T2E104M125AA | CGA4J3X7T2E104K125AE | 445-8778-1-ND |
| C2 | 100uF | CL31A107MQHNNNE | C1206C107M9PACTU | 399-5620-1-ND |
| C3 | 0.1uF 16V | CL21B104MOCNBNC | yes | 1276-2452-1-ND |
| C4 | 1uF 10V | CL14A105MP5NANC | ECJ-UVB1A105M | P11984CT-ND |
| L1 | 4.7uH 1.8A 20% | LPS4018-472MR | yes | 994-LPS4018-472MRC (Mouser) |
| R1 | 768K | ERJ-2RKF7683X | yes | P768KLCT-ND |
| R2 | 13k for 150Vmax | ERJ-2RKF1302X | P13.0KLCT-ND |
| R3 | 7.87k | ERJ-2RKF7871X | YES | P7.87KLCT-ND |
| R4 | 4.7k | EXB-24V472JX | yes | Y5472CT-ND |
| U1 | | DRV2667RGPT | yes | 296-38930-1-ND |
