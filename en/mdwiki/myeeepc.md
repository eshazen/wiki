# myeeepc
*'5/20/10*

Updated at some point to 32G SSD and 2G RAM.  Now installing Ubuntu 10.04.
Partitions:

```
  4G Flash    /
  32G Flash   /usr   (10G)
              /home  (10G)
              -free- (10G)

```
(All are ext4).  To Boot, had to make the 32G the first HD in the Bios and make it the boot device, with the 4G as the second device.  Otherway round gave the dreaded "Error 15" from grub.

At some point, got stuck with an immediate "error: no such device / grub rescue>" immediately on power-up.  Beat on F2 right after power-up finally got me to the BIOS.

All installed, boots ok.  Doing all updates and rebooting.  Now install virtualbox-ose from the repositories, along with guest additions.  Installing Win7 from ISO image.  Found that "Hit F12 to select boot device" was off the bottom of the VM screen; nothing happened until I press F12 and then "c" to select CD-ROM.  Now it is installing *very slowly*.

Attempting to get the WiFi working per this:

http://ubuntuforums.org/showthread.php?t=1476007



*'6/3/09*

One gripe:

Occasionally at boot the BIOS hangs scanning USB devices.  The only solution seems to be
to cycle the power.

eeeBuntu 3.0 is out!  I''m going to try installing it now.

Use [Unetbootin](http://unetbootin.sourceforge.net/)
to a USB key.  Boot from it, no problem.  Run the install script.  Partition
setup (using manual partitioning):

```
  16G flash    /
   4G flash    /home
   8G SD card  /dos     (for movies, etc)

```
I chose this rather than putting root on the 4G because with eeeBuntu 2 after
I installed the stuff I needed to get to work (Openoffice 3, g++, LaTeX etc)
it got full.

The install went fine.  Let the update manager do it''s thing.

Try to reboot.  Uh-oh!  The 16G SSD cannot be selected as a boot device.
(I can boot by hitting ESC for the boot menu).  I guess that means I need
to install grub on the 4G and point it to the 16G.  Time to get out the
grub docs...

Not so good!  I''m sure someone could figure this out.
Try again with new partitioning scheme:

```
  /dev/hda5    /      3.7G   4G SSD
  /dev/hdb1    /usr   10G    16G SSD
  /dev/hdb2    /home  6G
  /dev/hdd1    /dos   8G     SD card

```


*'Random Links*

[64G Runcore SSD](http://search.stores.ebay.com/MyDigitalDiscount-com_runcore-eee_W0QQfcdZ2QQfciZ11QQfclZ4QQfromZR10QQfsnZMyDigitalDiscountQ2ecomQQfsooZ1QQfsopZ1QQfsubZ1QQsaselZ5183049QQsofpZ0)


*'5/18/09*

I just got back from a week-long trip to CERN where I used only my eee PC.
It was a very positive experience (as long as I kept my reading glasses handy!)

The keyboard continues to be an annoyance.  I can touch-type on it now, but the
location of the up-arrow where the right shift key should be is really problematic.
Otherwise, I have no hardware complaints.

I have some complaints about eeebuntu... I think I may try
the Ubuntu 9.04 distro instead
(See [tombuntu page](http://tombuntu.com/index.php/2009/05/04/installing-ubuntu-904-on-the-eee-pc-901/)
with some tips).

I do have one BIOS/hardware problem, which is that about 1 in 4 times it fails
to boot, hanging at the "scanning USB devices" message in the BIOS POST output.

*'5/4/09*

I received today my linux-edition Asus eee PC 901.  Quick initial impressions:

 * Very nice form factor, perfect size/weight
 * Tiny keyboard which may be eventually a show-stopper for me (I have large hands)
 * Very good display quality, though the resolution is as expected pretty limiting.

I find the installed distro rather lame, though my kids love it!  I''m now attempting
to install eeebuntu.  It has been a chore.

First, download eeebuntu-2.0-standard.iso.  Use UNetboootin on Windows XP to make
a bootable 1G USB stick.  Hit ESC during eee boot, get boot menu, select USB drive.
Initial eeebuntu menu comes up, but all options produce no action other than restarting
the 30s countdown.  Reformat the stick, make one FAT32 partition, try using Red Hat''s
isostick.sh.  Same problem.  Try eeebuntu-2.0-nbr.iso.  Now it''s worse... just get
a "boot fail" message.  I have had some weird problems with this stick before, so...

Go buy two new 4G PNY sticks.  Use as-is (FAT32) with UNetbootin again.  Booting again
fails.  Take out the 8G SD card I put in the slot at some point.

*'It works!*

Playing with eeebuntu nbr now.  After 15 minutes it is clear that I prefer this distro.
Install it to the SSD.  Delete two 800M and 3200M parts (leave the two tiny ones, what for?)
and make one big ext3 as /.  Leave the 16G alone.  Tentative plan for later:

 * Split 16G between /opt for big packages and /scratch
 * put /home on an SD card





