# LT584_Programming_Notes
LT584 programming notes

LT584 waveform template: [template.txt](http://ohm.bu.edu/~hazen/CMS/template.txt)
read from instrument with "TEMPLATE?" command.

*'Initialization*

Initialization sequence extracted from VB software ([MainDAQ1.zip](http://ohm.bu.edu/~hazen/CMS/MainDAQ1.zip)

"Write" means to send a command and not expect a response.

"Query" means to send a command and read back a response.

 * Write Device Clear (++clr), wait 1 seconds
 * Write "*RST"
 * Wait
 * Query "*IDN?" and read identification string
 * Write "WFSU SP,0,NP,500000,FP,0,SN,0" (Waveform setup:  send all data points, all segments)
 * Write "TRSE EDGE,SR,C1" (Trigger setup:  edge trigger, channel 1
 * Wait
 * Write "TRDL 20PCT" (trigger delay: 20 percent)
 * Write "C1:TRCP AC"  (trigger coupling)
 * Write "C1:TRLV 0.01V" (trigger level)
 * Write "C1:TRSL POS" (trigger slope)
 * Wait
 * Write "TRMD SINGLE" (single sweep mode)
 * Wait
 * Write "TDIV 1.0US" (horizontal scale)
 * Wait
 * Write "C1:TRA ON" (trace on)
 * Write "C1:VDIV 0.1V" (vertical scale)
 * Write "C1:ATTN 1" (1x attenuation)
 * Write "C1:CPL A1M" (AC 1M coupling)
 * Write "C1:OFST 0V" (no DC offset)
 * Wait
 * Write "SEQ ON,1000,500" (1000 segments of 500 points)
 * (delay 500ms)
 * Wait

The "Wait" operation can consist of sending the "*OPC?" command and waiting for the response (which should always be "1").

*'Arm for Trigger*

 * Write Device Clear (++clr)
 * Write "ARM"

*'Check for Trigger*

 * Query "INR?" (wait for bit 13 [8192](8192.md)

*'Read trigger times*

 * Query "C1:INSP? ''TRIGTIME'".  Returns list of times (try it to get the format).



