# BlinkyPov4Notes
The Rev 4 PCB has changed the pinout a bit to allow in-circuit programming.
Pin assignments are as follows:


| *!PinNo* | *Name* | *Function* | *Programming* | *AVR ISP* |
| -------- | ------ | ---------- | ------------- | ---- ---- |
| 13 | PA0 | LED D1 (bottom) |
| 12 | PA1 | LED D2 |
| 11 | PA2 | LED D3 |
| 10 | PA3 | LED D4 |
| 9  | PA4/ADC4 | Data sensor | P1 - SCK | 7 |
| 8  | PA5 | Button (GND when pressed) | P3 - MISO | 9 |
| 7  | PA6/ADC6 | Clock sensor | P4 - MOSI | 1 |
| 6  | PA7 | LED D5 |
| 2  | PB0 | LED D6 |
| 3  | PB1 | LED D7 |
| 5  | PB2 | LED D8 (top) |
| 4  | PB3/RESET | | P2 - RESET | 5 |
| 14 | GND | Ground | P6 - GND | 4,6,8,10 |
| 1 | VCC | 3.3V | P5 - VCC | 2 |

The "programming" pins are solder points shown in this view: [layout_prog.png](http://joule.bu.edu/~hazen/BlinkyPovAVR/Rev4/layot_prog.png).
One can solder wires to the points and connect them to an AVR programmer (10 pin cable) using the pin numbers shown for in-circuit programming.


