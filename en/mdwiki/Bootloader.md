# Bootloader
## Current Bootloader Status

Svn containing all bootloader work: http://gauss.bu.edu/redmine/projects/arduino-zero/repository/libs/show/zero_bootloader

To-Do (12/19/17)

 * Implement any CRC checking?
 * Reading is really slow, but that may be normal
 * Bootloader proposal below
   * EVERYTHING WORKS (Although reading out positions is slightly funky
 * SerialUSB works, regular Serial has not been implemented

Necessary documentation!!
 * what in the bootloader needs to change if you add more uC slots w/different voltages

### Procedure to upload a new bootloader

 * Plug the ATMEL programmer into your computer and the Sparkfun board (which should have an 8 pin programming connector next to the reset button).
   * The programming cable should be plugged in under SAM on the programmer.
   * The other end should be plugged into the board with the red wire closer to the tx led (with the 6 pin connector unconnected).
 * Select `"Atmel-ICE"` from the Tools menu, under Programmer.
 * The Sparkfun board needs to be powered, either through a micro usb or an external power supply if it's plugged into the motherboard.
   * Now both a red and green light should be lit on the ATMEL programmer.
 * Download the arduino IDE if you haven't already (from arduino.cc)
 * Under the Tools menu and Board Manager, download the `"Arduino SAMD Boards (32-bits ARM Cortex-M0+)"` package if you haven't already
 * Under the Tools menu, select `"Arduino/Genuino Zero (Native USB Port)"` for Board, and whichever port has `"Arduino/Genuino Zero (Native USB Port)"` in parenthesis next to it.
 * Download the "zero" folder from the svn link above (it's located within the trunk folder).
 * Use the make command to make the bootloader (Something about a define to indicate Bootloader number?)
 * Move the zero folder into the arduino bootloader directory, replacing the folder currently named zero.
   * The bootloader directory can be found by pressing `"Burn Bootloader"` in the Tools menu of the Arduino IDE (Don't worry, doing this will only burn the default arduino bootloader to the board).
 * Once you've replaced the old zero folder with the svn folder, press "burn bootloader" again to upload our bootloader to the board.

### Procedure to upload a new arduino sketch
 * Using a micro-usb is the same as it always has been, just plug it into a uC and press upload in the arduino IDE
   * The Sparkfun boards sometimes have issues. If the sketch is not uploading, after pressing upload, double click the reset button.

 * To upload to the raspberry pi:
   * Under the Sketch menu `"Export Compiled Binary"`. This binary will be in the folder you can open with `"Show Sketch Folder"` also in the Sketch menu.
   * Download SamD_funcs_base64.py and program_with_bootloader.py to your rasberry pi.
   * Make sure the rasberry pi is connected to the motherboard with a DB9 cable.
   * Run program_with_bootloader.py followed by the uC number to be uploaded to, followed by the binary file (eg. "python program_with_bootloader.py 1 Blink.ino.bin" for uploading Blink.ino to board 1 in linux)

### Sketch upload communication proposal

 * If using the raspberry pi, the following procedure is proposed:
   * The raspberry pi first sends some reset signal to be interpreted by a serial library (maybe '!~~')
     * This will jump to the start of the bootloader (I think I can use something like DOUBLE_TAP_MAGIC?)
     * The arduino should go to a safe space in the bootloader (this happens after '#' is sent)
   * A different signal is sent to move to bootloader commands for ONLY one arduino ('$1P' for Program the 1st uC) (also '$1E' for echo to 2nd uC, etc)
   * Then, the sketch can be programmed
   * Once it's programmed, a command is sent to get the uC back to the safe part of the bootloader (probably '!~~' again)
   * When all programming is finished, a signal is sent to wake up all the uC's ('$4W' for Wake all 4 uC's)
   * The user should not interrupt the raspberry pi, or cycle power, while an upload is occuring

### Arduino Sketch proposal
 * First you initialize a single class of evolver_si with the terminator every function will end in ("!" right now)
 * Functions are added with evolver_si::addfunction()
 * The arduino loop parses everything, and runs a function if it was sent
 * If people want to add functions, they write the function after the loop, and put another evolver_si::addfunction() in arduino setup
 * Should we include addressing?

### Final Interfacing goals
 * End users don't need to touch the Motherboard or any of the boards on it unless something breaks
 * If they want to change anything, they only need to edit an arduino sketch and upload it
 * uCs shouldn't have to be moved around (reprogramming them is easier)
 * The uCs can be differentiated by the resistance between pin 8 and ground
   * Right now, from UC0 to UC3, resistance reads: 800,600,400,200
   * both the bootloader and arduino sketch can read the value of this pin
 * Code on the raspberry pi allows a user to pick a board (1-4) to upload to, and code to upload
 * The raspberry pi will handle communicating with the uCs to upload a sketch
