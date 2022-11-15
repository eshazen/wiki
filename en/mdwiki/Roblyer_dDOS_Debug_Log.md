# Roblyer_dDOS_Debug_Log
*2014-05-23* hazen, gastler, woodall

 * Checkout Vivado project from http://edf.bu.edu/svn/DOSI/trunk/firmware/fpga-firmware/microZ9/
   * Rebuild with default options.  Ignore many scary "critical warnings"
 * Check out bootloader from http://edf.bu.edu/svn/DOSI/trunk/firmware/bootloader/
   * Copy bit file from Vivado over existing one
   * "make" to build new boot.bin
   * Mount SD card parition 0, copy over boot.bin
   * It works!
 * Check out https://ohm.bu.edu/svn/DOSI/trunk/embedded-software/dsau-server/
   * Enter directory and 'make clean; make'  (make clean required for now)
   * This creates dsau-server, which should be copied to 'testing' on 2nd (DATA) partition on SD card


*2014-09-08* de carli

 * Purchased an 8gb sd u-sd card, now labelled "3"

*2014-09-09* de carli

 * Got u-sd card "3" working.
 * Current plan:
   * Bit-bang the ADC SPI in the same manner the DDS boards are communicated with
   * Will only require c++ program, no device-tree or verilog modification
