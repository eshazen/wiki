# HpNixieCalculator

Built a VFD version of HP-25.   See https://github.com/eshazen/retro-25/tree/master/notes/VFD-Display

Thinking about another thing- an HP-16C clone with some sort of cool 7-segment display.
Display ideas:

* Just build another IV-6 VFD tube display.  They're pretty cool.
* Panaplex.  These are gas-discharge (neon) 7-seg displays; quite a few with 12 digits made
  * Pandicon(TM): ZM1500, ZM1200 
* Mechanical 7-segment display.  Cool idea but hard to make small
* Home-made 7-segment using tiny SMT LEDs.  Hmm...

Driver options:

| *Chip* | *Package* | *No Req'd* | *Notes* | _Price_' |
| ------ | --------- | --- ------ | ------- | -------- |
| UDN2891A or UDN2892A | DIP | 12+ | Parallel 8 inputs | $3.95 (Jameco) |
| MAX6920 | SOT | 8 | Serial interface 12 outputs | $4.82 (!DigiKey) |
| HV518P | DIP40 | 3 | 32-output serial interface | $6.42 (!DigiKey) |
| HV5812 | DIP28 | 5 | 20-output serial interface | $2.42 (!DigiKey) |


