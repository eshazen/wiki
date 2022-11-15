# MezzNgBreakoutBoard
Up: AtlasMichiganMezzCard (board docs) * MezzNgMicrocontroller (programming)

<img src="http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/Breakout/front_wired_sm.jpg">

We developed a small breakout board to simplify bench test of the new mezzanine board.
This board provides a convenient way to power the board, program the microcontroller
and access the configuration interface.

The board requires 5V power.  Connect the AVdd_in and DVdd_in together to +5V and
AGND and DGND (jumpered already) to the supply GND terminal.

Use a Sparkfun FTDI serial breakout (like [this one](https://www.sparkfun.com/products/13746) or
[this other one](https://www.sparkfun.com/products/9873)) to connect to a computer.
Use a terminal emulator (minicom works well in Linux) set to 9600 baud, 8 bits, no parity,
no handshaking.

Connect the mezz card to the board using a ribbon cable.

Power up the board, and you should see the microcontroller announce itself:

```
  MezzNg V1.0
  $
```

See MezzNgMicrocontroller for details on the protocol.

### Design Files

 * Board Photos:
   * [Front](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/Breakout/Front.jpg)
 * PDF design files:
   * [MezzBB_sch.pdf](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/Breakout/MezzBB_sch.pdf)
   * [MezzBB_pcb.pdf](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/Breakout/MezzBB_pcb.pdf)
 * ExpressPCB CAD files:
   * [MezzBB.sch](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/Breakout/MezzBB.sch)
   * [MezzBB.pcb](http://ohm.bu.edu/~hazen/ATLAS/MichiganMezz/Breakout/MezzBB.pcb)
