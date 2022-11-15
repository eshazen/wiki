# PostReviewIssues
This page describes the outstanding issues that need to be resolved prior to the production run of  g-2 tracker electronics.

## Issues raised during the review
Overall, the review was positive regarding the electronics:
  [](attachments/)
[BR](BR.md)
There are some recommendations (that we can't ignore) and a few other suggestions (which seem sensible to me but may be too difficult to implement). Here are the recommendations:
 * Push forward production schedule as much as possible to get all the boards we can out before Christmas (not in this document but in answers to charge questions)
 * TDC be modified to include cable connectors attached to spare FPGA I/O pins through suitable drivers and receivers to allow the system to be debugged with an oscilloscope during operation.
   * Good idea.  Tentative plan is to add one 10-pin (2x5) 2mm pitch header per TDC with four LVDS pairs and two GND
 * Modify a module for test purposes to allow the use of at least one ASDQ BLR (analog) output.  The analog signal will quickly reveal subtle problems that may exist with the configuration or biasing of the ASDQs. [](attachments/) [](attachments/)
   * Eric:  talk to Sten H about best way to do this
   * James:  see if there is room to get a small twisted pair out
 * Interface between the straw and the electronics is established through sockets in a printed circuit board.  Due to the rigidity of this connection there is a potential risk to break wires when installing and/or removing this board. Unless testing establishes that this is not a concern, an alternative way of connection is desirable like in the form of conductive elastomer that provides a flexible soft connection or some kind of spring loaded connection that can be engaged/released mechanically all at once for all connections.
   * Wait for further Liverpool testing before doing anything drastic

[BR](BR.md)
And here are the suggestions:
 * Understand what's going on with widths of pulses - look into setting drain current or QTHR to different value - we might like to make this short to minimise dead time.
 * Test performance with different power rail settings (+/- ~2.8 V).
   * James is going to look into this

## Outstanding issues after the test beam
We still also have some other issues that need to be resolved.  This list may be incomplete:
 * ECOs on all boards: Update designs
 * CDR locking: no data returned or garbled data returned some small fraction of the time.
 * ASDQ Boards: HV connector, sockets (see recommendation), QTHR setting
 * Flexis: Length modifications
 * Temperature sensors: test those attached directly to the feedthrough board.
 * HV Grounding: OK for just one grounding point? Ground board attachment to HV board.
 * HV Wiring: Map everything out with new manifold
 * TDC Board: New integrated TDC board (see separate page)
 * Remote loading of firmware - make sure we can do this with our current layouts.
 * Hit edge studies - why don't we see both hit edges for all hits?
 * Hit LSB timing histogram - can we fix the firmware to have reasonable timing for the 0.625 ns bins?

