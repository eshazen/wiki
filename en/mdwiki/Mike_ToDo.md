# Mike_ToDo
### TO DO
*Main:*
 * Create AXI monitor: Read documentation, make xml, find where this goes in FW, possibly make SW similar to networkMon to calculate rates if needed
 * Create "hello world" esque program for real time core
 * Create BUTool option for loading without configFile
 * add a check to the BuildAddressTable python script to open it with uhal and check that it works.
 * change fprintf to syslog in SM_boot.cxx, and clean it up
*Added by Dan:* (without telling Mike)
 * Fix network connection bug in graphite monitor code. get code building from grafana monitor git
 * Finish eye-scan daemons
 * add autocomplete to XVC address in svfplayer command. (Ask Dan)
 * Update CM_pwr to require start_pwr to transition from '0' to '1' to get out of the SM_RESET state.
*Bugz to be squashed:*
 * Programming over XVC is usually making the blades crash, svfplayer also
*Stuff to test:*
 * SM_boot.cxx in ApolloSM branch bugfix-smboot, must test with cold reset
 * Ask Dan about description in ApolloSM branch fix-apolloSM-arg, [this](https://github.com/apollo-lhc/ApolloSM_plugin/issues/34)
*Ready to be pulled into develop:*
 * empty

{{{#!div
{{{#!html
<h3 class="foldable">CREATING, BUILDING, AND MIGRATING FW FOR BLADES</h3>
}}}
{{{#!div
 This all assumes you are working from the machine tesla.[BR](BR.md)
*Building FW*
[BR](BR.md)This is the process for building SM_ZYNQ_FW firmware images.
```
#build PKG and map files from xml
cd SM_ZYNQ_FW/
make clean_regmap
make xml_regmap

#build main, this build may range from 30-90 minutes
#See note below about building for specific FPGA parts
cd SM_ZYNQ_FW/
make clean
make

#build os images, this build may take 30 minutes
SM_ZYNQ_FW/os/
cp /tmp/SM_FW/os/hw/* ./hw/ #Something to do with something?
make clean
make

#Build the centos images, this may take 30 minutes
#See note below about building for specific branch of ApolloTool SW
cd SM_ZYNQ_FW/os/centos/
sudo make clean
sudo cp -r /home/dan/Apollo/SM_ZYNQ_FW/os/centos/secure ./
sudo make
```
*Migrating FW*
[BR](BR.md)After the FW has successfully built with the above steps, do this to migrate the FW to a blade.
```
#copy os images to service module /fw/ directory
cd SM_ZYNQ_FW/os/zynq_os/images/linux/
scp BOOT.BIN username@address_for_SM:/fw/
scp image.ub username@address_for_SM:/fw/

#copy centos images, this may take a whil ~40mins
cd SM_ZYNQ_FW/os/centos/image/
sudo rsync -P -r -l -p -o -g -W -c --numeric-ids ./ root@192.168.30."BLADE_NUMBER"2:/

#ssh to service module and reboot
ssh username@address_for_SM
reboot
#you should get kicked off the ssh, wait a little then ssh back into service module
ssh username@address_for_SM
```
*Note on setting FPGA part*
[BR](BR.md)The FPGAs on SM02 and SM06 are not the same, this sets the proper build environment for the FW.
```
#emacs SM_ZYNQ_FW/scripts/settings.tcl

#if building for SM06 then
#set the FPGA part number
set FPGA_part xc7z035fbg676-1
#set FPGA_part xc7Z045FFG676-2

#If building for SM02 then
#set the FPGA part number
#set FPGA_part xc7z035fbg676-1
set FPGA_part xc7Z045FFG676-2
```
*Note on setting SW for CentOS*
[BR](BR.md) under the block of code below in SM_ZYNQ_FW/os/centos/Makefile
```
${OPT_PATH}/BUTool: ${OPT_PATH}/cactus | ${OPT_PATH} ${TMP_PATH}
        cd ${TMP_PATH} && \
                git clone https://github.com/apollo-lhc/ApolloTool.git
        cd ${TMP_PATH}/ApolloTool && \
                make init
```
you want to insert a line in the Makefile to switch any of the git submodules to branches of SW specific to your FW build. The code should look like this. This line can be done for each submodule which needs to be on a branch other than branches specificed by the develop branch of Apollotool.
```
        cd ${TMP_PATH}/ApolloTool/path_to_submodule && \
                git checkout <branch>
```
}}}
}}}
{{{#!div
{{{#!html
<h3 class="foldable">CREATING, BUILDING, AND MIGRATING SW FOR BLADES</h3>
}}}
{{{#!div
 This all assumes you are working from the machine tesla.[BR](BR.md)
*Building SW*
[BR](BR.md)This is the process for building the Apollotool SW.
```
cd ApolloTool/
make clean
make local -j32
#If you haven't already, push your software to the appropriate branch of the git
```
*Migrating SW*
```
#ssh to service module
ssh username@address_for_SM
cd /tmp

#Checkout Apollo tool, then update submodules
git clone https://github.com/apollo-lhc/ApolloTool.git #The service modules have a slow network connection so this may be slow
cd ApolloToool/
git submodule update --init --recursive
#now move within the appropriate submodule and checkout the branch relevant to the new software you are trying to build and load onto the service module
git checkout branchname #inside of submodule


#return to Apollo Tool and build
cd /tmp/ApolloTool
export CACTUS_ROOT=/opt/cactus
make local RUNTIME_LDPATH=/opt/BUTool COMPILETIME_ROOT=--sysroot=/
make install RUNTIME_LDPATH=/opt/BUTool COMPILETIME_ROOT=--sysroot=/ INSTALL_PATH=/opt/BUTool

#reboot
reboot
#you should get kicked off the ssh, wait a little then ssh back into service module
ssh username@address_for_SM
```
Now you can begin any necessary testing for the new SW loaded and booted onto the service module.
}}}
}}}

{{{#!div
{{{#!html
<h3 class="foldable">USING BLADES</h3>
}}}
{{{#!div
*svfplayer*[BR](BR.md)[BR](BR.md)
This is used to program the two FPGAs on a Command Module. Note these are run inside of BUTool on a Service Module.
```
#First make sure CM is powered up
>status
#if CM1 PWR_GOOD is 0 then run
>cmpwrup

#program Kintex then Virtex
>svfplayer /fw/CM/top_K.svf PLXVC.XVC_1
>svfplayer /fw/CM/top_V.svf PLXVC.XVC_1
>status
#Now LINK_GOOD should be 1 for CM1 and CM2

#unblock AXI because?
>unblockAXI
>status
#Now status should print build dates and times for firmware on CM_K_INFO and CM_V_INFO
```
}}}
}}}

{{{#!div
{{{#!html
<h3 class="foldable">OH NO SOMETHING BROKE</h3>
}}}
{{{#!div
Reset Blades
```
#Reset SM06
> ipmitool -H "192.168.10.172" -P "" -t 0x86 mc reset cold
#Reset SM02
> ipmitool -H "192.168.10.172" -P "" -t 0x8c mc reset cold
#Reset SM07
> ipmitool -H "192.168.10.172" -P "" -t 0x94 mc reset cold
```
Connect to Zynq via SOL (works by default, IPMC can override destination)
```
#Connect to SM06
> ipmitool -v -I lanplus -H 192.168.20.6 -U "soluser" -P "<PWD>" -C 0 sol activate
```
SOL through BUTool (super cool)
```
#SOL to SM06
> BUTool.exe -s 192.168.20.6
#SOL to SM02
> BUTool.exe -s 192.168.20.2
```
}}}
}}}

{{{#!div
{{{#!html
<h3 class="foldable">NOTES</h3>
}}}
{{{#!div
*XVC Server*[BR](BR.md)[BR](BR.md)
For connecting to an xvc server SM06 *finish this* has to do with resources at bottom
For creating and then connection to an xvc server on SM02
```
#so this will forward connections to your local computer's port 5555 to 192.168.30.22 port 2542 via tesla.bu.edu
ssh -v -N -L 5555:192.168.30.22:2542 user@tesla.bu.edu
```
now the -xvc_url should be 'localhost:5555' when using the Vivado hardware manager.

*Daemons*[BR](BR.md)[BR](BR.md)
Deamons are background processes in Linux. In the case of the Apollo Tool they are used to provide monitoring on the blades. something something here on SM /etc/systemd/system

*What is xml?*[BR](BR.md)[BR](BR.md)
xml is a markup language like html. In the case of all this firmware, xml is used to define axi slaves on the Apollo Platform. In the above Firmware repositories, the xml definitions for implemented modules are included in the address_table/ sub-directory. These .xml files are all user-defined. This is important because there's a lot of scripts running during the building process for the firmware. The finer details of all these scripts is currently above my head but they are essential for automatically generating a lot of formatted files which are essential for integrating new modules into the project as a whole.
}}}
}}}

{{{#!div
{{{#!html
<h3 class="foldable">RESOURCES</h3>
}}}
{{{#!div
 * [Here](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Meetings/2020-04-16/Dan/L0MDT-Control_and_Monitoring.pdf) is a good slide show for the structure used to interface the Firmware and Software
 * look at [Page 16](https://www.xilinx.com/support/documentation/application_notes/xapp1251-xvc-zynq-petalinux.pdf) for how to connect to a remote hardware target using Vivado
