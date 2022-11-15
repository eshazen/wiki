# PetaLinuxUbuntu

Installing Petalinux tools on Ubuntu

 * [Reference Guide](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_4/ug1144-petalinux-tools-reference-guide.pdf)

*2017-03-06*

Last week, installed VM with 16.04.  System VDI (sda1) too small at 100G.  With Vivado 2016.4 it's 80% full.
Created a new HD of 500G as `/usr1`.  Install Vivado and Petalinux both 16.4 and 16.2 (latter because
the picozed BSP requires 16.2)

Disk setup:

```
  /dev/sda1   /      91G
     /media/hazen/oldroot/home/hazen/VirtualBox VMs/XUbuntu16.04/Xubuntu 16.04.vdi
     /dev/sdc5 on host
  /dev/sdb1   /usr1  493G
     /home/hazen/VirtualBox VMs/Xubuntu 16.04/XU16.04Extra.vdi
```
Cloning `/usr1` to Host `/dev/sda5` mounted at `/media/hazen/scratch1`
directory `hazen/VirtualDIsks` as `XU16.04Extra2.vdi`.

Xilinx setup:

```
  /opt/Xilinx               Vivado 16.4 with SDK
  /usr1/Xilinx              Vivado 16.2 with SDK
  /usr1/pkg/petalinux       Petalinux 16.4 tools
  /usr1/pkg/petalinux_16.2  Petalinux 16.2 tools
```
