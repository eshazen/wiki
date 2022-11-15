# MotherboardDesignNotes

## Wiring

There will be (16) 14-pin headers for vial controls.  The pinout is as follows:


| *Pin* | *Function* | *Module No* |
| ----- | ---------- | ------- --- |
| 1 | Spare_A + | 7 |
| 2 | Spare_A - | 7 |
| 3 | Spare_B + | 6 |
| 4 | Spare_B - | 6 |
| 5 | !PhotoDiode + | 5 |
| 6 | !PhotoDiode - | 5 |
| 7 | LED + | 4 |
| 8 | LED - | 4 |
| 9 | !TempSensor + | 3 |
| 10 | !TempSensor - | 3 |
| 11 | Heater + | 2 |
| 12 | Heater - | 2 |
| 13 | Motor + | 1 |
| 14 | Motor - | 1 |

There will be (7) sites for plug-in Analog or PWM boards.
Each plug-in module will have two 25-pin headers with pinout given below.
In addition there are two 10-pin headers on the PWM boards to supply 24V power.


||| *Left* || *Right* |
||| ------ || ------- |
| 1  | GND   | Signal GND               |  2  | Signal GND              |
| 3  | CH00  | Analog !In/Out channel 0 |  4  | Analog !In/Out channel 1 |
| 5  | PWR   | Analog Power (24V)       |  6  | Analog Power (24V)      |
| 7  | CH02  | Analog !In/Out channel 2 |  8  | Analog !In/Out channel 3 |
| 9  | PWR   | Analog Power (24V)       |  10 | Analog Power (24V)      |
| 11 | CH04  |                          |  12 |                         |
| 13 | PWR   |                          |  14 |                         |
| 15 | CH06  |                          |  16 |                         |
| 17 | PWR   |                          |  18 |                         |
| 19 | GND   |                          |  20 |                         |
| 21 | CH08  |                          |  22 |                         |
| 23 | PWR   |                          |  24 |                         |
| 25 | CH10  |                          |  26 |                         |
| 27 | PWR   |                          |  28 |                         |
| 29 | CH12  |                          |  30 |                         |
| 31 | PWR   |                          |  32 |                         |
| 33 | CH14  |                          |  34 |                         |
| 35 | PWR   |                          |  36 |                         |
| 37 | GND   | Signal GND               |  38 | Signal GND              |
| 39 | CTRL0 | Control logic I/O 0      |  40 | Analog Ref              |
| 41 | CTRL1 | Control logic I/O 1      |  42 | Analog Out              |
| 43 | CTRL2 | Control logic I/O 2      |  44 | -spare-                 |
| 45 | CTRL3 | Control logic I/O 3      |  46 | 5V                      |
| 47 | CTRL4 | Control logic I/O 4      |  48 | 5V                      |
| 49 | GND   | Signal GND               |  50 | Signal GND              |

There will be four sites for ARM processor modules (SparkFun SAM D21 mini breakout)
with 24 pins each.  Wiring to the analog/PWM sites will be as shown in the block diagram.
Below is the pin wiring for the processor sites.  Note that the odd numbering matches
that on the SparkFun schematic.


||| *Left* |||| *Right* |
||| ------ |||| ------- |
| Route to RS-485 TXn | Tx   | 12 |   |  1 | Vin      | 5V             |
| Route to RS-485 RXn | Rx   | 11 |   |  2 | GND      | GND            |
| -nc-                | nRST | 10 |   |  3 | AREF     | -nc-           |
| GND                 | GND  |  9 |   |  4 | 3.3V     | -nc-           |
| CTRL0 to PWM        | D2   |  8 |   |  5 | A3       | CTRL3 to ADC   |
| CTRL1 to PWM        | D3   |  7 |   |  6 | A2       | -nc-           |
| CTRL2 to PWM        | D4   |  6 |   |  7 | A1       | -nc-           |
| CTRL3 to PWM        | D5   |  5 |   |  8 | A0       | ADC Analog Out |
| CTRL4 to PWM        | D6   |  4 |   |  9 | D13/SCK  | -nc-           |
| CTRL0 to ADC        | D7   |  3 |   | 10 | D12/MISO | -nc-           |
| CTRL1 to ADC        | D8   |  2 |   | 11 | D11/MOSI | RS-485 TXEn    |
| CTRL2 to ADC        | D9   |  1 |   | 12 | D10/SS   | -nc-           |



There will be one site for a four-channel RS-485 transceiver board.  Pinout below.


|| *Left* | ----- || *Right* |
|| ------ | ----- || ------- |
|  1 | GND |  | GND |  1 |
|  2 | Tx1 |   | Tx3 |  2 |
|  3 | Rx1 |   | Rx3 |  3 |
|  4 | En1 |   | En3 |  4 |
|  5 | Tx2 |   | Tx4 |  5 |
|  6 | Rx2 |   | Rx4 |  6 |
|  7 | En2 |   | En4 |  7 |
|  8 | 5V  |   | A   |  8 |
|  9 | GND |   | B   |  9 |


## Power

 * Samtec "Power Mate" Family (~10A/pin)
   * PMSS series cables, mates with IPBT connectors
 * Molex ultra-fit (~10A/pin)
   * WM11876-ND (header)
   * WM11642-ND (plug)
   * WM11558CT-ND (crimp terminal 16-18 AWG)

## Other Notes

Need RS-485 transceivers, e.g. Digi-Key 497-6540-1-ND


