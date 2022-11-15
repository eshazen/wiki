# HCALngFEC_Firmware_Notes
## Address Decoding

In top-level `ngFEC_logic.vhd` addresses are decoded:
```
stat_reg(0..127)  are at 0x40000000 - 0x4000007f
ctrl_reg(0..31)   are at 0x40000080 - 0x4000009f
```

Also mapped to 0x80000000 ??

## Clocking

Top-level input pair `fabric_clk_p/n` seems to be the 40MHz LHC clock which is used
directly by the GBT banks.

## FW Heirarchy
```
fc7_top.vhd
  system_core.vhd
  ngFEC_logic.vhd
    loop over SFPs:
    ngFEC_module
    delay_ounter
    ngCCM
```

## Server

 * code at https://gitlab.cern.ch/cms-hcal-ngccmserver/ngccmserver (use https option with CERN id/pw to check out)
 * copy at `watt.bu.edu:/home/hazen/work/ngccmserver` for work

I2C/IPbus stuff seems to be in `...devActorApp/src/i2cbusexecutor.cpp`.
Addresses are e.g
```
  Channel00_Input           at 0x6e000000  size=0x4e2  mode=incremental
  Channel00_Output          at 0x6e0004e2  size=0x4e2  mode=incremental
  Channel00_Input_Bytes     at 0x6e001196
  Channel00_Output_Bytes    at 0x6e001197
  Channel00_Control         at 0x6e001195
  Channel00_Status          at 0x5e001194
```

