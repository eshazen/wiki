# ZyboDemo
# Building a Complete BOOT.bin and Linux Image

## What to Install

I used the 2015.4 version of each of these programs, but I believe that so long as the version number is consistent then it should work.

 * Vivado 2015.4 with SDK
 * Xilinx Petalinux 2015.4

## Required Downloads

These are the all of the board_files for use as a template in Vivado supplied by Digilent. You really only need to copy over the Zybo board file.\\
[ZYBO Board Files](https://github.com/Digilent/vivado-boards/archive/master.zip) Place these files in {Vivado Install Directory}/Vivado/2015.4/data/boards/board_files/
\\\\
This is the board support file also supplied by Digilent. It's used to provide the hardware description when creating a Petalinux project.\\
[ZYBO Board support file](https://github.com/Digilent/petalinux-bsps)

## Hardware Design

Source settings64.sh from {Vivado Install Directory}.\\
In Vivado, create a new project.\\
Choose for it to be an RTL project, and don't add any sources now.\\
When selecting your default part, choose `Boards` at the top, and select Zybo (This won't be here if you haven't installed the Zybo Board file yet)\\\\
Navigate to `Create Block Design` on the left, name the hardware "system".\\
From here you can add anything you need on your project. I chose to add a ZNYQ7 Processor and three GPIO ports.\\
Once you're done, run `Block Automation` on the top.\\
Run `Connection Automation`.\\
>>For the GPIO select the S_AXI connections.\\
>>Run `Connection Automation` again, and connect the GPIO to btns, leds, and sws.\\
Run `Refresh Connections` and then `Validate Design`.\\\\
Navigate to `Project Manager` on the left.\\
Right click on `system` in `Design Sources` and `Create HDL Wrapper`.\\
Click on `Generate Bitsream` on the bottom left.\\
Go to `File -> Export -> Export Hardware`. Choose to include the bitstream.\\

## Embedded Linux through [PetaLinux](http://www.wiki.xilinx.com/PetaLinux)

In a new terminal, source settings.sh from {Petalinux Install Directory}.\\
Create the petalinux project : `petalinux-create --type project --name {project name} --source {path/to/Zybo Board Support file (should be a BSP file)`}\\
Configure the project : `petalinux-config --get-hw-description {path/to/Vivado Project}/project.sdk (ex. ~/Documents/projects/zybo/zybo.sdk)`\\
Enable Dropbear SSH : `petalinux-config -c rootfs --project {path/to/petalinux project)` and navigate to `FileSystem Packages -> Console/Network -> dropbear`.\\
Build the image : `petalinux-build --project {path/to/petalinux project`}\\

Create FSBL -- (Currently having problems with this one)

In vivado open SDK,[BR](BR.md)
Create new Application Project,[BR](BR.md)
Create packaged BOOT.bin : petalinux-package --boot --format BIN --project zybo_linux --fsbl zybo_spi/zybo_spi.sdk/Zynq_FSBL/Debug/Zynq_FSBL.elf --fpga zybo_spi/zybo_spi.runs/impl_1/system_wrapper.bit --u-boot[BR](BR.md)
Copy BOOT.bin and zybo_linux/images/linux/image.ub to SD card,[BR](BR.md)
SD card must be formatted so that the first 4MiB are unallocated, the next partition is at least 100MiB and is fat32, and the remainder is ex4


## General Notes

 * Don't have petalinux and vivado sourced in the same terminal at the same time unless you're using the petalinux-package commands. It will just cause errors and extra headache.
 * Make sure that your project's target language in Vivado is set VHDL and not Verilog.
*
