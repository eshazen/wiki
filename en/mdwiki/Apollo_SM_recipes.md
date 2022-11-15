# Apollo_SM_recipes
## BUTool


{{{#!div
{{{#!html
<h3 class="foldable">Start BUTool:</h3>
}}}
{{{#!div
```
[cms@apollo06 ~]$ BUTool.exe -a
Registered device: GENERICIPBUS
Registered device: APOLLOSM
Using .xml connection file...
Warning: Input is a connection file but no device entry specified, using default entry name: test.0
>
```
}}}
}}}












## Command Module


{{{#!div
{{{#!html
<h3 class="foldable">Power-up/down CM:</h3>
}}}
{{{#!div
In BUTool:
```
>cmpwrup
CM 1 is powered up
>cmpwrdown
CM 1 is powered down
>
```
}}}
}}}

{{{#!div
{{{#!html
<h3 class="foldable">Program CM FPGA via SVF:</h3>
}}}
{{{#!div
This example programs the Kintex on the CMS CM.
This currently takes a while...
```
>cmpwrup
CM 1 is powered up
>status
Process done
              C2C| AXILITE_AR_READY_TIMEOUT| LINK_GOOD| PHY_LANE_UP|
               --|-------------------------|----------|------------|
              CM1|                         |         0|           1|
            CM1_K|                        1|          |            |
            CM1_V|                        1|          |            |
              CM2|                         |         0|           0|

               CM| IOS_ENABLED| PWR_GOOD|
               --|------------|---------|
              CM1|           1|        1|

         FIRMWARE|    SM_ZYNQ|
               --|-----------|
       BUILD_DATE| 0x20191024|
       BUILD_TIME| 0x   91819|

           STATUS| TEMP| TEMP_MAX| TEMP_MIN|
               --|-----|---------|---------|
             ZYNQ|   39|       39|       39|

SW VER: -1
>svfplayer /fw/CM/top_K.svf PLXVC.XVC_1

xsvftool-gpio, part of Lib(X)SVF (http://www.clifford.at/libxsvf/).
Copyright (C) 2009  RIEGL Research ForschungsGmbH
Copyright (C) 2009  Clifford Wolf <clifford@clifford.at>
Lib(X)SVF is free software licensed under the ISC license.
Modified for use in Apollo platform by Michael Kremer, kremerme@bu.edu

playing /fw/CM/top_K.svf
JTAG setup succesful
JTAG shtdown succesful.
SVFplayer ran without errors.
>status
Process done
              C2C| AXILITE_AR_READY_TIMEOUT| LINK_GOOD| PHY_LANE_UP|
               --|-------------------------|----------|------------|
              CM1|                         |         1|           1|
            CM1_K|                        1|          |            |
            CM1_V|                        1|          |            |
              CM2|                         |         0|           0|

               CM| IOS_ENABLED| PWR_GOOD|
               --|------------|---------|
              CM1|           1|        1|

         FIRMWARE|    SM_ZYNQ|
               --|-----------|
       BUILD_DATE| 0x20191024|
       BUILD_TIME| 0x   91819|

           STATUS| TEMP| TEMP_MAX| TEMP_MIN|
               --|-----|---------|---------|
             ZYNQ|   39|       40|       39|

SW VER: -1
```
During this configuration the C2C link came up right away.
If it doesn't, follow the Initialize C2C instructions.

The C2C has probably had a bad transaction happen before the FPGA was ready, so you'll probably have to unblock the C2C bridges with the following
```
>write C2C1_AXILITE_FW.UNBLOCK
Mask write to C2C1_AXILITE_FW.UNBLOCK
>write C2C1_AXI_FW.UNBLOCK
Mask write to C2C1_AXI_FW.UNBLOCK
>status
Process done
              C2C| AXILITE_AR_READY_TIMEOUT| LINK_GOOD| PHY_LANE_UP|
               --|-------------------------|----------|------------|
              CM1|                         |         1|           1|
            CM1_V|                        1|          |            |
              CM2|                         |         0|           0|

               CM| IOS_ENABLED| PWR_GOOD|
               --|------------|---------|
              CM1|           1|        1|

         FIRMWARE|  CM_KINTEX|    SM_ZYNQ|
               --|-----------|-----------|
       BUILD_DATE| 0x20190918| 0x20191024|
       BUILD_TIME| 0x  194908| 0x   91819|

           STATUS| TEMP| TEMP_MAX| TEMP_MIN|
               --|-----|---------|---------|
      KINTEX_X100| 2481|     2515|     2448|
             ZYNQ|   39|       40|       39|

SW VER: -1
```
Now the CM1_K TIMEOUT value is cleared and the CM_KINTEX FW info and temperatures are available.
}}}
}}}






## AXI C2C (old)==


{{{#!div
{{{#!html
<h3 class="foldable">Initialize C2C:</h3>
}}}
{{{#!div
If the links don't come up right away, do the following.
```
write CM.CM1.C2C.INITIALIZE 1
sleep 1
write CM.CM1.C2C.INITIALIZE 0
```
}}}
}}}

{{{#!div
{{{#!html
<h3 class="foldable">Phylane control:</h3>
}}}
{{{#!div
The purpose of the phy lane control is to add more stability to the phy lane C2C connections. This module is enabled by default in the xml of ZYNQ FW but can be turned on and off with the following commands on BUTool.
[BR](BR.md)Turning phy lane control off
```
>write CM.CM_#.CTRL.ENABLE_PHY_CTRL 0
```
Turning phy lane control on
```
>write CM.CM_#.CTRL.ENABLE_PHY_CTRL 1
```
}}}
}}}





















## IPMC

{{{#!div
{{{#!html
<h3 class="foldable">IPMC FW upgrade:</h3>
}}}
{{{#!div
The latest Apollo versions of the CERN IPMC firmwares can be found [here](http://ohm.bu.edu/~apollo/IPMC_FW/current/).
You will also need your shelf's IP address and your blades IPMB address.
First check this is the blade you want (in this case SM02 @ 0x8c)
You will see Product Serial is 2 for SM02
```
[user@host]$ ipmitool -H shelf_IP -P "" -t 0x8c fru list
FRU Device Description : Builtin FRU Device (ID 0)
 Board Mfg Date        : Wed May 31 20:00:00 2017
 Board Mfg             : Cirly/Addax
 Board Product         : TEST_FRUFROLLBACK
 Board Serial          : 00001
 Board Part Number     : P580050995
 Product Manufacturer  : CERN
 Product Name          : APOLLO-BLADE
 Product Part Number   : SM00002
 Product Version       : v.2.14
 Product Serial        : 0000002
```
Upload the FW and activate
```
[user@host]$ ipmitool -H shelf_ip -P "" -t 0x8c hpm upgrade file.img force activate

PICMG HPM.1 Upgrade Agent 1.0.9:

Validating firmware image integrity...OK
Performing preparation stage...
Services may be affected during upgrade. Do you wish to continue? (y/n): y
OK

Performing upgrade stage:

-------------------------------------------------------------------------------
|ID  | Name        |                     Versions                        | %  |
|    |             |      Active     |      Backup     |      File       |    |
|----|-------------|-----------------|-----------------|-----------------|----|
|   1|A2F-ATCA BOO |   2.0e 00000000 | ---.-- -------- |   2.17 00000000 |100%|
|    |Upload Time: 00:12             | Image Size:   19631 bytes              |
|   0|A2F-ATCA FIR |   2.0e 00000000 |   1.17 00000000 |   2.17 00000000 |100%|
|    |Upload Time: 01:31             | Image Size:  150211 bytes              |
|   2|A2F-ATCA FRU |   2.0e 00000000 |   1.17 00000000 |   2.17 00000000 |100%|
|    |Upload Time: 00:00             | Image Size:     271 bytes              |
-------------------------------------------------------------------------------
(*) Component requires Payload Cold Reset
Performing activation stage:

Firmware upgrade procedure successful


```
}}}
}}}
