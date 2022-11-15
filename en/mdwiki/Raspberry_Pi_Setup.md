# Raspberry_Pi_Setup
To set up the Raspberry Pi for this system, do the following:

 * Burn the latest raspbian image onto an SD card (>16GB, preferably 32GB to be safe)
 * Boot up a Raspberry Pi B+ with the SD card in it and proper peripherals connected (monitor, mouse, keyboard, ethernet)
 * Check out the software repository
   * Make a directory "~/work/"
   * Within the Work directory, run the following command:
 *
```
svn co gauss.bu.edu/svn/mri-stimulator/software
```
 * Make sure the directory smbus2 is included in your software directory.
 * Configure the Raspberry Pi settings to enable SSH and I2C
 * Find and note the IP of the Raspberry Pi.
 *  If the IP is lost or the pi moves to a new IP address, it can be found elsehow, but  within the EDF it should be easy enough to keep the pi on the same IP address.
