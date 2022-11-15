# ServiceModuleRevAECOList
## Service Module Rev A ECOs (main board)
List:
 * U15: [ECO Link](http://ohm.bu.edu/trac/edf/raw-attachment/wiki/ServiceModuleRevAECOList/APOLLO_RevA_ECO_U15.pdf)
 * U23: [](attachments/)
 * ESM: [](attachments/)

 * R94,R95,R96,R92  Remove resistors.
 * Add 4.7k resistor between R95 pad bottom to R92 pad upper [](attachments/)


 * R50 should be 10k-ohms for CERN IPMC (SM603)

 * R52,R56,R61,R62 should be ~100-ohms (For LEDs so ~10% is fine)

 * Samtec headers for FP (J40, J46) are a bit too tall.  Suggest sub SAM11085-ND (ESQ-106-23-L-D)

 * Remove U11 and U13.

 * Replace C2, C14, and C18 with ‎565-4114-ND‎

 * Install 3 pin 0.1" header for use with jumpers on J45.
 * Remove R23 and R28

 * install M2.5x8 screw in K1 & K2 (on the back side.)

notes:
 * 220uF caps should get smaller (physically, too tall)
 * Remember to populate R50 with CERN IPMC value.
 * We should add a pull-down to U15 pin 1 for when we have no IPMC (added on board 1)[ECO Link](http://ohm.bu.edu/trac/edf/raw-attachment/wiki/ServiceModuleRevAECOList/APOLLO_RevA_ECO_U15.pdf)
 * ~~We should add a pull-up to ETH_SW_RESET_N~~ (Has on-board pull-up, so we are OK)
 * Traces under mounting splice plate holes
 * U23 has wrong DigiKey part number [](attachments/)
 * A pull up/down should be added between U24 pin 4 and U23 pin 7

## Front panel board changes for Rev B

 * Remove level shifter and wire direct uSD card to connector
 * Change FT232RQ to FT232RL (TSSOP package)
 * Wire `USB_UART_EN` to `FT_3V3` through R2 instead of from `nDTR`
 * Change header P/N for headers for longer pins


## Service Module TODOs for RevB

 * Traces under mounting splice plate holes (move to internal layers/ out of the way)
 * GPIO header
 * Add level shifters between ESM LED/Serial connections to Zynq to allow for ESM to work when Zynq missing/broken.
 * Zynq power good signal to IPMC
 * Modify BOOTMODE flipflops
 * Simple jumper for turning on 12V without an IPMC.
 * Consider removing series caps on TTX Tx lines (`CMS_TCDS2_TTS_P/N`); suggestion from Luis @ KIT
 * Extra IOs between Zynq and IPMC
 * Extra IOs for Zynq-
 * Extra IOs for IPMC
 * Re-arrange high speed links for CMs
 * Connect up second ESM second SGMII to ESM eval phy and zynq ethernet port
 * Compatible with XU
 * adjust hole size under zynq for mounting.

*Requests / comments from Cornell*

 * Make the I2C busses multi-master ZYNQ+IPMC?  Maybe not easy/possible but worth considering
 * Any changes to the UART links to make things easier / more flexible?
 * Possibly alter the SM mechanics so that CM with splice plates can just slide in and out?
 * Peter complains that the SD card read/write speed is very slow.  Maybe it's operating in some fallback slow mode?  Worth investigating.


### Rev 2 SoC US+ options

|model| chip | ram|connectors|MGBTs GTH+GTR|price|
|-----| ---- | ---|----------|----- -------|-----|
|XU1  | ZU6EG,ZU15EG | 2-4GB | 3 | 12 + 4 |700 - 2k|
|XU5  |  ZU2EG,ZU5EV | 2-4GB | 2 | 4  + 4 (not enough) |        |
|xu7  | ZU6EG,ZU15EG | 2-4GB | 3 | 16 + 4 |1.2k - 2k|
|xu8  | ZU4CG,ZU7EV  | 2-4GB | 3 | 16 + 4 | 700-1.6k|
|xu9  | ZU7EV        | 2-4GB | 3 | 16 + 4 | 1.7k |

FPGA Info:

|type | Main CPU | RT cpu | GPU | video codec | Logic|
|---- | ---- --- | -- --- | --- | ----- ----- | -----|
|CG| Dual-Core A53 1.3Ghz| Dual-core R5 533Mhz| | |103-600k logic cells|
|EG| Quad-Core A53 1.5Ghz| Dual-core R5 600Mhz| Mali| | 103-1100k logic cells|
|EV|Quad-Core A53 1.5Ghz| Dual-core R5 600Mhz|Mali| H.264| 192-500k logic cells|

