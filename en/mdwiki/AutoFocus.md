# AutoFocus
The Frangioni lab has made this request:

<pre>
We have a GigE color camera that we need to use for control and
auto-focusing of a zoom lens.

I''d like the BU EDF to design a circuit that contains:

1) GigE interface that accepts "broadcast" from the GigE camera. The camera
output itself is being controlled by an image acquisition computer. We want
your circuit to simply "eavesdrop" on the image.

2) FPGA to convert 32 bit color to 16-bit grayscale. Then, apply a Sobel or
Prewitt Edge Filter to the image.

3) Output a single analog voltage proportional to the edge filter result. We
will tie this analog signal into a focus motor control and use it to adjust
focus motor until contrast is maximized (i.e, image is in-focus).

4) Zoom and focus motor controllers. The motors are DC servos with encoders
and limit switches. For the zoom motor, we need the controllers to keep
track of the lens position. For the focus motor, we need the circuit to tie
in the FPGA contrast output and adjust focus motor until image is in focus.
</pre>

Frist is the issue of "eavesdropping" on GigE.  This is certainly not in compliance
with the standard.  It would require at a minimum two GigE ports, and some hardware
and firmware to transparently pass packets in both directions.  Or alternatively
a computer with to GigE NICs and some software to do likewise.

Newer cameras use the new closed "GigE Vision" standard.  Since the standard
is closed, one cannot obtain the required documentation to access the camera data.

Assuming an image is captured, the required conversion to grayscale and
signal processing seems relatively straightforward.  It could be done
either in a general-purpose processor (i.e. PC) or an FPGA.

Finally, the motor controllers should be off-the-shelf items.

Some notes about passive auto-focus algorithms.

 * http://www.cse.unr.edu/~bebis/CS791E/
 * http://en.wikipedia.org/wiki/Prewitt
 * http://ic.ncue.edu.tw/Seminar_new/9702/980309_01/980309_01.pdf

