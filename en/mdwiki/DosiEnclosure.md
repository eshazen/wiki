# DosiEnclosure
Back to [Roblyer_dDOSI](Roblyer_dDOSI.md)

The DOSI PC boards require the following power supplies:


| DDS Boards (6) | 1.8V | 0.2A/board (1.2A total) | Regulator board | 5V switching supply |
| --- ------ --- | ---- | ---------- ----- ------ | --------- ----- | -- --------- ------ |
| | 3.3V | 0.2A/board (1.2A total) | Regulator board | 5V switching supply |
| ADC Board | 7.5V | 20W (3A) | | 7.5V switching supply |
| FPGA Board | 7.5V | 20W (guess!) | | 7.5V switching supply |

Suggested power supplies (1 ea needed):


| *'Supply* | *Catalog No* | *Mfg No* | *Description* |
| --------- | -------- --- | ---- --- | ------------- |
| 5V Supply | Mouser 709-EPS35-5 | Mean Well EPS-35-5 | 5V @ 6A open frame switching supply |
| 7.5V Supply | Mouser 709-PS35-7.5 | Mean Well PS-35-7.5 | 7.5V @ 4.7A open frame switching supply |

Regulator board:

One 5V input, six LM317 adjustable regulators with separate outputs arranged in pairs.



