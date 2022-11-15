# Temporary_Trigger_Module
This page provides documentation for a simple PCB
which provides external inputs and outputs for
the trigger and timing signals on the DCOL.
The board will be a very simple 6U VME format board
which takes only power and GND from the VME bus.

It will have the following front-panel connectors:

 * RJ-45 to/from DCOL module
   * pair (3,6) - LVDS output to DCOL
   * pair (7,8) - LVDS input from DCOL
 * LEMO 1 - NIM fast logic input (drives 3,6 of RJ-45)
 * LEMO 2 - CMOS 3.3V logic output (driven by 7,8 of RJ-45)

The board will need one LVDS transmitter and one LVDS receiver
(could be a single transceiver).  The NIM fast logic input should
be implemented using a fast comparator ("fast" means < 20ns delay)
with a threshold set at -400mV.  The CMOS logic output should
be able to drive 50 ohms to a decent level (>2V).
One way to accomplish this is to use a 74ALVC04 hex inverter
with three gates in parallel.  A perhaps nicer alternative
if they still exist is the 74S140 50 ohm line driver.

Please see the ExpressPCB layout on the page below
as a starting point.  The VME connector, board outline
and placement of front panel connectors can be preserved.

 * [Sample VME Board](http://ohm.bu.edu/cgi-bin/edf/VME_Interrupter)
 * [Page with definition of NIM logic](http://www.ortec-online.com/res_apps/res_std_def.htm)
 * [VME P1 pinout](http://joule.bu.edu/~hazen/DataSheets/VME/j1_p1.GIF)
  _'Note: only rows a, b, c are available_

