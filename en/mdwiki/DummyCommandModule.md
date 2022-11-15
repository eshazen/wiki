# DummyCommandModule
## Breakout board for testing SM without CM.

SVN:  https://gauss.bu.edu/svn/common-atca-blade.hardware/DummyCM

This should be an ExpressPCB mini board with the following connectors (CM side)

<img src="http://ohm.bu.edu/~hazen/APOLLO/figs/pwr_conn.png">

The power contacts should be routed with large copper areas (40A capable if possible!) to a set of
series power resistors (6 each e.g. DigiKey AP1012R2J-ND) in parallel with room for heatsinks on them.

Signal contacts should be routed as follows:

JTAG:  TMS, TCK, TDO, TDI with GND to a 6 pin SIP header (Digilent pinout):

```
1 - TMS
2 - TDI
3 - TDO
4 - TCK
5 - GND
6 - N/C
```

To a 0.1 inch dual row header:

```
1 - PWR_GOOD
2 - EN
3 - TX_IPMC
4 - RX_IPMC
5 - TX_ZYNQ
6 - RX_ZYNQ
7 - SENSE_SDA
8 - SENSE_SCL
9 - GPIO0
10 - GPIO1
11 - GPIO2
12 - PS_RST
13 - GND
14 - GND
```

<img src="http://ohm.bu.edu/~hazen/APOLLO/figs/hs_conn.png">

Loop back Tx to Rx via 0.1 pairs (ideally on a header).  Keep traces short as possible.

`TX1_P - RX1_P` etc.  Ground all GND pins.

Clock pairs should have 100 ohm between N/P and route to 0.1" pairs


