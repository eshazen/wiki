# LED_Dimmer
### PWM Dimmer

This board will provide I2C intensity control for a Luxeon white LED.
Three control options are provided:


analog input of BuckPuck

input of BuckPuck

(not constant current... 12V supply with limit resistor)

#### PCB Documentation

 * [Layout](http://joule.bu.edu/~hazen/LED_dimmer/dimmer_pcb_legend.pdf)
 * [Schematic](http://joule.bu.edu/~hazen/LED_dimmer/dimmer_sch_upd.pdf)
 * [PCB Design](http://joule.bu.edu/~hazen/LED_dimmer/dimmer_ExpressPCB.zip)
[ExpressPCB](http://www.expresspcb.com)
 * Assembly Notes:
   * Buckpuck mounts on bottom side of PCB (oops)
   * Cut trace to U3-6, wire to U3-7

#### Programming


| Digital Pot | 50 | fb | 00-3f | Pot 1 setting |
| ------- --- | -- | -- | ----- | --- - ------- |
| PWM control | 60 | 01 | 00-ff | PWM 0 blink rate [(n+1)/152_Hz]((n+1)/152_Hz.md)
|             |    | 02 | 01-ff | PWM 0 duty cycle [n/256](n/256.md)
|             | 60 | 03 | 00-ff | PWM 1 blink rate [(n+1)/152_Hz]((n+1)/152_Hz.md)
|             |    | 04 | 01-ff | PWM 1 duty cycle [n/256](n/256.md)
|             |    | 05 | 00-0f | Selector: bits 0-1 = white LED; bits 2-3 = red LED |
|             |    |    |       |  00=off 01=on 10=PWM 0 11=PWM 1 |

#### Parts Documentation

 * Luxeon LXHL-MW1D High-intenisty LED [Data Sheet](http://www.luxeon.com/pdfs/DS23.pdf)
 * Philips PCA9530 2-output I2C PWM Dimmer [Data Sheet](http://www.semiconductors.philips.com/pip/PCA9530D.html)
  [local copy](http://joule.bu.edu/~hazen/DataSheets/Philips/PCA9530_2.pdf)
 * DS3906 digital pot
([Data Sheet](http://joule.bu.edu/~hazen/DataSheets/Dallas/DS3906.pdf)
([Package Drawing](http://www.maxim-ic.com/package_drawings/21-0061I.pdf)
 * [I2CTools.com](http://www.i2ctools.com)
[Hardware Manual](http://www.i2ctools.com/Downloads/USB-to-I2C_Hardware_User_Manual.pdf)
 * [LED Dynamics](http://www.leddynamics.com) BuckPuck constant-current driver   [Data Sheet](http://www.leddynamics.com/LuxDrive/datasheets/3021-BuckPuck.pdf)


#### Bit-Bang I2C Interface


  test program

```
                                         LS05 pin 14 (Vcc) o      -------
                                                           |      |     |
            +--+--+---------------------+--+--+------------+------+-o 1 |
            |  |  |                     |  |  |           ===.1uF | +5V |
  -------- [R](R.md)[R](R.md)[R](R.md) 3x10K       3x10K [R](R.md)[R](R.md)[R](R.md)
  |      |  |  |  |                     |  |  |    pin 7 o-+------+-o 2 |
  | 12 o-+--+  |  |   3|\ 4             |  |  |    (Gnd)          | GND |
  | 17 o-+-----|--|----| >o-------------+--|--|--------------+    |     |
  |      |     |  |    |/        8 /|9     |  |     10 /|11  +----+-o 3 |
  | 15 o-+-----+--|--------------o< |------+--|------o< |----+    | SCL |
  |      |        |   1|\ 2        \|         |        \|         |     |
  |  9 o-+--------|----| >o-------------------+--------------+----+-o 4 |
  |      |        |    |/                            6 /|5   |    | SDA |
  | 11 o-+--------+----------------------------------o< |----+    -------
  | 10 o-+-+                                           \|          4-pin
  | 13 o-+-+--oGND                                              Connector
  | 25 o-+-+      ------------------ Part List --------------------------
  --------        | 1 - .1 uF capacitor   | 6 - 10K 5% resistors        |
  25-pin male D   | 1 - 4-pin connector   | 1 - 25-pin male D connector |
  connector to PC | 1 - 74LS05 open collector hex inverter              |
  printer port    -------------------------------------------------------

```



