# Gizmo_schematic_errors
This lists differences between the gizmo as built and the current draft of the schematic [here](http://ohm.bu.edu/~hazen/G-2/OldDocumentArchive/GizmoSchematic.pdf)

 * The DATA and CLOCK labels on the schematic are wrong and should be flipped.
 * Data going to the 12-bit fine time DAC does not travel through the shift register, but goes directly from data in to both the shift register and the 12-bit DAC
 * There is a separate input line that provides the load signal to the 12-bit DAC
 * DAC (for fine setting) part number is incorrect.  It should be MX7543, not MAX7543.
 * (Data sheet: http://datasheets.maximintegrated.com/en/ds/MX7543.pdf)

In addition to the schematic errors, all output signals from software should be reversed compared to what is detailed in the gizmo note.  For example, LD_DAC and Clock should strobe low.  We suspect this is because there were previously inverters in the signal chain which are no longer being used.

