# FuzixBuildNotes
Trying to build FUZIX for z80pack.

 * Install sdcc from repo
 * Clone Alan's git https://github.com/EtchedPixels/FUZIX
   * https://github.com/EtchedPixels/FUZIX/commit/f5de5a8da1456e387ba0330d6e6e85e3f6ad76e3

**2023-03-06**

To start:
```
  $ cd ...FUZIX
  $ make -j 8 |& tee logfile.txt      # takes ~ 30+ min
  $ cd Images/z80pack
  $ cp hd-fuzix.dsk ~/src/z80pack-1.36/cpmsim/disks/library
  $ cd ~/src/z80pack-1.36/cpmsim
  $ ./eric-new
```

Works ok-ish.  There's a C compiler of sorts in `/usr/bin/sccz80` but no library or assembler I can find.

**2023-02-16**

Starting again.  Updated Ubuntu to 22.04 and reinstall sdcc from repo.
Update FUZIX, now ...6c61cc1f95b3450.

Instally byacc.  Set target to z80pack and build with `make all -j 8 |& tee build_log.txt`.

*2020-11-25*

Filesystem seems to get borked whenever we try *vi /etc/passwd*.  Maybe should be using vile?

Try to enable swap with updated start script:
```
#!/bin/sh

rm -f disks/drive[aij].dsk
ln disks/library/eric-fuzix.dsk disks/drivea.dsk
ln disks/library/eric-hd-fuzix.dsk disks/drivei.dsk
ln disks/library/hd-fuzix2.dsk disks/drivej.dsk

./cpmsim $*
```

`hd-fuzix2.dsk` is a 4080*1024  byte disk with no FS.  Used as swap in original fuzix script.

Question:  how to tell if swap is enabled?

Another thought:  maybe the old FS on the boot floppy is causing trouble.  Create *makeboot* script)
```
#!/bin/bash
#
# try to make a fuzix boot floppy
# size is 77 * 26 * 128 = 256256 bytes

echo "Creating $1 as bootdisk"

dd if=/dev/zero of=$1 bs=1 count=256256
dd if=~/work/FUZIX/Kernel/fuzix.bin of=$1 bs=1 seek=193024 conv=notrunc
dd if=~/work/FUZIX/Kernel/platform-z80pack/bootblock.bin  of=$1 bs=1 count=128 conv=notrunc
```

It seems to work as well as the other boot disk.


*2020-11-24*

On work machine.  Clean install z80pack 1.36 and build.  Set to yacc as in README:
```
 - sudo apt-get install -y byacc
 - sudo update-alternatives --set yacc /usr/bin/byacc
```

*Moving to home*

Clean install of z80pack 1.36 here too.

Trying to figure out how to make a bootable floppy.  Restored the script "createdrives"
from old SVN.  Found an old set of instructions which don't work.  Some observations:

CPM disk images in z80pack are 256256 bytes long.  This is not a multiple of 512, and
thus AFAIK cannot be created by FUZIX "mkfs" tool.  A buried note in git says:

"If you put just a kernel on floppy and the image on hard disk and boot with that as root fs it should work,"

In `Kernel/platform-z80pack/README` it says:

```
Put the kernel at the end of a floppy image from cyl 60
Add the fs in the first 58 cyls (366 blocks)
Put the bootblock in sector 0
dd the kernel image to offset 193024
ie
  dd if=fuzix.bin of=drivea.cpm bs=1 seek=193024 conv=notrunc
```

This is all very well, but not obvious at all how to handle this with the tools provided.
First thing to try is to grab the `drivea.cpm` image and replace the boot block
and kernel with updated ones, leaving the FS alone.

```
$ dd if=~/work/FUZIX/Kernel/fuzix.bin of=fuzix.dsk bs=1 seek=193024 conv=notrunc
48879+0 records in
48879+0 records out
48879 bytes (49 kB, 48 KiB) copied, 0.062852 s, 778 kB/s
```

Try this disk as `drivea.dsk` and the output of `build-filesystem-ng` as `drivei.dsk`.  Fails miserably....

```
./cpmsim $*
hazen@eric-x20:cpmsim$ ./eric-fuzix

#######  #####    ###            #####    ###   #     #
     #  #     #  #   #          #     #    #    ##   ##
    #   #     # #     #         #          #    # # # #
   #     #####  #     #  #####   #####     #    #  #  #
  #     #     # #     #               #    #    #     #
 #      #     #  #   #          #     #    #    #     #
#######  #####    ###            #####    ###   #     #

Release 1.36, Copyright (C) 1987-2017 by Udo Munk

CPU speed is unlimited

Booting...

-

^
INT disabled and HALT Op-Code reached at 7735
```

The original Fuzix disks supplied with z80pack work a little better:

```
hazen@eric-x20:cpmsim$ ./fuzix

#######  #####    ###            #####    ###   #     #
     #  #     #  #   #          #     #    #    ##   ##
    #   #     # #     #         #          #    # # # #
   #     #####  #     #  #####   #####     #    #  #  #
  #     #     # #     #               #    #    #     #
 #      #     #  #   #          #     #    #    #     #
#######  #####    ###            #####    ###   #     #

Release 1.36, Copyright (C) 1987-2017 by Udo Munk

CPU speed is unlimited

Booting...

-
FUZIX version 0.1
Copyright (c) 1988-2002 by H.F.Bower, D.Braun, S.Nitschke, H.Peraza
Copyright (c) 1997-2001 by Arcady Schekochikhin, Adriano C. R. da Cunha
Copyright (c) 2013-2015 Will Sowerbutts <will@sowerbutts.com>
Copyright (c) 2014-2015 Alan Cox <alan@etchedpixels.co.uk>
Devboot
480kB total RAM, 416kB available to processes (15 processes max)
Enabling interrupts ... ok.
bootdev: 0
Mounting root fs (root_dev=0, rw): OK
Starting /init
init version 0.8
```

Hangs after that, but it seems control is being passed to the kernel from the boot loader and thus to init.

Time to read the boot loader.  Sigh.  Here's some interesting stuff about the boot disk:

```
;	Floppy loader:
;	Our boot disc is 77 tracks of 26 x 128 byte sectors, and we put
;	the OS on tracks 58+, which means we can put a file system in the
;	usual place providing its a bit smaller than a whole disc.
```

77 * 26 * 128 = 256256 - that's the size of e.g. `diska.cpm`.  Bingo.

Check the OS offset:  193024 = 58 * 26 * 128.  Or 0x2f200.

Dump some of my disk image (after the dd) and I do see the start of fuzix.bin
at 0x2f200.  But interestingly not in the old `fuzix.dsk` supplied with z80pack.
There, the kernel starts at 0x30c00, which is track 60, not track 58.  Hmm...

OK, the bootloaders are different.  Try patching in the new one:

```
$ dd if=~/work/FUZIX/Kernel/platform-z80pack/bootblock.bin  of=eric-fuzix.dsk bs=1 count=128 conv=notrunc
128+0 records in
128+0 records out
128 bytes copied, 0.00107722 s, 119 kB/s
```

Now it works!

```
$ ./eric-fuzix

#######  #####    ###            #####    ###   #     #
     #  #     #  #   #          #     #    #    ##   ##
    #   #     # #     #         #          #    # # # #
   #     #####  #     #  #####   #####     #    #  #  #
  #     #     # #     #               #    #    #     #
 #      #     #  #   #          #     #    #    #     #
#######  #####    ###            #####    ###   #     #

Release 1.36, Copyright (C) 1987-2017 by Udo Munk

CPU speed is unlimited

Booting...

-
FUZIX version 0.4pre1
Copyright (c) 1988-2002 by H.F.Bower, D.Braun, S.Nitschke, H.Peraza
Copyright (c) 1997-2001 by Arcady Schekochikhin, Adriano C. R. da Cunha
Copyright (c) 2013-2015 Will Sowerbutts <will@sowerbutts.com>
Copyright (c) 2014-2020 Alan Cox <alan@etchedpixels.co.uk>
Devboot
484kB total RAM, 420kB available to processes (15 processes max)
Enabling interrupts ... ok.
bootdev:
Mounting root fs (root_dev=0, ro): OK
Starting /init
init version 0.9.0ac#1
Checking root file system.

 ^ ^
 n n   Fuzix 0.3.1
 >@<
       Welcome to Fuzix
 m m

login: root

Welcome to FUZIX.
#
```


*2020-11-22*

Running 'make' in FUZIX with z80pack as target.  It sure is taking a long time.
Start over:
```
  $ make -j 8 | tee build_log.txt
```
Woohoo!  It seems to have finished!  Now to figure out what was actually built.
Did `make all` and some more stuff happened.

I can build filesystems using the scripts but unclear how to make a bootable one
Note that I used the sdcc from the repo which Alan has recommended against.


