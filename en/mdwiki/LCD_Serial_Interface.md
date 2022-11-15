# LCD_Serial_Interface
This board is designed to mount on the back of a standard LCD character display such as [this one](http://www.sparkfun.com/products/9053)
It has an ATMega8 microcontroller (should be compatible with larger ATMega 48/88 etc too).

 * [backplack_sch.pdf](http://ohm.bu.edu/~hazen/LCD_backpack/backpack_sch.pdf) &ndash; schematic (also [ExpressPCB](http://ohm.bu.edu/~hazen/LCD_backpack/backpack.sch)
 * [Layout](http://ohm.bu.edu/~hazen/LCD_backpack/backpack.pcb)

*'Design Notes*

The board should mount right on the back of the LCD with 1:1 connections.

The LCD wiring is 4-bit only and a little funny due to the desire to keep the ADC inputs of the AVR available.  It will require bit-shifting by 2 bits.

The programming connector (J1) is compatible with the TuxGraphics programmer.

The board could in principle run on either 3.3V or 5V -- make sure your AVR and LCD are the same voltage!

X1, C1, C2 can be omitted if the AVR is run on it''s RC oscillator.

J3 has access to all the spare I/Os including 4 ADC channels and the I2C bus.


