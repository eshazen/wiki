# network_boot
This page details to process for configuring a Zynq board to boot via Network boot (NFS+TFTP). Two guides are provided, one for generating the Petalinux project via a BSP and another via the Zynq template.

# Building Images
{{{#!div
{{{#!html
<h2 class="foldable">BSP</h2>
}}}
{{{#!div
The following instructions present a guide to building images for the Digilent Zybo Board with a Zynq-7000 using a [BSP File](https://github.com/Digilent/Petalinux-Zybo/releases/tag/v2017.4-1). Petalinux 2017.4 will be needed.

### Clone Github repository and revert to previous commit
```
$ git clone https://github.com/apollo-lhc/SM_ZYNQ_FW.git
$ cd SM_ZYNQ_FW
$ git checkout b9c9c6d718f7f98fa73ea84179564651ff3035b0 .
```


### Build FPGA FW
```
$ make
```
Note: Output will say "Failed to build FW!", but the errors will not interfere with this build

### Alter Makefile in `SM_ZYNQ_FW/kernel`
 * Change VIVADO_VERSION
         ` VIVADO_VERSION = 2017.4 `
 * Change VIVADO_PETALINUX path
         ` VIVADO_PETALINUX="/work/Xilinx/petalinux/"$(VIVADO_VERSION)"/settings.sh" `
 * Add path to BSP file as a variable
         ` BSP_PATH = "/work/ichand/Petalinux-Zybo-2017.4-1.bsp" `
 * Change petalinux-create command to use BSP file
         ` petalinux-create --type project --name $(ZYNQ_OS) --s $(BSP_PATH) --force `

### Build Petalinux Project and Configure Settings
Build the Petalinux project directory by running `make` in `SM_ZYNQ_FW/kernel`

Configure general system behavior
```
$ cd zynq_os
$ source /work/Xilinx/petalinux/2017.4/settings.sh
$ petalinux-config --get-hw-description ../hw --oldconfig
$ petalinux-config
```

This will open up a settings menu where the following settings should be adjusted
 * DTG Settings -> Kernel Bootargs
   * Disable "generate boot args automatically
   * Set "user set kernel bootargs" to `console=ttyPS0,115200 earlycon clk_ignore_unused rootwait root=/dev/nfs rw ip=dhcp nfsroot=<NFS Server IP>:<RFS Directory Path>,nfsvers=3,tcp`
 * u-boot Configuration
   * Set "TFTP Server IP address" to <TFTP Server IP>
 * Image Packaging Configuration
   * -> Root File System: Set to NFS
   * -> Location of NFS root directory: Set to <RFS Directory Path>
   * -> NFS Server IP Address: Set to <NFS Server IP>

Configure kernel settings
`$ petalinux-config -c kernel`
This will open up a settings menu where the following settings should be enabled
 * Networking support -> Networking Options
   * TCP/IP Networking = Enabled
   * IP: Multicasting = Enabled
   * IP: kernel level autoconfiguration = Enabled
   * IP: DHCP support = Enabled
   * IP: BOOTP support = Enabled
   * IP: RARP support = Enabled
 * File Systems -> Network File Systems
   * NFS client cupport = Enabled
   * NFS client support for NFS version 2 = Enabled
   * NFS client support for NFS version 3 = Enabled
   * NFS client support for NFSv3 ACL protocol extension = Enabled

### Build Images
Rebuild the Petalinux Project with the correct configurations

Transfer config files from `zynq_os` to `zynq_os_mods`
```
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/configs/config SM_ZYNQ_FW/kernel/zynq_os_mods/configs/boot_config
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/configs/rootfs_config SM_ZYNQ_FW/kernel/zynq_os_mods/rootfs
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/meta-plnx-generated/recipes-kernel/linux/configs/plnx_kernel.cfg SM_ZYNQ_FW/kernel/zynq_os_mods/kernel/linux/linux-xlnx
```

Add the following line to `SM_ZYNQ_FW/kernel/zynq_os_mods/kernel/linux/linux-xlnx_%.bbappend`
```
SRC_URI += "file://plnx_kernel.cfg"
```

Run `make clean` in `SM_ZYNQ_FW/kernel/`, then run `make`

After the build completes, `BOOT.BIN`, `image.ub`, and `rootfs.tar.gz` can be found in `SM_ZYNQ_FW/kernel/zynq_os/images/linux`

### Booting Zybo
The following steps detail how to boot the Zybo using the newly generated files

Transfer the files
 * Place `image.ub` in the TFTP server directory
 * Place `BOOT.BIN` on the first partition of the SD Card
 * Extract `rootfs.tar.gz' into the NFS server directory

Boot
 * Connect to the board via UART and turn it on
 * When the prompt starts counting down, press any key to stop auto-boot
 * Run the command `run netboot`

Note: `run netboot` will likely fail as a result of the boot environment settings being incorrect. Set the following variables as shown:
```
$ setenv bootargs console=ttyPS0,115200 earlycon clk_ignore_unused rootwait root=/dev/nfs rw ip=dhcp nfsroot=<NFS Server IP>:<RFS Directory Path>,nfsvers=3,tcp
$ setenv serverip <TFTP Server IP>
```

Note: Need to add more of the U-boot settings
}}}
}}}

{{{#!div
{{{#!html
<h2 class="foldable">Zynq Template</h2>
}}}
{{{#!div
The following instructions present a guide to building images for the Digilent Zybo Board using the Zynq template to create the project from scratch. Petalinux 2018.2 will be needed

### Clone Github repository
```
$ git clone https://github.com/apollo-lhc/SM_ZYNQ_FW.git
$ cd SM_ZYNQ_FW
```

### Build FPGA FW
```
$ make
```
Note: Output will say "Failed to build FW!", but the errors will not interfere with this build

### Build Petalinux Project and Configure Settings
Build the Petalinux project directory by running `make` in `SM_ZYNQ_FW/kernel`

Configure general system behavior
```
$ cd zynq_os
$ source /work/Xilinx/petalinux/2017.4/settings.sh
$ petalinux-config --get-hw-description ../hw --oldconfig
$ petalinux-config
```

This will open up a settings menu where the following settings should be adjusted
 * DTG Settings -> Kernel Bootargs
   * Disable "generate boot args automatically
   * Set "user set kernel bootargs" to `console=ttyPS0,115200 earlycon clk_ignore_unused rootwait root=/dev/nfs rw ip=dhcp nfsroot=<NFS Server IP>:<RFS Directory Path>,nfsvers=3,tcp`
 * u-boot Configuration
   * Set "TFTP Server IP address" to <TFTP Server IP>
 * Image Packaging Configuration
   * -> Root File System: Set to NFS
   * -> Location of NFS root directory: Set to <RFS Directory Path>
   * -> NFS Server IP Address: Set to <NFS Server IP>

Configure kernel settings
`$ petalinux-config -c kernel`
This will open up a settings menu where the following settings should be enabled
 * Networking support -> Networking Options
   * TCP/IP Networking = Enabled
   * IP: Multicasting = Enabled
   * IP: kernel level autoconfiguration = Enabled
   * IP: DHCP support = Enabled
   * IP: BOOTP support = Enabled
   * IP: RARP support = Enabled
 * File Systems -> Network File Systems
   * NFS client cupport = Enabled
   * NFS client support for NFS version 2 = Enabled
   * NFS client support for NFS version 3 = Enabled
   * NFS client support for NFSv3 ACL protocol extension = Enabled

### Build Images
Rebuild the Petalinux Project with the correct configurations

Transfer config files from `zynq_os` to `zynq_os_mods`
```
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/configs/config SM_ZYNQ_FW/kernel/zynq_os_mods/configs/boot_config
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/configs/rootfs_config SM_ZYNQ_FW/kernel/zynq_os_mods/rootfs
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/meta-plnx-generated/recipes-kernel/linux/configs/plnx_kernel.cfg SM_ZYNQ_FW/kernel/zynq_os_mods/kernel/linux/linux-xlnx
```

Add the following line to `SM_ZYNQ_FW/kernel/zynq_os_mods/kernel/linux/linux-xlnx_%.bbappend`
```
SRC_URI += "file://plnx_kernel.cfg"
```

Run `make clean` in `SM_ZYNQ_FW/kernel/`, then run `make`

After the build completes, `BOOT.BIN`, `image.ub`, and `rootfs.tar.gz` can be found in `SM_ZYNQ_FW/kernel/zynq_os/images/linux`
}}}
}}}

{{{#!div
{{{#!html
<h2 class="foldable">Apollo Blade Build</h2>
}}}
{{{#!div
The following instructions present a guide to building images for the Apollo Blades using the Zynq template to create the project from scratch. Petalinux 2018.2 will be needed

### Clone Github repository
```
$ git clone https://github.com/apollo-lhc/SM_ZYNQ_FW.git
$ cd SM_ZYNQ_FW
```

### Build FPGA FW
```
$ make init
$ make rev2_xczu7ev
```
Time: ~1 hour

### Configure U-Boot environment variables
Documentation for configuration of u-boot-xlnx_%.bbappend, bsp.cfg, and platform-top.h can be found [here](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug1144-petalinux-tools-reference-guide.pdf) on page 99. Because u-boot autoconfig is being deprecated, this is the workaround to avoid the need for platform-auto.h.

```
$ cd kernel
$ mkdir ./configs/rev2_xczu7ev/u-boot
$ mkdir ./configs/rev2_xczu7ev/u-boot/files
```
#### u-boot-xlnx_%.bbappend
```
$ vi ./configs/rev2_xczu7ev/u-boot/u-boot-xlnx_%.bbappend

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
        file://platform-top.h \
        file://bsp.cfg \
"

do_configure_append () {
        if [ "${U_BOOT_AUTO_CONFIG}" = "1" ]; then
                install ${WORKDIR}/platform-auto.h ${S}/include/configs/
                install ${WORKDIR}/platform-top.h ${S}/include/configs/
        else
                install ${WORKDIR}/platform-top.h ${S}/include/configs/
        fi
}

do_configure_append_microblaze () {
        if [ "${U_BOOT_AUTO_CONFIG}" = "1" ]; then
                install -d ${B}/source/board/xilinx/microblazegeneric/
                install ${WORKDIR}/config.mk ${B}/source/board/xilinx/microblaze-generic/
        fi
}
```
#### bsp.cfg
```
$ vi ./configs/rev2_xczu7ev/u-boot/files/bsp.cfg

CONFIG_SYS_CONFIG_NAME="platform-top"
```
#### platform-top.h
```
$ vi ./configs/rev2_xczu7ev/u-boot/files/platform-top_NFS+TFTP.h

#include <configs/xilinx_zynqmp.h>

#define pushCEES _Pragma("push_macro(\"CONFIG_EXTRA_ENV_SETTINGS\")")
#define popCEES _Pragma("pop_macro(\"CONFIG_EXTRA_ENV_SETTINGS\")")

pushCEES
#undef CONFIG_EXTRA_ENV_SETTINGS
#define CONFIG_EXTRA_ENV_SETTINGS popCEES CONFIG_EXTRA_ENV_SETTINGS \
        "bootargs=console=ttyPS0,115200 earlycon clk_ignore_unused rootwait root=/dev/nfs rw ip=dhcp nfsroot=192.168.30.2:/export/CentOS,nfsvers=3,tcp\0" \
        "autoload=no\0" \
        "netstart=0x04000000\0" \
        "kernel_img=image.ub\0" \
        "netboot=dhcp && setenv serverip 192.168.30.2 && tftpboot ${netstart} ${kernel_img} && bootm ${netstart}\0" \
        "bootcmd=run netboot\0" \
""
```
```
$ ln -s ./configs/rev2_xczu7ev/u-boot/files/platform-top_NFS+TFTP.h ./configs/rev2_xczu7ev/u-boot/files/platform-top.h
```
Rather than creating a symlink, you may also put your changes directly into platform-top.h, whatever best fits your workflow.

Makefile will transfer contents of ./configs/rev2_xczu7ev/u-boot directory into ${ZYNQ_OS_PROJECT_PATH}/project-spec/meta-user/recipes-bsp/u-boot

### Build ZYNQ FSBL, Kernel, and File System

```
$ make rev2_xczu7ev
```
After the build completes, `BOOT.BIN`, `boot.scr`, and `image.ub` can be found in `SM_ZYNQ_FW/kernel/zynq_os/images/linux`

{{{#!div
{{{#!html
<h4 class="foldable">Configure general system behavior</h2>
}}}
{{{#!div
Everything done within the Petalinux configuration menu should already be handled by the settings within platform-top.h. I've left these steps as they may be useful in the future, however, they are outdated and use Petalinux 2017.4 and build rev1_xc7z035.
```
$ cd zynq_os
$ source /work/Xilinx/petalinux/2017.4/settings.sh
$ petalinux-config --get-hw-description ../hw --oldconfig
$ petalinux-config
```

This will open up a settings menu where the following settings should be adjusted
 * DTG Settings -> Kernel Bootargs
   * Disable "generate boot args automatically
   * Set "user set kernel bootargs" to `console=ttyPS0,115200 earlycon clk_ignore_unused rootwait root=/dev/nfs rw ip=dhcp nfsroot=<NFS Server IP>:<RFS Directory Path>,nfsvers=3,tcp`
 * u-boot Configuration
   * Set "TFTP Server IP address" to <TFTP Server IP>
 * Image Packaging Configuration
   * -> Root File System: Set to NFS
   * -> Location of NFS root directory: Set to <RFS Directory Path>
   * -> NFS Server IP Address: Set to <NFS Server IP>

Configure kernel settings
`$ petalinux-config -c kernel`
This will open up a settings menu where the following settings should be enabled
 * Networking support -> Networking Options
   * TCP/IP Networking = Enabled
   * IP: Multicasting = Enabled
   * IP: kernel level autoconfiguration = Enabled
   * IP: DHCP support = Enabled
   * IP: BOOTP support = Enabled
   * IP: RARP support = Enabled
 * File Systems -> Network File Systems
   * NFS client cupport = Enabled
   * NFS client support for NFS version 2 = Enabled
   * NFS client support for NFS version 3 = Enabled
   * NFS client support for NFSv3 ACL protocol extension = Enabled

#### Rebuild Images
Rebuild the Petalinux Project with the correct configurations

Transfer config files from `zynq_os` to `zynq_os_mods`
```
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/configs/config SM_ZYNQ_FW/kernel/zynq_os_mods/configs/boot_config
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/configs/rootfs_config SM_ZYNQ_FW/kernel/zynq_os_mods/rootfs
$ cp SM_ZYNQ_FW/kernel/zynq_os/project-spec/meta-plnx-generated/recipes-kernel/linux/configs/plnx_kernel.cfg SM_ZYNQ_FW/kernel/zynq_os_mods/kernel/linux/linux-xlnx
```

Add the following line to `SM_ZYNQ_FW/kernel/zynq_os_mods/kernel/linux/linux-xlnx_%.bbappend`
```
SRC_URI += "file://plnx_kernel.cfg"
```

Run `make clean` in `SM_ZYNQ_FW/kernel/`, then run `make rev1_xc7z035`

After the build completes, `BOOT.BIN`, `boot.scr`, and `image.ub` can be found in `SM_ZYNQ_FW/kernel/zynq_os/images/linux`
}}}

### Transfer Images
This guide is specific to Apollo202 and may or may not apply to other blades.
```
$ mount /dev/mmcblk1p1 /mnt
```
Transfer `BOOT.BIN` and `boot.scr` into `/mnt`
```
$ umount /mnt
```

Transfer `image.ub` into the TFTP server directory

### Build CentOS Image
NOTE: Need to double-check process and whether you needed to run the GetReleases.sh script and what you commented out while trying to get it to work

Starting in the SM_ZYNQ_FW directory, run the following commands:
```
$ make address_table
$ cd os
$ sudo make clean
$ sudo make
```

After the build completes, the 'image' directory will be produced and contain the file system.

}}}

