# FuzixOn68k

*2020-02-02*

 * https://github.com/ChartreuseK/68k-Monitor/ running on 'simple1' Musashi machine.
 * http://home.earthlink.net/~schultdw/cpm68/simulator.html built and running with some hacking to match the current state of Musashi in http://edf.bu.edu/svn/edf/EricHome/68kSystem/Musashi/cpm
 * FUZIX builds for tiny68k target

*2020-02-01*

 * Cloned the FUZIX repository
 * Got tools from [here](https://launchpad.net/~p-pisati/+archive/ubuntu/fuzix/+index?field.series_filter=trusty)
 * Installed `m68k-uclinux-gcc`, `m68k-uclinux-binutils`, `m68k-uclinux-elf2flt}}.
 * Set target to tiny68k
 * Try 'Make'
   * Fails on elf2flt.  Edit `...FUZIX/Applications/util/Makefile.68000` change `elf2flt` to `m68k-uclinux-elf2flt`
   * Never mind, appears in many places, try a symlink as:

```
  $ cd /usr/bin
  $ sudo ln -s m68k-uclinux-elf2flt elf2flt
```

Now the make succeeds!

Looking at the Musashi simulator here: https://github.com/kstenerud/Musashi

 * Clone to `~/Toys/68kSystem/Musashi` on home.  De-git and move to `EricHome/68kSystem/Musashi` in svn.
 * Builds with no problem
 * The example code `osd_linux` is completely broken.  Replace it and fix a few things.  Now it runs!
 * Grab EASy68k.  Windows but works fine in wine.
 * Installed `srecord` package.

Build using EASy68k and EASyBIN makes a binary file which runs in Musashi.  Now we're all set to create a disk-based system and run an OS, ha ha ha!

Here's a promising simple monitor:
 * https://github.com/ChartreuseK/68k-Monitor/
 * https://github.com/ChartreuseK



