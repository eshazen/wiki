# SpringleafUSBControl
This page describes a USB battery discharge controller for Springleaf.

## Project Description

(from Greg Ekchian at Springleaf)

I would like to quote a project for making a printed circuit board and containing box with the following criteria.






## Further Details

He would like two assembled boxes and one spare assembled PC board.
He has a USB-6210 we can borrow.

He would like us to order both sizes of box proposed below and we should use the smaller size
if the USB-6210 fits.

An additional connector should be provided for an alternative application where
no relay is required, i.e. a connector across the relay contacts.


## Parts Chosen

 * USB-6210 from National Instruments &ndash; [Web Page](http://sine.ni.com/nips/cds/view/p/lang/en/nid/203223) &bull; [Photos](http://ohm.bu.edu/~hazen/Springleaf/USB_Box/)
 * Preferred box:  Hammond 1590EBK
 * Alternate box:  Hammond 1590EEBK
 * Banana jack black:  Pomona 1581-0
 * Banana jack red: Pomona 1581-2
 * Banana jack yellow:  Pomona 1581-4
 * Relay:  Coto 9007-05-40 (DigiKey 306-1251-ND)

The USB-6210 is to be mounted inside the box with an opening cut to allow entry of the USB cable.
One digital output from the USB-6210 drives the coil of the relay.  The N.O. relay contacts
are connected in series with the battery and 60 ohm resistor.

Proposed layout is an ExpressPCB mini-board mounted below the lid of the box on short spacers.
The banana plugs would be mounted in the PCB, projecting through the lid.
The relay, resistor and a two-pin connector for the USB-6210 are mounted on the bottom of the board.

## Design Files
 * [Front Panel Drawing](http://ohm.bu.edu/~hazen/Springleaf/USB_Box/files/Automated%20Rdc%20System%20Box.PDF)
 * Schematic [USBControl.sch](http://edf.bu.edu/~cjlawlor/SpringLeaf/USBControl/USBControl.sch) &bull; [PDF](http://ohm.bu.edu/~cjlawlor/SpringLeaf/USBControl/USBControl_sch.pdf)
 * Layout [USBControl.pcb](http://edf.bu.edu/~cjlawlor/SpringLeaf/USBControl/USBControl.pcb) &bull; [PDF](http://ohm.bu.edu/~hazen/Springleaf/USB_Box/files/USBControl_pcb.pdf)
 * Mechanical Drawing [USBControl.dxf](http://edf.bu.edu/~cjlawlor/SpringLeaf/USBControl/USBControl.dxf)

