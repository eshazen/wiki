# Electronics_Course
[TomHayes3](TomHayes3.md)
(preview [here](http://ohm.bu.edu/~hazen/DataSheets/HorowitzHill/)

[DigitalLabs](DigitalLabs.md)

## Arduino

 * [Arduino](http://arduino.cc/)
   * [Arduino Uno R3](https://www.sparkfun.com/products/11021?)
   * [Arduino Class](http://duksta.org/electronics/arduinoclass/)
   * [Diavolino](http://shop.evilmadscientist.com/productsmenu/tinykitlist/180-diavolino)
[starter pack](http://shop.evilmadscientist.com/productsmenu/tinykitlist/310-diavostart)
   * [ArduinoTricks](ArduinoTricks.md)
 * [ArduinoProjects](ArduinoProjects.md)


## Xilinx FPGA Materials

 * [Digilent](http://www.digilentinc.com)
[Details](http://www.digilentinc.com/Products/Detail.cfm?Prod=BASYS2)
   * $49 each (student price)
   * Pros:  USB-downloading built in, simple, cheap, complete, has VGA video port and PS-2 keyboard port
   * Has 4 expansion connectors for DACs, ADCs etc
   * Cons:  no analog I/O or RAM except 8kB on FPGA
 * [PMOD add-on boards](http://www.digilentinc.com/Products/Catalog.cfm?Cat=9)
   * DAC and ADC boards are around $20 each, many other functions are available
 * [ISE WebPACK](http://www.xilinx.com/ise/logic_design_prod/webpack.htm)
 * [Xilinx Programmable Logic Design Quick Start Guide](http://www.xilinx.com/support/documentation/boards_and_kits/ug500.pdf)

## Project Ideas

 * Using BASYS board with ADC/DAC modules (or equivalent)
   * *'Digital Voltmeter*.  Display on 4-digit display.  Could use a programmable-gain
  amplifier (i.e. AD524) on proto board for multi-range.
   * *'Frequency Counter*
   * *'Function Generator* (using DAC for output)
   * *'Simple Oscilloscope* using VGA video output.  This is a challenge because
  of the limited memory available in the XC3S100E FPGA (not enough for a 640x480 bitmap).

## Other References

 * http://www.allaboutcircuits.com/

