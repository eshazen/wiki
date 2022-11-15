# ADC-RevC-ECO
## Warnings
 * R147 is currently 0-Ohms and would then connect power enable from the carrier board to 12V!  This should be removed or replaced with a large resistor for protection.
 * R161 connects 12V to 3.7 Volts.  Please remove
## TODO
 * Add pin 1 mark on U5
 * The incorrect flash was chosen and shorts out 3.3V.   This can be fixed by melting off the package and cutting traces.
 * R161 connects 12V to 3.7 Volts.  This should be changed or replaced with a large resistor
 * U30 requires ECO to change buffer direction Link [](attachments/)
 * Y1 requires ECO to swap pin 4 and 6 Link [](attachments/)
 * R158 change 10K to 1K
