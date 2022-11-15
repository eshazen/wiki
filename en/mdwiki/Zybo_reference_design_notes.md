# Zybo_reference_design_notes
This page is in reference to out zybo reference design at [zybo(soon to be open)](http://gauss.bu.edu/svn/dan/zynq/zybo)

### Overall design
The reference design is split into two parts, tcl scripts that generate a block design that is included in top.vhd, and then all the other HDL files that are used along with top.vhd.
A common make file builds and adds all of these files to a project and then builds the design.
To build the project you just type "make" in the zybo directory.  If you aren't using Vivado 2018.2, or you have it someplace other than /opt/Xilinx/Vivado/2018.2, update the path at the top of the Makefile.

### Block design files
The block design tcl files are located in bd/ and are called by make to generate the block design files needed for the project.
To customize the block design, edit the appropriate tcl files listed below.

Files:   Files marked with a (*) are where customizations should happen.

 * *create.tcl*:

  Top level file called to build the block design.

 * *build_CPU.tcl ** :

  Configuration of the zynq CPU (except the MIO pins)

 * *build_CPU_MIO.tcl ** :

  Configuration of the zynq MIO pins.  This includes the arm bank voltages and all the PS peripherals. This is not an exhaustive listing, so it may require many changes

 * *build_AXI_interconnect.tcl*:

  Generation of the AXI interconnect.

 * *build_AXI_slaves.tcl ** :

  File where all AXI slave names, and AXI params are added.  This is also where BD based AXI-slave generation code goes and where non-BD AXI-slaves are generated.  This is also where the AXI slave addresses are set.  This is currently done by letting Vivado choose the, but the tcl could be modified to suggest the addresses.  This should be added into the global arrays of AXI slave parameters.

 * *axi_slave_helpers.tcl*:

  Library of code to help with AXI slave generation and connection.



Notes:

 * UIO:

  To make AXI-slave components UIO compatible, you need to append the "generic-uio" to each AXI-slave.  To make sure linux does a scan for these, you also need to add "uio_pdrv_genirq.of_id=generic-uio" to the bootargs tag of the chosen block in the device-tree system-user.dtsi.

  In this build system there are tcl functions from axi_slave_helpers.tcl that are called after creating slaves in build_AXI_slaves.tcl that generate dtsi_chunk and dtsi_post_chunk files.  These provide UIO compatible device tree entries (dtsi_chunk) and overrides of the "compatible" tags for BD IP AXI slaves that make them UIO compatible (dtsi_post_chunk).  The build system will add these to the system-user.dtsi to be used when petalinux is built and packaged.

  Here is an example of a finished system-user.dtsi that has one UIO HDL AXI slave and the UIO modifications for two BD IP cores for GPIOs and a Xilinx Virtual Cable XVC.
  {{{
/include/ "system-conf.dtsi"
/{
  amba_pl {
    axiSlavemyReg: gpio@43C10000 {
      compatible = "generic-uio";
      reg = <0x43C10000 0x10000>;
      label = "myReg";
    };
  };
chosen {
        bootargs = "earluycon uio_pdrv_genirq.of_id=generic-uio";
        };
};
  &FP_LEDs{
    compatible = "generic-uio";
  };
  &XVC{
    compatible = "generic-uio";
  };

}}}

## uHal (ipbus-software)

   * What works
     * IPbus transactions over network from uHal running on Zynq
     * Single-word reads and writes through AXI from uHal API, on Zynq
   * Porting uHal to Zynq
     * Makefiles in ipbus-software don't seem to work for cross-compiling,
      however compiling uHal is simple enough that replacing with a different
      build system works well for the test.
     * ProtocolPCIe has C++ errors under Petalinux compiler/stdlib - removed it for now.
     * Requires including Boost libraries in Petalinux (supported by Petalinux)
   * Implementation of new uHal protocol
     * Existing IPbus implementation:
       * Class ProtocolIPbusCore implements implement{Read,Write, etc.}
       * Class ProtocolUDP implements implementDispatch
     * New AXI/UIO implementation:
       * Class ProtocolUIO implements:
         * constructor - open and mmap `/dev/uio***` specified in "uiotable" file
         * implementRead - does actual reads
         * implementWrite - does actual writes
         * implementDispatch - validates the !ValWords, so that uHal convention of calling dispatch() must be followed
   * Connection URI, tables, and address translation examples
     * connections.xml
       * `uioaxi-1.0://uiotable` identifies `uiotable` as file mapping address ranges to UIO devices (see below).
    -
```
<connections>
  <connection id="test.0" uri="uioaxi-1.0://uiotable" address_table="file://address_top.xml" />
</connections>
```
     * address_top.xml
```
<node id="TOP">
  <node id="GPIO" address="0x00000000" module="file://address_gpio.xml" />
  <node id="myreg" address="0x10000000" module="file://address_myreg.xml" />
</node>
```
     * address_gpio.xml
```
<node id="TOP">
  <node id="GPIO_DATA" address="0x0000" permission="rw"/>
  <node id="GPIO_TRI" address="0x0001" permission="rw"/>
</node>
```
     * uiotable
```
# First column:  Uhal address table offset number
# Second column: Size of device's register address space (number of 32-bit words)
d column:  Name of device node under /dev
0x0 0x0004 uio0
0x1 0x4000 uio1
```
     * uHal -> device address translation (examples)
       * 0x10000004 -> UIO device 1, word 4
       * 0x20000005 -> UIO device 2, word 5
   * Work needed to build (with respect to upstream ipbus-software)
     * Need petalinux toolchain
     * Copy boost libraries from zynq image to a sysroot used by compiler
     * Add sysroot to compiler (--sysroot)
     * Fix ipbus-software Makefiles to be compatible with cross-building for
      petalinux, or replace with another build system (as was done for the test)
     * Add uiouhal/ProtocolUIO.cpp to uhal build
     * Remove uhal/uhal/src/common/ProtocolPCIe.cpp, or fix to be compatible with
      petalinux's C++
     * Apply changes to uhal/uhal/src/common/ClientFactory.cpp:
  {{{
       // ---------------------------------------------------------------------
 *      mInstance->add< PCIe > ( "ipbuspcie-2.0" , "Direct access to hardware via PCIe, using IPbus version 2.0" );
       mInstance->add< Mmap > ( "ipbusmmap-2.0" , "Direct access to hardware via mmap, using IPbus version 2.0" );
       // ---------------------------------------------------------------------

+      mInstance->add< UIO > ( "uioaxi-1.0" , "Direct access to hardware on AXI bus without IPbus" );
     }
}}}

## uHal ipbus-software with fewer required modifications for Zynq, 2019-05-03
   * http://gauss.bu.edu/svn/common-atca-blade.software/ipbus/trunk/ipbus-zynq-2019-05-03/
   * http://gauss.bu.edu/svn/common-atca-blade.software/ipbus/trunk/ipbus-zynq-2019-05-03/runthrough.sh.txt
