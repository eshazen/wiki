# ArduinoZero
See also the [wiki:eVOLVER] page with a specific application.

The !Arduino/Genuino Zero is a new board family which uses the ARM SAMD21 processor instead of the AVR-8 used in the original Arudino.
We're using the Sparkfun [SAMD21 Mini Breakout](https://www.sparkfun.com/products/13664) board.  This board is more or less compatible
with the Arduino Zero and can be programmed using the Arduino IDE.

This board comes with a boot-loader (I think it's the same one as on the Arduino Zero).
Some documentation is in this [forum post](https://forum.arduino.cc/index.php?topic=330227.0).

Programming or debugging the SAMD21 directly involves an interface and software.  The protocol is SWD (serial wire debug), a two-wire
interface specific to the ARM family described [here](http://www.arm.com/products/system-ip/debug-trace/coresight-soc-components/serial-wire-debug.php).

To program the flash on an ARM or do remote debugging, one needs software support on the host computer side in addition to a hardware interface ("dongle").
A popular open-source tool is [openocd](http://openocd.org/).  It supports for example an FT2232-based bit-bang interface described in the article linked below.

 * [Datasheet](https://cdn.sparkfun.com/datasheets/Dev/Arduino/Boards/Atmel-42181-SAM-D21_Datasheet.pdf) for Atmel SAMD21 CPU
 * [Article](http://www.allaboutcircuits.com/technical-articles/getting-started-with-openocd-using-ft2232h-adapter-for-swd-debugging/) "Getting Started with OPENOCD Using FT2232H Adapter for SWD Debugging"
 * [Article](https://petervanhoyweghen.wordpress.com/2015/10/11/burning-zero-bootloader-with-beaglebone-as-swd-programmer/) "Burning Zero Bootloader with Beaglebone..."
 * [FT2232H Breakout Board](http://www.earthpeopletechnology.com/?wpsc-product=dual-channel-ftdi-breakout-board)
 * [Sparkfun bootloader](https://github.com/sparkfun/Arduino_Boards/tree/master/sparkfun/samd/bootloaders/zero) for the SAMD21 Mini Breakout board
 * [Youtube](https://www.youtube.com/watch?v=ZVwiUl9hbk4) video about minimal design with SAMD21E (0.8mm pitch TQFP-32).  Also his [github](https://github.com/kodera2t/SAMDi_minimum) with the Eagle designs
