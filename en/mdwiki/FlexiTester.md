# FlexiTester
This page will document an automated Flex-Cable tester for the g-2 tracker.
The idea is to automatically verify that there are no shorts or opens in
a flex-cable, given connectors on both ends interfaced to a computer.

 * Schematic: [TestBeam_A.pdf](http://ohm.bu.edu/~hazen/G-2/TestBeam_A.pdf)

There are a total of 144 pins on a Flexi (64+80 connector pins)
There are ~44 non-GND nets in this design.  We need to be able to drive each
one to logic 0 or 1 from one end of the cable.  The remaining 100 pins need to be measured
as inputs, with a pull-up resistor to sense shorts.  So, we need:

 * On the ZIF end:
   * 44 outputs
   * 19 inputs
   * 1 GND
 * On the ASDQ end:
   * 79 inputs
   * 1 GND

An ATmega328 provides easily 15 I/O plus I2C and UART (13 on Arduino because of XTAL)
There exist e.g. PCA9555 I/O expanders which connect to I2C and provide 16 extra I/Os.

So on the ZIF end we could use e.g. an ATmega328 (15 I/O) plus (3) PCA9555 giving
a total of exactly 63 I/O which is what is needed.

On the ASDQ end we could use another ATmega328 plus (4) PCA9555.

Alternatively we could build a (otherwise useful) Arduino I/O expander shield with a
lot of I/Os on standard ribbon cable headers and then two boards with the flexi connectors.

See:
[Centipede Shield](http://macetech.com/store/index.php?main_page=product_info&cPath=4&products_id=23)
