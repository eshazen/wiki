# LaserRev2Firmware
Up to [Laser_PC_Board_Designs](Laser_PC_Board_Designs.md)

# Firmware for Rev 2 Laser/TEC system

## I2C Bus

Four-channel I2C DAC [LTC2635](http://cds.linear.com/docs/Datasheet/2635fb.pdf)
Address as follows by crate slot:

```
  Slot  I2C   Note
  000   0x20  Slot 0 - default
  001   0x24  Slot 1
  010   0x44  Slot 2
  011   0x60  Slot 3
  100   0xa4  Slot 4
  101   0xc0  Slot 5

```
I2C bus is common to all uC (and to backplane if R5, R6 on Laser/TEC board installed).

### uC Pinout

uC on Laser/TEC is [ATMEGA164A](http://www.atmel.com/Images/doc8272.pdf)

ADC reference should be external (REFS1=REFS0=0)


|*'Pin* | *Func* | *Name* | *Note* |
|------ | ------ | ------ | ------ |
|PA0/ADC0 | ADC | ISENSE | Current sense 0.5V = 1A (4.88mA/LSB) |
|PA1/ADC1 | ADC | THERM_LASER | Laser temperature ADC input (512 @ 25 deg C) |
|PA2/ADC2 | ADC | THERM_HOT | TEC hot side ADC input (512 at 25 deg C) |
|PA3/ADC3 | ADC | FAN_STATUS | Pulse if fan running |
|PA4/ADC4 | ADC | QTEMP | Current source transistor temperature ADC input (512 at 25 deg C) |
|PA5/ADC5 | | n.c. | |
|PA6/ADC6 | IN | TEMP_FAIL | Over-temperature (logic ''1' if temp outside window) (Note 1) |
|PA7/ADC7 | IN | OVER_CURRENT | Over-current (logic ''1' if over current set by pot) |

Note 1 - Window set by R105,R107,R108 (3 per channel).  Default values give 2.5V +/- 0.5V.
*'Resistors R105 etc must be changed to 30k*


|*'Pin* | *Func* | *Name* | *Note* |
|------ | ------ | ------ | ------ |
|PB0-PB1 | IN | CH_ADR0-1 | Channel address 0-3 |
|PB2-PB4 | IN | SL_ADR0-2 | Slot address 0-7 |
|PB5-PB7 | IN | not used | programming connector |
|*'Pin* | *Func* | *Name* | *Note* |
|PC0-PC11 | I2C | I2C SCL/SDA | disable except on channel 0? |
|PC2 | OUT | LED D1 | ''0' for on, uC status |
|PC3 | OUT | LED D5 | ''1' for on, laser on |
|PC4-PC7 | | n.c. | |
|*'Pin* | *Func* | *Name* | *Note* |
|PD0/RXD0 | UART | RS-485 Rx | RS-485 receive data |
|PD1/TXD0 | UART | RS-485 Tx | RS-485 transmit data |
|PD2-PD3 | IN | FAULT0-1 | Fault input for TEC PWM (Note 2) |
|PD4 | OUT | PWM- | TEC PWM output (Note 3) |
|PD5 | OUT | PWM+ | TEC PWM output |
|PD6 | OUT | DE | RS-485 driver enable |
|PD7 | OUT | L_SHDN | Laser shutdown.  Logic ''1' to disable laser |

Note 2:  PWM condtions:  "00"-Overcurrent, "01"-Undervoltage, "10"-Overtemperature, "11"-Normal

Note 3:  Assuming TEC is wired with "+'' lead to J20 pin 1, PWM+ provides cooling with PWM-='0'.  PWM- provides heating with PWM+='0'


