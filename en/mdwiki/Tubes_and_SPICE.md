# Tube simulation using SPICE

Specifically, the now antique LTSpiceIV from Linear [link](http://ohm.bu.edu/~hazen/DataSheets/LinearTech/LTspiceIV.exe) which works under Wine.  See also [LtSpiceNotes](LtSpiceNotes.md) for LTSpice notes.

Links:

* [Simulations of tube scircuits with Spice](https://www.homecookingwithvalves.com/Triodescircuits-and-Simulations/Triode-Circuit-Simulation-with-Spice.html)
* https://github.com/aempirei/LTSpice-IV-Models

How to set things up:

* Install wine
* Install LTSpice:  "wine LTspiceIV.exe"
* Get symbols and modesl from e.g. [github](https://github.com/aempirei/LTSpice-IV-Models)
* Put model files in `~/.wine/drive_c/Program Files (x86)/LTC/LTspiceIV/lib/sub` and symbol files in `~/.wine/drive_c/Program Files (x86)/LTC/LTspiceIV/lib/sym/Misc`.
* Place a symbol, right-click and edit the attributes:

| Attribute  | Value  | Vis |
|------------|--------|-----|
| Prefix     | X      |     |
| InstName   | U1     | X   |
| SpiceModel |        |     |
| Value      | 12au7a | X   |
| Value2     |        |     |
| SpiceLine  |        |     |
| SpiceLine2 |        |     |

Now the simulation should run.
