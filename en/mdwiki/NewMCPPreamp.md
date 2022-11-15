# NewMCPPreamp
Up:  [ElbatTOF2017](ElbatTOF2017.md)

This is a preamp/discriminator designed to provide a logic pulse in response to each single-electron pulse from a Hamamatsu three-stage MCP.

Received from Hamamatsu a sample output waveform for an F2225-21S (two stage MCP?)
 * [F2225-21P_Output%20waveform_10mV_pro-1.pdf](http://gauss.bu.edu/svn/tof-system/Documenation/Hamamatsu/F2225-21P_Output%20waveform_10mV_pro-1.pdf)
 * [file:///home/hazen/Downloads/MCP_TMCP0002E.pdf MCP_TMCP0002E.pdf] (see page 17 for wiring suggestions)

Some thoughts on readout:

 * Use grounded Anode (top left diagram on p17 above)
 * AD8000 or similar current-feedback op-amp in non-inverting mode.
 * MAX9691 or similar fast ECL-output comparator


