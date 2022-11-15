# PicozedZynqFirmware
## Firmware
### Prerequisites
 * Must have Vivado installed. This was originally built on Vivado 2015.4.
 * Must have Petalinux installed. This was originally build with Petalinux 2015.4.
 * Must have checked out the [Zynq-Base-Design](http://gauss.bu.edu/svn/zynq-base-design) SVN.
 * Must have the Picozed board folder installed in Vivado.
 a. The folder is located in `/trunk/firmware/board_file` and is named `picozed_7030_fmc2`.
 b. This folder must be copied into `<Vivado Install Directory>/data/boards/board_files`.
 * Must have some kind of serial terminal installed. The project was tested with !GtkTerm, but any terminal should work.
### Creating the Vivado Project From Scratch
1. Run Vivado and create a new project.
2. Choose the RTL project and to add sources.
 a. Do not add any HDL or netlist files.
 b. For Add Existing IP, add in `/trunk/firmware/bd/design_1/design_1.bd`.
 c. For Add Constraints, add in `/trunk/firmware/src/system_constraints.xdc`.
 d. For Default Part, go to the *Boards* tab and select !PicoZed 7030 SOM + FMC Carrier V2.
3. Go to Tools > Project Settings > IP > Repository Manager (Alt+T Alt+S Alt+I Alt+M) and press the green + on the left.
 a. Select `/trunk/firmware/ip_repo` and add it to the Repository Manager.
 b. Refresh All, Apply your changes, and exit out of this window.
4. If it is not already selected, go to the Project Manager tab on the left.
 a. Go to the Sources window and select the Hierarchy tab.
 b. Right-click on design_1.bd and select Create HDL Wrapper.
 c. Let Vivado manage wrapper and auto-update, and select OK.
5. Run Synthesis, then Implementation, then Generate Bitstream.
### Opening the Premade Vivado Project

Note:  you will need to edit the "Project" line near the top of the *.xpr* file
to replace the path with the location where you checked out the firmware.
For example, I checked out the code into "~/work/firmware" and edited the file
to reflect this as below:
```
<Project Version="7" Minor="10" Path="/home/hazen/work/firmware/proj/vivado_project.xpr">
```

1. It should be located in `/trunk/firmware/proj/vivado_project.xpr`
2. You may need to add the ip repo to the Repository Manager.
 a. Go to Tools > Project Settings > IP > Repository Manager and press the green + on the left.
 b. Select `/trunk/firmware/ip_repo` and add it to the Repository Manager.
 c. Refresh All, Apply your changes, and exit out of the window.
### Creating the First Stage !BootLoader
1. In Vivado, go to File > Export > Hardware and be sure to include the bitstream.
2. Go to File > Launch SDK.
3. In the SDK go to File > New > Application Project.
4. Enter a project name and press next.
5. Select Zynq FSBL and press finish.
6. Close out of the SDK.
### Creating a Petalinux Project
1. Source Petalinux (`source /opt/Xilinx/Petalinux/2015.4/petalinux-v2015.4-final/settings.sh`).
2. Run `petalinux-create` with the parameters `--type project --name <petalinux_project_name> --source <path/to/trunk>/trunk/firmware/board_support_files/pz_7030_2015_4.bsp` then cd into that directory.
3. Run `petalinux-config --get-hw-description <path/to/vivado/project>/<vivado_project_name>.sdk/` and exit the in-terminal gui when it pops up.
4. Run `petalinux-build`.
   * If this step stops with an error in the device tree referring to USB-PHY0 then there is a fix that you only have to do once per project.
   * Navigate to `<path/to/petalinux/project>/subsystems/linux/configs/device-tree/system-top.dts` and remove the offending line in the &usb0 node.
     * `usb-phy = <&usb_phy0>;`
5. Source Vivado (same window, `source /opt/Xilinx/Vivado/2015.4/settings64.sh`
6. Run `petalinux-package --boot --foramt BIN --fsbl <path/to/vivado/project>/<vivado_project_name>.sdk/<sdk_project_name>/Debug/<sdk_project_name>.elf --fpga <path/to/vivado/project>/<vivado_project_name>.runs/impl_1/design_1_wrapper.bit --uboot --force`
7. The BOOT.bin and image.ub files should appear in `<path/to/petalinux/project>/images/linux/`.
8. Move the two files onto an sd card and then the board.
