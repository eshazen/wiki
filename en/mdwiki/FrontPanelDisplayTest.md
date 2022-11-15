# FrontPanelDisplayTest
## Front Panel Display Test board

This is an Arduino Shield (for the standard Ardunio Uno, 5V) to test display options
for the new Apollo front panel.  It would allow us to test the proposed displays, and
eventually to test complete front panel boards.

Git:

 * https://gitlab.com/apollo-lhc/hardware/front-panel-rnd/front-panel-fw
 * https://gitlab.com/apollo-lhc/hardware/front-panel-rnd/front-panel-hw

References:

 * [OLED display](https://www.digikey.com/en/products/detail/futaba-corporation-of-america/ELW0501AB/14668903)
   * [Connector info](https://www.irisoconnectors.com/products/imsa-9671s-11y912) (note that the listed P/N for mating connector is the 11-pin 9671S-11B-GF)
 * [4-digit LED](https://www.digikey.ch/product-detail/en/broadcom-limited/HCMS-2903/516-1173-5-ND/637437)
 * [Seeed studio OLED breakout](https://www.seeedstudio.com/0-5-Inch-OLED-display-Arduino-shield-p-2194.html)

 * [Arduino_Shield_Modules_for_KiCad_V3.zip](https://ohm.bu.edu/~hazen/KiCAD/Arduino_Shield_Modules_for_KiCad_V3.zip)

Features:

 * Site for one 4-digit LED (DIP-12)
 * Site for the Seeed studio breakout
 * Site for mating connector (small flexi connector) for the OLED and some mounting holes for a support for the display
 * A couple of buttons or a knob for test inputs
 * Maybe an extended area with a site to plug in a front-panel board for testing (either the old or new type)

Notes:

The OLED display recommends 13V and 2.8V power, with 2.8V logic levels.  Looking at the data sheet, it seems as if 12V and 3.3V would work.  The Arduino can run on 12V, so probably the way to handle this is to put a barrel jack on the board accepting 12V from an external supply and an adjustable regulator to generate the 3.3V for the level shifters and OLED power.



=================

<img src="https://ohm.bu.edu/~hazen/APOLLO/WebStuff/display-options.png" width="350">

=================
Block Diagram

<img src="https://ohm.bu.edu/~hazen/APOLLO/FP_dwgs/arduino_test_board.png">
