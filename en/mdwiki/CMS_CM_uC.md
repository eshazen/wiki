# CMS_CM_uC
## Programming instructions
The programmer used is a Segger JLink cable: []
The drivers and software can be downloaded [https://www.segger.com/downloads/jlink#J-LinkSoftwareAndDocumentationPack
 here]
To load a new .bin file to the uC, use the Segger JLink cable plugged into the front panel JTAG connector and run the JFlashLiteExe program.

You will have to select the uc: TM4C1290NCPDT and set it to JTAG, then use the default options and point it at your .bin file.
Programming takes a few seconds.

## Building instructions
To build the code from source, install gcc-arm-none-eabi

Then download and unzip freeRTOS
> curl -L -o freertos-code.zip https://sourceforge.net/projects/freertos/files/FreeRTOS/V10.2.1/FreeRTOSv10.2.1.zip/download

> unzip -q   freertos-code.zip  -d freertos-code

Before you build, set the two enviornment variables to poin tat freerot

> export FREERTOS_ROOT=$PATH_TO/freertos-code/FreeRTOSv10.2.1/FreeRTOS/Source

> export FREERTOS_PLUS_ROOT=$PATH_TO/freertos-code/FreeRTOSv10.2.1/FreeRTOS-Plus/Source

Now type "make" in the top folder.
If you build in a lower directory, you won't generate everything needed to build.

