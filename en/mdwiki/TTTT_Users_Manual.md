# TTTT_Users_Manual
 == Connecting to TTTT via usb serial ==
 * The TTTT uses a FTDI USB to serial chip, so if it is plugged in to a linux computer, it should create a device in /dev called ttyUSBX where X is 0 - N
 * This can be opened with minicom with the no hardware flow control and 115200 baud 8N1.

 == Commands ==
 * !!!WARNING!!! If you are writing 64 bit numbers you must zero pad to 64 bits!

 * help: list commands\\

 * rw: register write\\
   ex: ">rw 31 0DEB0000000000F1" writes 0x0DEB0000000000F1 to register 0x31 \\
   [Full Register map](http://edf.bu.edu/svn/edf/TTTT/firmware/SimpleTTTT/trunk/daq_register_map/register.pdf) (You may have to download the PDF for it to work)\\

 * rr: register read\\
   ex: ">rw 31" reads the contents of register 0x31\\

 * bmesg\\

 * l1a_rng: BX range that L1As are allowed to be sent out.\\
   ex: ">l1a_rng 100 D00" allows triggers on BXings greater than or equal to 0x100 and less than 0xD00\\

 * l1a_en: enabled trigger sources (look at register 0x35)\\
   ex: ">l1a_en 1" enables the periodic trigger but doesn't change the state of the other trigger sources\\
     1 - periodic\\
     2 - random\\
     4 - external

 * l1a_dis: disable a trigger source\\
   ex: ">l1a_dis 2" disables the random trigger but doesn't change the state of the other trigger sources\\

 * l1a_per: set the 16-bit period parameter (larger means lower rate)\\

 * l1a_rand: set the 16-bit random parameter (larger means lower rate) \\

 * set_rules: sets which trigger rules are active

 * get_rules: prints the current trigger rules 0F means all rules are enforced, 0x1 means only

 * l1a_adv: used to send a broadcast message and an l1a at specified bunch crossings in one orbit \\
   ex: ">l1a_adv c00 d00 80" sends an l1a at BX 0xc00 and the boardcast message 0x80 @ bx 0xd00

 * l1a: send 1 L1a at the next BX that is in the l1a range (set by l1a_rng)

 == Other features ==
 * bit 1 of register 0x31 enables the use of the TTS state to control sending L1As. (I'll add a command later)
 * bit 0 of register 0x00 resets all registers to their power-up state.

 == Recipes ==
 ==== Setup ====
 set numer of BX per orbit (-1)
  `rw 32 0x0000000000000DEB`
 set system to allow l1as between BX 0x10 and 0xD00, apply all trigger rules, pay attention to TTS state, send BX reset messages
  `rw 31 0D000010000000F3`

 ==== Random trigger ====
 set random trigger to ~75kHz (after all trigger rules)
   `rw 37 400`

 enable only random trigger
   `rw 35 2`


 ==== Periodic trigger mode ====
 Before doing the following commands, make sure the trigger rules are set the way you want and bit 1 of reg 0x31 is set to use/not use TTS state.\\
 Also, you may want to set/check the range of allowed L1A BXs in register 0x31\\

 Disable trigger sources\\
 `>l1a_dis 7 `\\
 Set period parameter for the periodic trigger (this gives about 600hz on the AMC13)\\
 `>l1a_per FFFF`\\
 Enable the periodic trigger generator\\
 `>l1a_en 1`\\

