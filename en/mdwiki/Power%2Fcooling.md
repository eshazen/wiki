# Power%2Fcooling
## 2014-03-27

[](attachments/)

[](attachments/)

[](attachments/)


## 2014-03-11
ASDQ heatup: [1 ](http://ohm.bu.edu/~dgastler/g-2/2014-03-11/Tracker_Heat-000001-PSX_Frame_1.png) [2](http://ohm.bu.edu/~dgastler/g-2/2014-03-11/Tracker_Heat-000001-PSX_Frame_20K.png) [3](http://ohm.bu.edu/~dgastler/g-2/2014-03-11/Tracker_Heat-000001-PSX_Frame_36467.png)

ASDQ/TDC side view: [1](http://ohm.bu.edu/~dgastler/g-2/2014-03-11/Tracker_Heat-000001-PSX_Frame_38150.png) [2 ](http://ohm.bu.edu/~dgastler/g-2/2014-03-11/Tracker_Heat-000001-PSX_Frame_38503.png) [3](http://ohm.bu.edu/~dgastler/g-2/2014-03-11/Tracker_Heat-000001-PSX_Frame_38740.png)

TDC: [top](http://ohm.bu.edu/~dgastler/g-2/2014-03-11/Tracker_Heat-000002_Final_Frame.png) [bottom](http://ohm.bu.edu/~dgastler/g-2/2014-03-11/Tracker_Heat-000003-PSX_Final_Frame.png)

## 2014-02-24
Put TDC/ASDQ pair in a small 2.6" x 1.6" x 3 " aluminum box.

Placed a thermistor on ASDQ 1 and monitored temperature until the board returned nonsense.

[](attachments/)

[](attachments/)

[](attachments/)


## 2014-02-24
Prototype Design:

[Update spreadsheet](https://docs.google.com/spreadsheet/pub?key=0Ar7hGgQILVtEdEVTam9DNGcwOEhGVVVOR0M5Rm9ITFE&output=html)

[](attachments/)
[](attachments/)

## 2014-07-10

TDR Design:

[Spreadsheet - 4V](https://docs.google.com/spreadsheet/pub?key=0AiuorYRK6h_1dEpyNWY4TnNNLXRnWFUtMFNucmFSN0E&output=html)

[Spreadsheet - 5V](https://docs.google.com/spreadsheet/pub?key=0AiuorYRK6h_1dFJCc1NvTnhuYUhFU1BKOV9HZWJrR3c&gid=0)

[Diagram](http://physics.bu.edu/~jmott/files/g-2/TDR/TDC-ASDQ-Current-Draws-TDR-Design.png)

## Old
 * +4V Side

|= Supply =|= @ =|= current (mA) =|= Voltage (V) =|= Power out (mW) =|= Power Reg (mW) =|= Power total =|= part =|= current max =|
|- ------ -|- - -|- ------- ---- -|- ------- --- -|- ----- --- ---- -|- ----- --- ---- -|- ----- ----- -|- ---- -|- ------- --- -|
| TDC 2.5V | U10 input | 56  | 2.5  | 140  | 84   | 224 | [tps73701](http://www.ti.com/product/tps73701) | 1 Amp |
| TDC 3.3V | U9 input  | 5.4 | 3.3  | 18   | 3.8  | 22 | [tps73701](http://www.ti.com/product/tps73701) | 1 Amp |
| TDC 1.2V | U11 input | 132 | 1.2  | 160  | 370  | 530 | [tps73701](http://www.ti.com/product/tps73701) | 1 Amp |
| TDC 2.5V | U12 input | 21  | 2.5  | 53   | 32   | 85 | [tps73701](http://www.ti.com/product/tps73701) | 1 Amp |
| ASDQ +3V | R24       | 284 | 3 V   | 850  | 284 | 1134 |[TPS73701](http://www.ti.com/product/tps73701) | 1 Amp |
| Sum of individual | - | 498.4  | - | 1220 | 774 | 1995 |
| Total +4 measurment | input | 500| 4 | 2000  |
 * -4V Side

|= Supply =|= @ =|= current =|= power =|= part =|= current max =|
|- ------ -|- - -|- ------- -|- ----- -|- ---- -|- ------- --- -|
| ASDQ -3V | R31 | 260mA | | http://www.linear.com/product/LT3015 | |
| Total -4 (meas) | input | 265mA |

Notes:
 * Max output of TPS737xx is 1A
 * All other regulators on the ASDQ board run from the +/- 3V regulators, so we don't have individual numbers for them.


Temps:

|= Supply =|= @ =|= Temp (C) =|
|- ------ -|- - -|- ---- --- -|
| ASDQ  |      | 57-60 |
| ASDQ |U9  | 45 |
| ASDQ | U10 | 47 |
| ASDQ | U6 | 50 |
| ASDQ | U8 | 50 |
