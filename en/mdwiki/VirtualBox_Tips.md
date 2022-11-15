# VirtualBox_Tips
I routinely use Sun VirtualBox to run a windows guest OS under linux.  My current setup is Ubuntu 10.04 64-bit host OS with Windows 7 as guest.  This has worked fine for me so far.

## HOWTO resize guest VDI disk image

This worked for me for VirtualBox version _'3.1.6_OSE r59338_.  I had an existing VDI which was variable size, but too small.  Here is what I did to resize it:

1. Create new HD of desired size (also variable-size)

2. Clone the existing disk:

```
   VBoxManage clonehd --existing ExistingTooSmall.vdi NewMuchBigger.vdi

```
3. Download [GParted live CD](http://gparted.sourceforge.net/livecd.php)

4. Create a new virtual machine with the cloned VDI disk attached

5. Attach the GParted ISO as a CD-image and boot from it (take defaults, let GUI for GParted boot)

6. Select the large NTFS partition, and resize it to fill the disk

7. Shutdown, reboot into Windows 7, let it do the disk check it will want to


