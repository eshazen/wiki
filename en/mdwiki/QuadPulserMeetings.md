# QuadPulserMeetings
*2018-10-24*

Meeting with Nam and Quad group

Proposed firmware modification per Quad request:

 We have a request for free run mode: several charge pulses in a train followed by a discharge pulse (see attached
 images).  The reason we can’t use a long (2-3 ms) charge pulse is the hardware pulser could not accept such long
 pulse, so we would try to divide the charge pulse into several pieces.
 It is better if the pulse width and number of pulses in the charge train can be configurable.

See details:  [QuadMultiPulser](QuadMultiPulser.md)

*2018-07-03*

Meeting with Dan, Nam.

Scheduling:

 * July 10 - shutdown starts
 * July 16-20 - Collaboration meeting in Denver
 * Aug 6-19 - Nam away
 * ~Sept 16 - shutdown ends (??)

Nam currently has the test setup in his office, but plans to move (to Lab 3 in village?) where there is a scope and signal generator.

Needed at FNAL end (Nam):

 * Details about clock and spill signals (voltage levels).  We currently require "TTL" levels (~3V into 50 ohms)
 * Computer account
 * JTAG cable for him to use
 * DB-9 cable details and sex
 * Prepare SMA cables for connection to quad pulser

