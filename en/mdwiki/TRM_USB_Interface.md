# TRM_USB_Interface
A simple USB emulated serial interface provides for control/readout of the TDC.
The output is C5 code described in the IEEE paper, with encoding as given
in Table I.  *'Q0* codes are sent continuously when the link is idle.
Other codes may be sent by using the commands below.

The input logic expects 8B/10B data in serial format at 25Mb/s.
A *'K.28.1* code synchronizes the link and starts a transmission.
Then 2048 words of 32 bits are received and stored in a block RAM for readout.

The emulated serial port operates at 9600 baud, 1 stop bit, no parity
and no handshaking.  When the board is powered up, after a 1s delay the message:

```
  TRM1.0
  >

```
is sent and the board waits for text commands terminated by a CR or LF.
All characters sent from the computer are echoed for convenience
in operating with a terminal program.

After any output from the command, a new ''>' prompt is sent.
Commands are documented [here](https://docs.google.com/document/d/1IGZqD2rKQFlQ4Jv8SmbXRmuNURDFEiVixDCB6grOYzA/edit?usp=sharing)
(Google document)


