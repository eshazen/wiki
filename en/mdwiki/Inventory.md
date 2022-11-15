# Inventory
TDC inventory


|= TDC # =|= Ver =|=  ECO =|= status =|= location =|= notes =|
|- --- - -|- --- -|-  --- -|- ------ -|- -------- -|- ----- -|
|00 | 1 | 2013-11-01 | dead | EDF (bench) | |
|01 | 1 | 2013-11-12 | passed test 1 | FNAL | |
|02 | 1 | 2013-11-14 | passed test 1 | EDF (box) | Used in HV test |
|03 | 1 | 2013-11-14 | passed test 1 | FNAL | |
|04 | 1 | 2013-11-14 | passed test 1 | EDF (Dean) | |
|00 | 2 | 2014-01-09 | scan | FNAL |  |
|01 | 2 | 2014-01-09 | scan | Liverpool | |
|02 | 2 | 2014-01-09 | scan | EDF (box) | |
|03 | 2 | 2014-01-09 | scan | FNAL | |
|04 | 2 | 2014-01-09 | scan | FNAL | |


Test 1:
 * check regulators @ 1.2V, 2.5V, 2.5V, and 3.3V

ASDQ Inventory

|= ASDQ # =|= Ver =|=  ECO =|= status =|= location =|= =|
|- ---- - -|- --- -|-  --- -|- ------ -|- -------- -|- -|
|00 | 1 | 2013-11-01 | dead | EDF (bench) | used when TDC 00 died (possible bad 1.4V reg) |
|01 |1 | 2013-11-15 | passed test 1 | FNAL | Used in HV test  |
|02 |1 | 2013-11-15 | passed test 1 | EDF (box) | missing resistor R71  Needs HV resistor and ECOs|
|03 |1 | 2013-11-14 | dead| EDF (box) | |
|04 |1 | 2013-11-15 | passed test 1 | FNAL | |
|00 | 2 | 2014-01-09 | sockets and scan | FNAL | [](attachments/) [](attachments/) [](attachments/) |
| | | | | | 12MOhms in serial up to 1.5kV with 0.03*0.1uA = 3nA |
|01 | 2 | 2014-01-09 | sockets and scan | FNAL | [](attachments/) [](attachments/) [](attachments/) |
|02 | 2 | 2014-01-13 | sockets and scan | EDF (bench) | [](attachments/) [](attachments/) [](attachments/) |
|03 | 2 | 2014-01-13 | sockets and scan | FNAL | [](attachments/) [](attachments/) [](attachments/) |
|04 | 2 | | | Liverpool| |

Test 1:
 * Check regulators +/- 3, +/-1.6
 * currents in line with [Operating notes](Operating_notes.md)
 * Check for hits on DAC pass
