# USB-POV_Test_Log
*'2011-12-04*

 * Solder programming cable onto prototype board for AVRISP II (include 10k pullup on nRST)
 * Compile USBaspLoader, enumerates correctly with Makefile,

```
  DEVICE = atmega88p
  AVRDUDE_DEVICE = m88
  BOOTLOADER_ADDRESS = 1800
  FUSEOPT = $(FUSEOPT_88)
    ...
  AVRDUDE = sudo avrdude $(PROGRAMMER) -p $(AVRDUDE_DEVICE)

```
In bootloaderconfig.h:

```
  #define HAVE_EEPROM_PAGED_ACCESS    0
  #define HAVE_EEPROM_BYTE_ACCESS     0

```
(without the above apparently the loader is too big... maybe not true?)

Default behavior is to not enter boot loader on power-up reset.  Comment out
the following to disable:

```
 // if(!(MCUCSR & (1 << EXTRF)))    /* If this was not an external reset, ignore */
 // leaveBootloader();
 //  MCUCSR = 0;

```
Also the following to force boot loader on every time:

```
  #define bootLoaderCondition()   (1)

```
OK, now on power-up we always get the boot loader.  Can exit it by just running
AVRdude with no operations:

```
  sudo avrdude -c USBasp -P usb -p m88

```
Then the app starts.  Desired behavior would be boot loader if USB is plugged in.
Must be a way to do this in software...

In main.c, function *'initForUsbConnectivity()* doesn't do much.
It is the *'usbPoll()* call we have to focus on.  In main.c we have the loop:

```
 do{
   usbPoll();
   if(requestBootLoaderExit){ ... }
 } while(bootLoaderCondition());  /* main event loop */

```
Modify as follows, to automatically sense if USB is connected at power-up
and start the boot loader.

```
  wasUSBActivity = 0;
  ...
  if(bootLoaderCondition()){
    uchar i = 0, j = 0;
    initForUsbConnectivity();
    do{
      if( !wasUSBActivity)
        if(++countIdleUSBLoops > 1000000)
          leaveBootloader();
      usbPoll();
      if(requestBootLoaderExit){ ... }
     }

```
Also declare countIdleUSBLoops as long, and set wasUSBActivity = 1 in
usbProcessRx() in usbdrv.c.  With 1e6 loops as above it has about a 5s time-out.

