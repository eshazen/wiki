# HpNixieCalculator
Ordered 15 IV-6 VFD tubes for a next-gen retro calculator.  Need a new display board, reuse old keyboard part and CPU.

See https://github.com/eshazen/retro-25/tree/master/notes/VFD-Display

Other observations.  Looking at Japanese IV-6 breakout board and Eagle design from Osh Park, looks like 32 mil holes on a 0.3-0.34 diameter circle are good.  Front-face is either between pins 8 and 9 or pin 9 depending on who you believe.  Spacing is around 0.538 (13.7mm) (Japan).  Data sheet says tubes are 13mm max diameter.

Driver options:


| *Chip* | *Package* | *No Req'd* | *Notes* | _Price_' |
| ------ | --------- | --- ------ | ------- | -------- |
| UDN2891A or UDN2892A | DIP | 12+ | Parallel 8 inputs | $3.95 (Jameco) |
| MAX6920 | SOT | 8 | Serial interface 12 outputs | $4.82 (!DigiKey) |
| HV518P | DIP40 | 3 | 32-output serial interface | $6.42 (!DigiKey) |
| HV5812 | DIP28 | 5 | 20-output serial interface | $2.42 (!DigiKey) |


