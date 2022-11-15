# TTTT_Debugging
## Debugging
#### 2015-10-09 (Dan Gastler)
Setting up an AMC13 with a 12AMC fake data run (rg,rc,en 1-12 f), I slowly stepped the rate from 600hz up to 15598hz.
At the final setting of the rate (cmds below), the AMC13 went into overflow warning (0x1), causing the TTTT to start skipping new L1As.
This stopping of triggers can be seen in TTTT register 0x40 which shows L1As being skipped and no L1As being sent in this state.
I don't understand why the AMC13 doesn't go back to ready (0x8) once the triggers have stopped.
`>l1a_per 7FFF`\\
`>l1a_per 3FFF`\\
`>l1a_per 1FFF`\\
`>l1a_per 0FFF`\\
`>l1a_per 0F00`\\
`>l1a_per 0E00`\\
`>l1a_per 0D00`\\
`>l1a_per 0C00`\\
`>l1a_per 0B00`\\
`>l1a_per 0A00`\\
`>l1a_per 0900`\\
Here is where the AMC13 goes into OFW
Check the TTS state of TTTT (bits 7-4) = 0x1 OFW\\
`>rr 10`\\
`0x0000001300007F11`\\
