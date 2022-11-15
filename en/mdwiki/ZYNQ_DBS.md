# ZYNQ_DBS
## SOC boards

| Source |Board | FPGA | GPIOS | SERDES | CLASS | Size | FLASH | SD | clocking | notes | $@1 |
| ------ |----- | ---- | ----- | ------ | ----- | ---- | ----- | -- | -------- | ----- | --- |
| ENCLUSTRA | Mercury ZX1 | XC7Z030 | 138 | 4 | 6-Gbps | 64 x 54mm | | | | no caps on MGT lines | 500 |
| ENCLUSTRA | Mercury ZX1 | XC7Z035 | 126 | 8 | 6-Gbps | 64 x 54mm | | | | no caps on MGT lines  | |
| ENCLUSTRA | Mercury ZX1 | XC7Z045 | 126 | 8 | 10-Gbps | 64 x 54mm | | | | no caps on MGT lines  | $1.2k |
| ENCLUSTRA | Mars xu3 | XCZU2 | 108 | 4 | 6-Gbps | 37.6 x 30mm SO-DIMM | | | | | |
|  | Picozed  | XC7Z015 |135 | 4 | 3.75-6.25 Gbps | 57.15 x 101.6mm | | | | | |
|  | Picozed  | XC7Z030 |135 | 4 | 6.6-Gbps | 57.15 x 101.6mm | | | | | |
| Wisconsin | ELM1 | XC7Z045 | 24 HR + 74 HP? | 8 | 10-Gbps | 84 x 75mm | | | | | |


## SOC eval boards

 * [Enclustra PE-1 ](https://www.enclustra.com/en/products/base-boards/mercury-pe1-200-300-400/#) 100/200/400
   * $300,500,600
   * PE-1 200 only uses PCIe card edge for MGT clocks
   * PE-1 300/400 have SI clock chip for MGT clocks.
   * Loopback via 0-ohm resistors.
