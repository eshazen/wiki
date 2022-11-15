# FC7_Log
*2017-03-30* (hazen)

N.B. design is on watt in `~/ISE/fc7`.  IPbus is an older version in `~/ISE/cactus`.  Using Vivado 2015.2.

IP address mysteries.  In system_core.vhd, find:
```
  generic map (mac_cfg => internal, ip_cfg  => internal, n_oob => 1)
```
Change both to `external` and recompile.  Now the IP address is the expected constant
one, 192.168.1.80.  So in principle this is understood now.

*2016-06-07* (hazen)

Try to bring out some signals to the test connector (P4).
Here are current assignments:


| P4 Pin | Schematic | Signal |
| -- --- | --------- | ------ |
| 1  | Voltage |
| 2  | GND |
| 3  | FMC_L12_SPARE00 | ctrl_reg(0)(0) |
| 4  | FMC_L12_SPARE01 | ctrl_reg(0)(1) |
| 5  | FMC_L12_SPARE02 | fabric_clk |
| 6  | FMC_L12_SPARE03 | tts_aligned |
| 7  | FMC_L12_SPARE04 | 0 |
| 8  | FMC_L12_SPARE05 | 1 |
| 9  | FMC_L12_SPARE06 | 0 |
| 10 | FMC_L12_SPARE07 | 1 |

It seems these are commented out in `sys.xdc` and `fc7_top.vhd`.  Uncomment them and put
some signals on them as above.  All good, signals expected appear on header.

*2016-06-01* (hazen)

Add a bufg in the ref_clock to idelay_clk_i to tts_rx and set idelayctrl_gen back to true.
Now it builds (?!).  But does it work?

*2016-05-30* (hazen)

 * Re-generate 400Mhz PLL with reset, locked
   * usr_led2 is bits (23:21) of 40Mhz counter
   * stat_reg 0x40000006 bit 0 is 'locked'
   * ctrl_reg 0x40000041 bit 0 is 'reset'

Doesn't meet timing at 400MHz, but OK at 250MHz.

Create 5X TTC clock as needed by TTS tx.  ("ttc_clk_x5" using DCM this time).  Same signals as above.
Source is fabric_clk.

fabric_clk input constraint specified 24ns period, while PLL input was 25ns.  This caused
timing to fail.  Couldn't figure out how to specify a 24ns period for the PLL, so changed
the input constraint to 25ns for now.  *Fail*.

Comment out clock constraints in PLL (ttc_clk_x5_v3.xdc).  Input constraint should propagate?
Now it works.

Looking to add TTS Tx with output connected to SFP on FMC.  Schematic for FMC:

[[https://edms.cern.ch/ui/file/1350700/1/EDA-02707-V2-0_sch.pdf][EDA-02707-V2-0_sch.pdf]]

Add tts_tx plus other required stuff.  ctrl_reg 0x40000042 is output data for TTS tx.
Fix UCF lines to eliminate logic type for SFP outputs.

Integrated tts_rx.  Fails timing.  Problem net seems to be the ref_clk for the idelayctrl
which is an idelayctrl instantiated at the bottom of serdes_rx_custom.vhd.  This is required
according to the [docs](http://www.xilinx.com/support/documentation/user_guides/ug471_7Series_SelectIO.pdf)
when the IDELAYE2 is set with IDELAY_TYPE="VAR_LOAD" as in serdes_rx_custom.vhd.

With idelayctrl_gen=false in user_logic_basic (instantiate tts_rx) then the design builds,
but violates the above rule so probably won't work.  Need some more study.

*2016-05-27* (hazen)

Measure two available clocks in user logic:

 * `ipb_clk` is about 32MHz
 * `fabric_clk` is about 40.1 MHz (maybe the LHC freq?)

Actually ipb_clk is 31.25MHz, generated using a PLL from 125MHz crystal

In `...fw/src/sys/ipb_fc7/clocks_7s_serdes_fc7.vhd` an entity `syspll` which is a DCM is instantiated, which just converts 125MHz to 31.25MHz.  It's buffered with a *bufg* in the PLL.

With some minor effort, create a PLL to generate 400MHz from 31.25MHz called *my_clk400*.

Add an instance and counter to the user logic.  Register map is now:

```
0x40000000 - 0x676f6c64  "gold"
0x40000001 - 0x00000001
0x40000002 - firmware id
0x40000003 - ipb_clk counter (32 bits)
0x40000004 - fabric_clk counter (32 bits)
0x40000005 - 400MHz counter divide-by-ten (32 bits)
```

The 400MHz isn't working.  Enough for today (Friday 6pm)
