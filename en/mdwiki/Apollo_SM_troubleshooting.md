# Apollo_SM_troubleshooting



### Eth0 not coming up

Depending on what the Zynq RJ45 jack is connected to, the autoneg can do some strange things.
Please check /fw/startup.sh to see the state of the line
```
root@zynq_os:~# cat /fw/startup.sh
echo Startup script!
ethtool -s eth0 speed 100 duplex full autoneg off
```
Try toggling if the ethtool line is commented out.

----

### IPMC/Zynq BOOT handshaking.

Useful commands for debugging
 * SHM is the shelf manager ip
 * BLAD_IPMB_ADDR is blade IPMC address 0x9a for physical slot 1


### Find blade address

> ipmitool -I lanplus -H SHM -P "" fru list

or look at SM webpage

### Connect to Zynq via SOL (works by default, IPMC can override destination)

> ipmitool -v -I lanplus -H 192.168.20.6 -U "soluser" -P "<PWD>" -C 0 sol activate



### Force reset the blade

> ipmitool -I lan -H SHM -P "" -t BLADE_IPMB_ADDR mc reset cold


The ZYNQ must write a '1' to SLAVE_I2C.S1.SM.STATUS.DONE
If this doesn't happen, the IPMC will shut down the blade.

----
'''CentOS upgrades to partition 2 (root)
'''
Network:
 * Locally extract as root the tarball (tar -zxpf) and then rsync to host
 * sudo tar --numeric-owner -p -zcf ../2020-01-29-SD_p2.tar.gz ./
 * sudo rsync -P -r -l -p -o -g -W --numeric-ids ./ root@host:/
 * sudo rsync -P -r -l -p -o -g -W -c --numeric-ids ./ root@host:/
 * sudo rsync -e 'ssh -p tunnel_port' -P -r -l -p -o -g -W -c --numeric-ids ./ root@host:/


----
'''IPMC issues

devboard power up:
 * SETHA 0x34 - set the hw address so the IPMC can power up


----
'''Restart shutdown Blade

First figure out the ipmb address of the blade.  One way to do this is via the shelf manager webpage.  Since you are probably in a shell, use lynx.

> lynx IP
Shelf IP = 192.168.0.171 BU,  192.168.0.2 TIF

To get the info, select Boards/IPMC/AMCs->Boards->Show

Once the page refreshes, go to the bottom and select the board physical slot you want.

Once you submit you'll see a listing with the physical address and the IPMB address

ex:

>Physical Slot # 1
>   9a: Entity: (0xa0, 0x60) Maximum FRU device ID: 0x00
>       PICMG Version 2.3
>       Hot Swap State: M4 (Active), Previous: M3 (Activation In Process), Last State Change Cause: Normal State Change (0x0)
>   9a: FRU # 0
>       Entity: (0xa0, 0x60)
>       Hot Swap State: M4 (Active), Previous: M3 (Activation In Process), Last State Change Cause: Normal State Change (0x0)
>       Device ID String: "APOLLO-BLADE"
>Physical Slot # 1
>   9a: Entity: (0xa0, 0x60) Maximum FRU device ID: 0x00
>       PICMG Version 2.3
>       Hot Swap State: M4 (Active), Previous: M3 (Activation In Process), Last State Change Cause: Normal State Change (0x0)
>   9a: FRU # 0
>       Entity: (0xa0, 0x60)
>       Hot Swap State: M4 (Active), Previous: M3 (Activation In Process), Last State Change Cause: Normal State Change (0x0)
>       Device ID String: "APOLLO-BLADE"


Now we can see that physical slot #1 has ipmb address 0x9a and is an Apollo blade

Now we can apply a warm restart with
>ipmitool -I lanplus -H SHELF_MAN_IP -P "" -t IPMB_ADDR mc reset warm

>ipmitool -I lanplus -H 192.168.0.2 -P "" -t 0x9a mc reset warm
@CERN

----
### Blade time
Check that you have /dev/rtc0, if you don't, you are probably missing the rt clock battery.

Get time from ntp
>ntpdate ntp.server

Set RT clock from system clock
>hwclock -w

Read the RT clock
>hwclock -r

----
### Network troubles
Use SOL to connect, reset the networking and restart DHCP lease

Using BUTool's IPMISOL plugin, connect to the blade via the IPMC
```
#!shell
dan@tesla IPMC_plugin]$ BUTool.exe  -s 192.168.20.2
Registered device: IPMISOL
Registered device: GENERICIPBUS
>
>
>c
Connection status: 3
ipmi SOL connection established at address: 192.168.20.2
>sc
Opening SOL comm ...
Press Ctrl-] to close

CentOS Linux 7 (AltArch)
Kernel 4.14.0-xilinx-v2018.2 on an armv7l
```
Cycle the ethernet port
```
#!shell
[root@apollo02 ~]# ifconfig eth0 down
[root@apollo02 ~]# macb e000b000.ethernet eth0: link down

[root@apollo02 ~]#
[root@apollo02 ~]#
[root@apollo02 ~]# ifconfig eth0 up
macb e000b000.ethernet eth0: link up (10/Half)
```
Release dhcp lease and re-run dhcp
```
#!shell
[root@apollo02 ~]# dhclient -r eth0
[root@apollo02 ~]#
[root@apollo02 ~]#
[root@apollo02 ~]# dhclient eth0
```

----
### Update over serial
```
#!shell
Host side                              Remote side

cat file | base64 > file_b64
                                       cat > file_b64
minicom's ctrlA-S => send 'file_b64'
                                       cat file_b64 | base64 --decode > file
```
