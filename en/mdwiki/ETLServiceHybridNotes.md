# ETLServiceHybridNotes

Thinking about a board-to-board connector for the PB to RB interface.
There are about 32 unique ETROC signals, assuming all power supplies are separate but no redundancy.

Daniel says we have about 2x18mm space with a target stack height of 4.5mm.

Possible candidate connectors:

 * https://www.molex.com/molex/products/part-detail/pcb_receptacles/5046184012
 * https://www.molex.com/molex/products/part-detail/pcb_headers/5046224012 (mate)

These are 0.35mm pitch, double row about 2mm wide.  Stack height is only 0.6mm though.

### Bias voltage

 * https://www.smps.us/pcbtracespacing.html

Recommended spacing vs voltage from IPC-2221B:

|                            | 800V   |
|                            | ----   |
| External traces (uncoated) | 4mm    |
| Internal traces            | 1mm    |
| External traces (coated)   | 1.72mm |
