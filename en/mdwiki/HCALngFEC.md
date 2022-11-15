# HCALngFEC
Nav: [HCALFrontEnd](HCALFrontEnd.md)

*2017-11-07* (Eric)

Building a new version in Proj/CMS/ngFEC311 from 3.1.1 sources:

```
 $ svn co https://ehazen@svn.cern.ch/reps/cms-firmwsrc/hcal/HCAL_ngFEC_fc7/branches/HB_HE_FC7_Vivado
 $ svn co https://ehazen@svn.cern.ch/reps/ph-ese/be/fc7/tags/fc7_5.0.2
 $ svn co https://ehazen@svn.cern.ch/reps/ph-ese/be/gbt_fpga//tags/gbt_fpga_5_0_0/
 $ svn co https://ehazen@svn.cern.ch/reps/cactus/tags/ipbus_fw/ipbus_2_0_v1
 $ cp -r fc7_5.0.2/fw/src/* HB_HE_FC7_Vivado/fw/src/
 $ edit HB_HE_FC7_Vivado/fw/tcl/ngFEC_vivado.tcl

       set GBT_PATH /home/hazen/Proj/CMS/ngFEC_24/gbt_fpga_5_0_0
       set IPBUS_PATH /home/hazen/Proj/CMS/ngFEC_24/ipbus_2_0_v1

 $ open HF_FC7_Vivado/fw/prj/ngFEC_HF_viv/ngFEC_HF_viv.xpr in Vivado 2016.4
 > source HB_HE_FC7_Vivado/fw/tcl/ngFEC_vivado.tcl    (in Tcl Console)
```

Then launch "Generate Bitstream".  Result here:

http://ohm.bu.edu/~hazen/CMS/HCAL_FE/ngFEC_fw/fc7_top_311_hazen.bit

*2017-11-01* (Yash)

Added the "linkstatus" command to the NGFEC tool. It displays the the link stats for the fc7gbtstatus registers.

*2017-10-24* (Eric)

ngFEC register details not seen in address table are in the configuration file, copy here:

 * http://ohm.bu.edu/~hazen/CMS/HCAL_FE/hehf_definitions_g_8sfp.txt

To read useful link status registers using the server:

```
  tput fec-fg short     # force read of read-only registers
  tget fec-fg fnrR1     # read the registers
```

Setup tool on daq account so you type "ngfec" twice and it runs.

*2017-10-20* (Eric)

Alan intervened and installed a mystery version of ngFEC fw:

 * http://ohm.bu.edu/~hazen/CMS/HCAL_FE/ngFEC_fw/Ingo_HBHE_second.bit

Using this, reprogrammed the ngCCM in J14:
```
  jtag /home/hazen/HBHE_CCC_J14_MM_half_speed_both_v5.2_20170928c.stp HE2-neigh PROGRAM
```


*2017-10-19* (Eric)

Wu has a candidate 2.4Gbps version.

 * http://ohm.bu.edu/~hazen/CMS/HCAL_FE/2017-10-19-0559.ngFEC_HBHE_viv.xpr.zip
 * http://ohm.bu.edu/~hazen/CMS/HCAL_FE/2017-10-19-0559_fc7_top.bit

Loaded it using the server (which I think is Dan's hacked version).
Using the "clocks" command in the ngfec tool it looks promising:

```
>clock
Clock     LHC     SFP1     SFP2     SFP3     SFP4     SFP5     SFP6     SFP7     SFP8
(MHz)   40.078   0.000    20.034   20.033   20.033   20.032   20.033   20.033   0.000
```

Grab the ngCCM firmware from [here](https://twiki.cern.ch/twiki/bin/view/CMS/HCAL/NgCCMHEHBProd#Firmware)
(version 5.2 "half/half").  Two files for J14 and J15 are needed.  Make a local copy here:

 * http://ohm.bu.edu/~hazen/CMS/HCAL_FE/ngCCM_fw/

Now we need to go back to the standard firmware so we can reprogram the ngCCM using remote JTAG.
Unfortunately I don't have handy a 3_1_0 bit file :(  Use /tmp/ngfec_test_9_2_1_b.bit.
(this is 3_1_0 with just the version changed for testing).

Tried the DEVICE_INFO option, fails:

```
jtag HBHE_CCC_J14_MM_half_speed_both_v5.2_20170928c.stp HE2-neigh DEVICE_INFO
>
HBHE_CCC_J14_MM_half_speed_both_v5.2_20170928c.stp HE2-neigh DEVICE_INFO#ERROR given stp file is for wrong fpga - expecting:M2GL050T-fg484
```

All of these return non-zero but unchanging values:

```
  get HE2-mezz-rs_rsdec_error_cnt
  get HE2-smezz-rs_rsdec_error_cnt
  get HE2-b2b-rs_rsdec_error_cnt
  get HE2-sb2b-rs_rsdec_error_cnt
```


*2017-09-29* (PM, Eric)

Loaded Wu's first test version bit file.
*Note:* had to start control hub.  The server *fails silently* (only errors to the log) if it can't connect to the ngFEC!  I guess this is a feature, not a bug.

Check controlhub status with `controlhub_info`.
Type `controlhub_start` as normal user on `cms4.bu.edu` to re-start it if needed.

```
http://physics.bu.edu/~wusx/download/ngFEC/fc7_top.bit
```

Used recipe:

```
  tput fec-fg go_offline
  boot fec ....file.bit
  .... wait till finished
  tput fec-fg go_online
```

Then the module was bricked.  Had to *restart rarpd* on `cmssun1.bu.edu`.
Log on, type `sudo rarpd`.

Now I can at least talk to it with the tool, though I don't expect it to work yet.

Using the tool `clock` command we see:

```
>clock
Clock     LHC     SFP1     SFP2     SFP3     SFP4     SFP5     SFP6     SFP7     SFP8
(MHz)   40.078   0.000    20.036   20.035   20.035   20.034   20.035   20.035   0.000
```

The 20.xxx freqs are promising.  We expect only 6 links (2-7) to be working.

*2017-09-29* (AM, Eric)

*Building new tool* in `cms4:/home/hazen/work/ngFECtool`.

```
 $ svn co http://gauss.bu.edu/svn/butool
 $ cd butool/trunk
 $ source env.sh
 $ make
 $ bin/tool/BUTool.exe
 >
```

Now we have a working generic too.
Try to get the ngFEC plugin:

```
 $ cd ~/work/ngFECtool
 $ svn co http://gauss.bu.edu/svn/ngfec.tool-device
 $ cd ngfec.tool-device/trunk
 $ source ngfec.env
 $ make
```

Also the location of the IPBus shared libraries must be given somehow; best
to put these lines in your .bashrc or somewhere:

```
  CACTUS_ROOT=/opt/cactus
  LD_LIBRARY_PATH="${CACTUS_ROOT}/lib/:${LD_LIBRARY_PATH}"
```

Grab a random version of the address table from `/home/yashagg/work/nTool/tables/ngfec.xml`.
Now we can talk to it:

```
 $ BUTool.exe
 Registered device: NGFEC
 >add_device ngfec 192.168.100.10 ./ngfec.xml
 use_ch false
 Created URI from IP address:
   ipbusudp-2.0://192.168.100.10:50001
 Address table name is file://./ngfec.xml
 >
```

Finally, to start the tool with a one-liner connected to the ngFEC requires creating
a file like `ngfec.tool` containing:

```
  add_lib /home/hazen/work/ngFECtool/ngfec.tool-device/trunk/lib/libBUTool_NGFECDevice.so
  add_device ngfec 192.168.100.10 ./ngfec.xml
```

Now we can do this:

```
  $ BUTool.exe -X ngfec.tool
```

*Summary:*

Add to `.bashrx`:

```
  echo "\"ngfec\" for ngFEC/BUTool setup"
  alias ngfec="source /home/hazen/scripts/setup_tool.sh"
```

Create `~/scripts/setup_tool.sh` with:

```
#!/bin/bash
#
# setup to run BUTool
#
 TOOLWORK=/home/hazen/work/ngFECtool
 TOOLPWD=`pwd`
 echo "Setting up BU/ngFEC tool from $TOOLWORK"
 cd $TOOLWORK/butool/trunk
 source env.sh
 cd $TOOLWORK/ngfec.tool-device/trunk
 source ngfec.env
 source /home/hazen/scripts/setup_cactus.sh
 echo "type ngfec to connect to ngFEC using ~/tables/ngfec.xml"
 alias ngfec="BUTool.exe -X $TOOLWORK/ngfec.tool-device/trunk/ngfec.tool"
 cd $TOOLPWD
```

Now when you login you can type `ngfec` to set everything up,
then `ngfec` to run the tool and connect.



*2017-09-15* (hazen)

Current work-in-progress address table is available at:
http://ohm.bu.edu/~hazen/CMS/ngfec.xml

Current (as of May 2017) ngCCM server code archive:

http://ohm.bu.edu/~hazen/CMS/ngccmserver_2017-05-11.tar.z


*2017-06-28* (hazen)

Trying to use Dan's new tool.  There are some issues.

```
  $ svn co svn+ssh://ehazen@svn.cern.ch/reps/cactus/branches/dgastler_newtool
  $ cd dgastler_newtool
  $ source env.sh
  $ source WIB.sh
  $ make
    ...
  $ BUTool.exe
  >add_device GLIB 192.168.100.10 ngfec.xml
```

Sort of works but there is an upper/lower case problem with the address table so it's useless at the moment.
Try to fix it.  Change in `glib_device.hh` change `RegisterHelper(UPPER)` to `RegisterHelper(CASE_SENSITIVE)`.
Make doesn't notice so do `make clean; make`.  Now it works.

Try to reboot with my bit file (link below) but then the board is bricked.  Finally remembered have to have *rarpd* running on `cmssun1.bu.edu`.  (type `"sudo rarpd"`)

Reload firmware using procedure below from `ngfec_test_9_2_1_b.bit` from `watt:Proj/CMS/ngFEC`.  Now we actually see the new version!

```
>r user_board_id
                                     user_board_id: 0xFEC10910
```

Getting a new copy to edit in watt:Proj/CMS/ngFEC_24:

```
 $ svn co https://ehazen@svn.cern.ch/reps/cms-firmwsrc/hcal/HCAL_ngFEC_fc7/branches/HB_HE_FC7_Vivado
 $ svn co https://ehazen@svn.cern.ch/reps/ph-ese/be/fc7/tags/fc7_5.0.2
 $ svn co https://ehazen@svn.cern.ch/reps/ph-ese/be/gbt_fpga//tags/gbt_fpga_5_0_0/
 $ svn co https://ehazen@svn.cern.ch/reps/cactus/tags/ipbus_fw/ipbus_2_0_v1
 $ cp -r fc7_5.0.2/fw/src/* HB_HE_FC7_Vivado/fw/src/
 $ edit HB_HE_FC7_Vivado/fw/tcl/ngFEC_vivado.tcl

       set GBT_PATH /home/hazen/Proj/CMS/ngFEC_24/gbt_fpga_5_0_0
       set IPBUS_PATH /home/hazen/Proj/CMS/ngFEC_24/ipbus_2_0_v1

 $ open HF_FC7_Vivado/fw/prj/ngFEC_HF_viv/ngFEC_HF_viv.xpr in Vivado 2016.4
 > source HB_HE_FC7_Vivado/fw/tcl/ngFEC_vivado.tcl    (in Tcl Console)
```

This produces a working bit file.

Edit the design to add a PLL to generate 20MHz from the LHC clock.
Add status register 58 with bits 0-30 as a 20MHz counter, bit 31 is 'locked' from the PLL.
This should appear at address `0x4000_003a`.

*2017-05-02* (yash)

Changed the address table path to read the correct registers for date and firmware version. Added the "clock" command that displays clock frequencies of the CCM device.

*2017-05-02* (eric)

New file with firmware revision and date updated for register read test:
http://ohm.bu.edu/~hazen/CMS/HCAL_FE/ngfec_test_9_2_1_b.bit

*2017-05-1* (yash, eric)

Added fwv command to the BUTool to display the firmware version running on the device. List now shows the Serial no., version and the ip address for the connected device.

Firmware and data are in `ngFEC_logic.vhd` as constants, e.g.:
```
   stat_reg(0)               <= x"fec1_0310";          -- ID "fec1" revision 3.1.0
   stat_reg(1)               <= x"2903_2017";          -- Date 2017-03-29
```

*2017-04-21* (yash)

Ran two more delay scans with power cycle with the old firmware.

[scan2](http://ohm.bu.edu/~yashagg/scan2.txt)
[scan3](http://ohm.bu.edu/~yashagg/scan3.txt)

Updated the firmware version to 9.2.1 [firmware_ver](http://ohm.bu.edu/~yashagg/firmware_ver.txt)

Power cycled again and ran the delay scan again

[scan4](http://ohm.bu.edu/~yashagg/scan4.txt)

*2017-04-21* (eric)

Building new firmware.  Current user version is 1.2.1.  Change to 9.2.1 for testin.

*2017-04-21* (yash, eric)

Note: CCM Board J15. We turned switches 1 and 2 towards the serial board, cycled the power and connected the cable. Ran the script uart_rpd_scan.py.

Results:
[scan1](http://ohm.bu.edu/~yashagg/scan1.txt)

*2017-04-13* (yash, eric)

Made a backup image of firmware supplied on flash card with ngFEC.
Copied to another flash card and booted the module successfully.

Using glibtool2.exe, we can read the firmware revision:

```
>r system_regs.firmware_id
Looking for "system_regs.firmware_id"
Name system_regs.firmware_id translated to address 0x2
   system_regs.firmware_id: 0x50021f79
```

(N.B. there are bugs in glibtoo2; it doesn't handle masks correctly).

To reprogram firmware using the CCM server:

```
  $ /opt/ngFEC/ngFEC.exe -c -p 64000
  tput fec-fg go_offline
  boot fec ...image_file_name.bit
  tput fec-fg go_online
```


*2017-04-11* (hazen)

Attempting an ngFEC build to test in the lab. 2016.4 build is at `~/Proj/CMS/ngFEC`.


*2017-04-10* (hazen)

Proper connections for power and fiber:

<img src="http://ohm.bu.edu/~hazen/CMS/HCAL_FE/pix/power_conn_sm.jpg">
<img src="http://ohm.bu.edu/~hazen/CMS/HCAL_FE/pix/ccm_fiber_sm.jpg">
<img src="http://ohm.bu.edu/~hazen/CMS/HCAL_FE/pix/fec_fiber_sm.jpg">]

*2017-04-05* (hazen)

ngFEC installed.  CCM server installed by Alan C on cms4.bu.edu.  Basic instructions:

```
$ /opt/ngFEC/ngFEC.exe -c -p 64000
...
table
timestamp
...
tget HE2-cg fnrR1      # read front-end I2C regs
...
get fec-sfp[2-7]_status.RxLOS_rr   # read fiber status (LOS)
```


*2017-03-31*

 * https://svnweb.cern.ch/cern/wsvn/ph-ese/be/fc7/tags/fc7_5.0.1/doc/fc7_user_manual.pdf

*2017-03-30*

Trying using Vivado 2016.4 on home machine.

In `ngFEC_vivado.tcl`:

```
set GBT_PATH /home/hazen/Proj/CMS/ngFEC/gbt_fpga_5_0_0
set IPBUS_PATH /home/hazen/Proj/CMS/ngFEC/ipbus_2_0_v1
```

Change version by 1 to `x"fec1_0311"`.
Build in 15-20 min on home machine.

Apparently IP address is fixed at 192.168.0.80 in `ngFEC_logic.vhd`:

```
   ip_addr_o                 <= x"c0_a8_00_50";
```

But see [FC-7 Adventures](FC-7_Adventures.md).  There is more to this than meets the eye.

Now attempting to reproduce the success on watt.bu.edu using Vivado 2016.4.


*2017-03-28*

Downloading ngFEC firmware for Vivado per [Costanza Email 2017-03-25](Costanza_Email_2017-03-25.md), esp [README.txt](https://svnweb.cern.ch/trac/cms-firmwsrc/browser/hcal/HCAL_ngFEC_fc7/README.txt).

```
 svn co https://ehazen@svn.cern.ch/reps/cms-firmwsrc/hcal/HCAL_ngFEC_fc7/branches/HB_HE_FC7_Vivado
 svn co https://ehazen@svn.cern.ch/reps/ph-ese/be/fc7/tags/fc7_5.0.2
 svn co https://ehazen@svn.cern.ch/reps/ph-ese/be/gbt_fpga//tags/gbt_fpga_5_0_0/
 svn co https://ehazen@svn.cern.ch/reps/cactus/tags/ipbus_fw/ipbus_2_0_v1
```
