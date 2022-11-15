# D0_MCEN_Repair
This is a repair log for D0 MCEN boards, starting 2/5/06.

JTAG Debugging software installed on Linux machine.
Run as ./jtag_shell.  Useful commands:

```
 R  JTAG Reset
 L  Measure chain length
 I  Measure total instruction register length
 T  set to BYPASS, toggle TDI-TDO on and off
 M  toggle TMS on and off

```
## Board 15

JTAG chain broken.  Unplugged all Rx and Physics board.

 * Look at TCK, TMS on 10p Rx conn.  All OK.
 * U47-20 OK, U47-21 different pattern

Now see TMS, TCK, TDI ok into VME FPGA.  TDO is dead.
All 3 FPGAs are quite hot.  Temp probe says 50+ deg C
after 5 minutes on.

*'Replace all 3 FPGAs?*

## Board 4

JTAG chain broken.  Try standard JTAG init... genesis and tpa ok, main chain is broken.

Remove Rx#1 and Rx#12.  No TDI at Rx#1 (TMS, TCK okay).

Take off Physics board and Tx#1 cable.

FPGA_TDI (VME FPGA pin 176) - OK  TDO (pin 189) Dead.  (TCK, TMS ok)

*'Replace VME FPGA?*

## Board 19

JTAG chain broken.  Try standard JTAG init... genesis and tpa ok, main chain is broken.

Remove Rx#1.  No TDI @ Rx#1.  No TDI at VME FPGA.

Remove Physics board.  Now VME FPGA TDI is ok.  No TDI @ Rx#1.
TDI, TDO @ VMEchip, ListsChip.

Errorchip has no TDO (TDI OK).  TCK OK.  TMS OK.

*'Replace Error FPGA?*


## Board 25

JTAG chain broken.  Try standard JTAG init... genesis and tpa ok, main chain is broken.
_'Oops.  Was missing two Tx_.  Found a couple and plugged them in.

JTAG Chain now OK.

Programming errors on Lists chip (consistently and VME chip (sometimes).

*'Replace VME and Lists FPGAs?*


