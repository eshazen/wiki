# PerkinsAutomationNotes
Back to [PerkinsTelescope](PerkinsTelescope.md)

### Thoughts on Automation

*MOVE computer*

This is currently a Pentium III computer running MS-DOS 6.11.  The interface to the telescope systems is through 4 serial ports, a PCX-48 motor controller and a video frame grabber used by the guider.

Serial ports:

 * COM1 - guider motor control
 * COM2 - remote control
 * COM3 - barcode reader for dome position
 * COM4 - guider camera control

COM1 and COM3 share an interrupt; the IO is handled by assembly code in `com13io.asm`, likewise COM2 and COM4 in `com24io.asm`.

The PCX-48-4E motor controller ([data](http://www.omsinmotion.com/pc48)) is managed by the assembly code in `pcxio.asm` and FORTRAN functions PUTPCX in `putpcx.for`.  PUTPCX() is called from many places in the code with hard-wired command strings.

PCX-48 channels:

 * Axis X is RA (positive to the W)
 * Axis Y is Dec (positive to the S)
 * Axis Z is Focus (positive out at 72)
 * Axis T is dome motor for 72"

The T axis uses the LOTC-07 expansion box, which allows addressing multiple motors (only one used for Dome drive on the 72").
The details are dscribed on page 10 of the [perkins manual](http://gauss.bu.edu/svn/perkins-telescope/OriginalDocs/Perkins_Manual.pdf).
Essentially the sequence "*AT MR# GO*" where # is a small integer indicates address selection.

*Telescope motion*

Could replace PCX-48 interface in DOS machine with a newer one from Oregon Micro Systems.  With care it could be wired into the LOTC "green card box".  Commands in Fortran code would have to be updated.

*Dome Shutter*

This could be done fairly easily by driving the contactor on the dome which is currently controlled by the lever switch.
Safety features:

 * Camera viewing the shutter opening
 * Speed monitor on the winch drum
 * Computer readback of the limit switches

*Dome Rotation*

Dome rotation is controlled by the T axis of the PCX-48 controller, while the current position is read by a barcode reader on COM3, see subroutine `BARCODE` in `barcode.for`.

*Guider*

This would probably need to be completely redone.
