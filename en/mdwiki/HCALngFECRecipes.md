# HCALngFECRecipes
Nav: [HCALFrontEnd](HCALFrontEnd.md)

Note that these instructions may be specific to `cms4.bu.edu` but in principle should be generally applicable.

## Start / Check CCM Server

The CCM server should normally be running.  You can check with a ps/fgrep incantation:
```
  $ ps aux | fgrep ccm
  campbell 11538  4.3  2.7 1730236 441476 ?      Sl   Apr05 1675:00 bin/ngccm -s -p 64000 -d /tmp/heBU_0 -f etc/top_heBU_0.txt
  hazen    16591  0.0  0.0 112652   884 pts/4    S+   09:25   0:00 grep -F --color=auto ccm
  yashagg  31552  0.4  0.1 1089336 28984 ?       Sl   Apr21  73:00 /opt/ngFEC/ngccm-0.0.12-02.el6/opt/ngccm/bin/ngccm -c -p 64000
```

It's a bit confusing because the command-line tool has the same name (ngccm) as the server.
The server is the line with the "-d /tmp/heBU_0" option.

If there is no server running, you can start it with:

```
  $ /opt/ngFEC/start_ngccm_heBU_0.sh
```

However, you may have to fiddle with file ownership as currently it is set up to run as user 'campbell'.

After starting the cli, it is suggested to enter the commands:
```
  table
  timestamp
```
to switch on a tabular view instead of strict one line output for one line input
and to add a timestamp to the output

## Run CLI (command-line interface) to CCM server

```
  /opt/ngFEC/ngFEC.exe -c -p 64000
```

There is some command documentation here:
https://twiki.cern.ch/twiki/bin/viewauth/CMS/HCALngFECprotocol
(not that I found it all that useful!)

## Read all fec registers
```
  tget fec-fg fnrR1
```

## Force update of cached register values
```
  tput fec-fg short
```
will force an immediate "short" ( ie read only register and sensor value ) readback
```
tput fec-fg long
```
will force an immediate "long" ( ie readwrite register ) readback

## Read fiber link status on ngFEC
```
get fec-sfp[2-7]_status.RxLOS_rr
tget fec-fg fnrR1    # read all link-related status
tput fec-fg short    # force update
```
This displays the "LOS" (loss of signal) for each fiber SFP from top to bottom.

## Load new ngFEC Firmware

```
  tput fec-fg go_offline
  boot fec ....file.bit
  .... wait till finished
  tput fec-fg go_online
```

## Read/update a specific value
```
tput fec-fg short
get fec-LHC_clk_freq
```

## Turn front-end power on/off =
```
put HE2-bkp_pwr_enable 1
put HE2-bkp_pwr_enable 0
```

## Read front-end temps/voltages etc
```
tget HE2-cg fnrR1
```
