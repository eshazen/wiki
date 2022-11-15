# Rev_2_Programming_Fixture


Programming and testing is accomplished via a 10 pin card-edge connector.
The pinout of this connector and mapping to a standard AVR 6-pin ISP is
given in the table below.


| *Pin* | *Name* | *Notes* | *ISP* |
| ----- | ------ | ------- | ----- |
| 1 | 3.3V | Regulator output | 2 |
| 2 | TxD | UART TX output |
| 3 | RxD | UART RX input |
| 4 | SCK | SPI programming clock | 3 |
| 5 | Reset | CPU Reset | 5 |
| 6 | GND | | 6 |
| 7 | GND |
| 8 | BT+ | Battery voltage sense |
| 9 | MISO | SPI programming data out | 1 |
| 10 | MOSI | SPI programmming data in | 4 |

