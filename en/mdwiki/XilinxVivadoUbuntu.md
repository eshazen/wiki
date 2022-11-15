# XilinxVivadoUbuntu
### 2018.2+others hangs on "generating installed device list"
install ncurses5-compat-libs or ncurses5

### 2018.3 Doesn't work with multiple monitors

Yep. It's true :(  There is no solution except to unplug them.  I guess Xilinx doesn't really support Linux.

 * https://forums.xilinx.com/t5/Installation-and-Licensing/Vivado-2018-3-won-t-launch-on-Ubuntu-18-04-java-lang-reflect/td-p/934610



### Ethernet Device Name

For older version (e.g. 2015.4) the Ethernet device must be named *eth0* not something else.
In Ubuntu 18.04, do the following to change back to *eth0*:

```
  edit /etc/default/grub
  GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
  update-grub
```

As of now (late 2017) Xilinx "supports" Ubuntu 16.04 (but not earlier Ubuntu releases)

### License Server

*2018-01-22* (UPDATE):  ignore all the below; the certificate based "xilinx.lic"
file loads just fine still in 2017.4.

*2018-01-22* (hazen):  Allegedly, as of Vivado 2017.4 a flexlm upgrade is needed.
Downloaded the new flexlm 11.14.1.10 zip file from Xilinx onto a VM running 16.04.
Fully update the 16.04.

Here is the not-very-helpful readme (reformatted a bit):

```
Setting up a new license server:

1.	Download the appropriate Xilinx FLEXnet license utilities for your server's
        operating system from the Xilinx Download Center at Downloads.

2.	Unzip these utilities into a destination directory. Xilinx recommends you place
        this directory into your application search path.

3.	After the FLEXnet utilities are installed, run the following commands to start
        the floating license server:

Linux:
 <Server Tool directory>/lnx64.o/lmgrd.sh -c <path_to_license>/<license file>.lic \
     -l <path_to_license>/<log filename>1.log

Existing license server serving certificate-based license:

For existing FLEXnet license servers serving certificate-based licenses, a common practice
is to copy the contents of the license file, mailed from xilinx.notification@entitlenow.com,
into the existing license file on your FLEXnet server.

Note: Restart the floating license server to ensure the new Xilinx licenses are enabled.

```

Doesn't work.  Turns out one must do:
```
  $ sudo apt install lsb
```
"LSB" is some linux standard base stuff which is required.


