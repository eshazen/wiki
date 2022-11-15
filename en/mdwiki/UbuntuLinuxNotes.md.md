# UbuntuLinuxNotes.md
### Tunnel for SVN on gauss without VPN

Our server gauss.bu.edu only allows local BU access to SVN etc.  Could use VPN but this is complicated.
Here's a work-around:

```
  $ ssh ohm
  $ ssh gauss
  $ ssh -N -R 5432:localhost:80 <home_ip>
```

Then

```
   [home] $ svn co http://localhost:5432/svn/botlab.dosi
```




### Close stuck xfce4 session remotely

Do this when x2go connects to a hung xfce4-session, or to solve other issues.

```
  $ killall xfce4-session
```

### Install tldr, fd

Suggested by MIT: https://missing.csail.mit.edu/2020/shell-tools/

```
  $ sudo apt install tldr
  $ sudo apt install fd-find
  $ ln -s $(which fdfind) ~/.local/bin/fd
  $ sudo apt install ripgrep (provides rg)
  $ sudo apt install fasd
```

### Failed update due to expired debug keys (March 2021)

update fails with something like this:

"[ expired] Ubuntu Debug Symbol Archive Automatic Signing Key (2016)"

See: https://bugs.launchpad.net/ubuntu/+source/ubuntu-keyring/+bug/1920640/comments/3

```
Hi,

This is a workaround you can use temporarily:

$ wget -O- http://ddebs.ubuntu.com/dbgsym-release-key.asc | sudo apt-key add -
$ sudo apt update

The key was extended temporarily.
```

### !PulseAudio Sound issues

After e.g. using external monitor on Thinkpad, sound stops working.  Only unplugged HDMI is listed as output device in pulseaudio.  Fix is to type:

```
  $ pacmd set-card-profile 0 output:analog-stereo
```



### Installing remote printers in Physics

To print to e.g. the EDF laser printer:

 * Start->Settings->Printers
 * Add
 * Network Printer->LPD/LPR Host or Printer
   * Host: buphyk.bu.edu
   * Queue: edf or edf-duplex
 * For printer driver:
   * Generic
   * Raw Queue

### Mounting logical volumes on external disks

To mount a logical volume on an external (e.g. removed from old machine) disk:
```
 $ sudo apt install lvm2    # (if needed)
 $ sudo pvs
  /run/lvm/lvmetad.socket: connect failed: No such file or directory
  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
  PV         VG         Fmt  Attr PSize   PFree
  /dev/sdb5  xubuntu-vg lvm2 a--  465.28g    0
```
Note the name `xubuntu-vg`.
```
 $sudo lvdisplay xubuntu-vg
  /run/lvm/lvmetad.socket: connect failed: No such file or directory
  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
  --- Logical volume ---
  LV Path                /dev/xubuntu-vg/root
  LV Name                root
  VG Name                xubuntu-vg
  LV UUID                xXguet-eimr-l0Y4-dGjb-2wQ4-6nba-4jHBqr
  LV Write Access        read/write
  LV Creation host, time xubuntu, 2016-10-26 14:07:10 -0400
  LV Status              available
  # open                 1
  LV Size                457.48 GiB
  Current LE             117114
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
   * currently set to     256
  Block device           253:0
```
Note the path `/dev/xubuntu-vg/root`.
```
  $ sudo lvchange -ay /dev/xubuntu-vg/root
  $ sudo mount /dev/xubuntu-vg/root /mnt
```
(whew!)


### Installing/updating !VirtualBox

As of about 2018-02-01 an Ubuntu 16.04 security update badly crashes VB causing kernel module corruption on my machine so nothing worked afterwards.  Fixed borked kernel modules with:
```
  $ sudo dpkg-reconfigure linux-image-`uname -r`
```

Then clean up and reinstall VB with:
```
  $ sudo apt purge virtualbox*
  $ sudo apt install virtualbox-5.2 dkms
  $ VBoxManage extpack install .....vbox-extpack
```

(download the extension pack from https://www.virtualbox.org/wiki/Downloads)

### Fix ctrl+space

The package "ibus" which provides international keyboard input steals ctrl+space so it doesn't work to set the mark in emacs.  Some googling reveals that the configuration settings for this package are confusing/broken, so best to remove it:

```
sudo apt-get purge ibus
sudo killall ibus
```

### Changing Keyboard Mapping

*Undid all this* June 2018 because it interacts badly with VirtualBox, rdesktop etc

How to permanently change keyboard mapping in Ubuntu 14 (and later).
Apparently they stopped using *xmodmap* a while ago.

First, to get rid of "Caps Lock" and make it an alternative Ctrl key,
edit `/etc/default/keyboard` and edit line to read:
```
  XKBOPTIONS="ctrl:nocaps"
```

(can also use "ctrl:swapcaps" if you want to keep caps lock where CTRL is)

Second, to swap ESC and !Tilde/Backquote keys (for a PC105/US-english setup):

Edit `/usr/share/X11/xkb/symbols/pc`:
```
  key <ESC> {[  Escape ] };
change to:
  key <ESC> {[ quoteleft,   asciitilde     ]   };
```

Edit `/usr/share/X11/xkb/symbols/us`:
```
  key <TLDE> {      [     grave,    asciitilde      ]       };
change to:
  key <TLDE> {[  Escape    ] };
```

Then `sudo dpkg-reconfigure keyboard-configuration` and select
"Generic 105-key (Intl) PC", "English (US)", "English (US)", "Yes".

### Change Ethernet device to eth0

Create file `/etc/udev/rules.d/70-persistent-net.rules` containing a line like:
```
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:b5:6d:04:82:96", ATTR{dev_id}=="0x0", ATTR{type}=="1", NAME="eth0"
```

This works for USB ethernet dongle on Thinkpad laptop, at least.
