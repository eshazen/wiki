# FPGA_Design_Notes
Navigate to: [Linear_Collider](Linear_Collider.md) &bull; [Front-End_Link](Front-End_Link.md)

Pin mapping for Spartan-3E eval board with FELT adapter board

DCOL Simulation Port


| Pair | Hirose-80 Pin | Spartan 3E Pin | Function |
| ---- | --------- --- | ------- -- --- | -------- |
| 1,2  | 10            | A6 (out)       | Tx Data  |
| 4,5  | 11            | B6 (out)       | Test Pulse  |
| 7,8  | 12            | E7 (in)        | Rx Data  |

Front-End Simulation Port


| Pair | Hirose-80 Pin | Spartan 3E Pin | Function |
| ---- | --------- --- | ------- -- --- | -------- |
| 1,2  | 7             | A4 (in)        | Rx Data  |
| 4,5  | 8             | D5 (in)        | Test Pulse  |
| 7,8  | 7             | B4 (out)       | Tx Data  |

Other pins

Clock source - a 60MHz clock source is really needed.  Suggest to install
a 60MHz oscillator in the Auxiliary Oscillator Socket
(page 22 of eval board user guide).

The eval board has lots of switches, LEDs etc which can be very
useful for changing tester settings.

