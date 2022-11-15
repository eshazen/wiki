# ComediDebugging
In theory modern linux (20.04) has support via [Comedi](https://www.comedi.org/) for the NI-6501.
When you plug it in it all looks very promising.  Make sure comedi is installed:

```
  $ apt install libcomedi-dev
```

When you plug in the board it looks very promising:

```
$ dmesg
[15683.830955] usb 3-7: new full-speed USB device number 10 using xhci_hcd
[15683.981620] usb 3-7: New USB device found, idVendor=3923, idProduct=718a, bcdDevice= 1.00
[15683.981627] usb 3-7: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[15683.981630] usb 3-7: Product: NI USB-6501
[15683.981633] usb 3-7: Manufacturer: National Instruments
[15683.981636] usb 3-7: SerialNumber: 01F13904
[15683.983499] comedi comedi0: driver 'ni6501' has successfully auto-configured 'ni6501'.
```

Then identify the board:

```
  $ comedi_board_info
  /dev/comedi0: Permission denied
  $ sudo chmod go+rw /dev/comedi0
  $ hazen@dhcp-acadmin-128-197-41-110:~$ comedi_board_info

overall info:
  version code: 0x00074c
  driver name: ni6501
  board name: ni6501
  number of subdevices: 2
subdevice 0:
  type: 5 (digital I/O)
  flags: 0x00030000
  number of channels: 24
  max data value: 1
  ranges:
    all chans: [0 V,5 V]
  command:
    not supported
subdevice 1:
  type: 6 (counter)
  flags: 0x10030000
  number of channels: 1
  max data value: 4294967295
  ranges:
    all chans: [0,1]
  command:
    not supported
```

Copy over and build the demo programs:

```
   $ cp -r /usr/share/doc/libcomedi-dev/demo .
   $ cd demo
   $ make
   $ ./dio
configuring pin 0 on subdevice 0 for input.
comedi_dio_config: Connection timed out
```

All attempts to do I/O result in the "Connection timed out".

Check out the comedi and comedilib source per [download instructions](http://www.comedi.org/download.html).
No where is there any indication of support for the NI-6501.  I think it's in the kernel source.

So, grab the kernel source and stuff to build everything (from [notes here](https://blog.kernelcare.com/live-patching-ubuntu-20.04-lts-focal-fossa-linux-kernel-with-kpatch)).

```
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential devscripts \
ccache \
gawk libelf-dev libssl-dev linux-source flex bison
```

Find that the ni6501 driver lives in `.../drivers/staging/comedi/drivers/ni_usb6501.c`.

Install the debug symbol package sources per [instructions](https://wiki.ubuntu.com/Debug%20Symbol%20Packages).  Then install the kernel with debug symbols:

```
   $ sudo apt install linux-image-$(uname -r)-dbgsym
```

Patch the source for uptime from [notes here](https://blog.kernelcare.com/live-patching-ubuntu-20.04-lts-focal-fossa-linux-kernel-with-kpatch).

Now try to build a new module:

```
  kpatch-build -t vmlinux -v /usr/lib/debug/boot/vmlinux-5.4.0-52-generic uptime.patch
```

The claim is this takes hours, so I'm going home.  It's running in `/home/hazen/work`.


