# RevBFLightSimulatorNotes
## Layout Review 11/4/13

### Schematic

 * M0, M1 not connected on FPGA.  M1->GND  M0->3.3V
 * TDC power connections need to change.
   * Please add an external power connector (4 pins) for +3V, GND, -3V, GND (+3V not same as +3.3V!)
   * Wire P15 pin 1 to +3V, P15 pin 3 to -3V, pins 2,4,9,10 to GND
   * Add a jumper to optionally connect +3V to +3.3V

### Layout

 * Review carefully top and bottom silkscreen and move labels as need to avoid overlap
 * Add copper pour under area where ASDQ board mounts on top layer with 0.25" overhang connected to GND.
   * Generous clearance, maybe 0.012"
   * Add a grid of vias to GND inner layer from copper pour on maybe 0.5" centers

