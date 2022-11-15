# Rev_2_PCB_Layout_Notes

 * Please add a part number for the MOSFET (Q1) and make sure it's in the BOM
   * OK
 * The top silkscreen needs a bit of work.  Please make sure all the references use the same line width and text height, and are lined up neatly where possible, and all right-side up unless there is a good reason for them to be rotated.  Also, don't place silkscreen elements on vias as that part of the text will be lost.
   * OK
 * The LEDS all need some polarity marking on the silkscreen.  See for example the [data sheet](http://vcclite.com/_pdf/VAOL-S6RP4-LED-0603-red.pdf) for the Red LED.  There is a drawing which shows "Cathode mark" with a notch... maybe you can draw a notch on the silkscreen like that (not overlapping the pad, of course).
   * OK (maybe).  They may still call us!
 * Please move the silkscreen labels for SW1-SW3 so they are on the board.
   * OK
 * You need to create a fabrication drawing (on the "Dwgs.User" layer) which gives dimensions of the board and the slots for the card edge connector.
   * NOT DONE
 * Fix U1 footprint and wiring per discussion.  Is it possible to get solder mask between the pads of this device?  See [screenshot](http://ohm.bu.edu/~hazen/RedSeat/gyro_routing.png) for suggested ground connections.
   * OK
 * C8 should have it's own GND via close to the ground pad.
   * OK
 * The GND to the card edge (J3) needs to be improved.  I suggest you change the pin definitions on J3 (which are arbitrary) so that there are two GND and one 3.3V instead of the other way around.  Put the two GND on the back layer and the one 3.3V on the front layer.  That way you can easily connect from the planes to the finger.
   * Much Better

One more thing:

 * The card edge connector should have the solder mask opening enlarged so it exposes the entire PCB finger on both sides.
