# ASDQ_TDC_Tester

This page documents a test fixture for the new ASDQ boards.

## PCB Layout

 * [SVN Link](http://edf.bu.edu/svn/edf/G-2/NewElectronics/TestFixtures/ASDQ_TDC_Tester/)
 * Schematic: [SCH](http://ohm.bu.edu/~hazen/G-2/ASDQ_TDC_Tester/tester.sch) / [PDF](http://ohm.bu.edu/~hazen/G-2/ASDQ_TDC_Tester/tester_sch.pdf)
 * PCB Layout: [PCB](http://ohm.bu.edu/~hazen/G-2/ASDQ_TDC_Tester/tester.pcb) / [PDF](http://ohm.bu.edu/~hazen/G-2/ASDQ_TDC_Tester/tester_top.pdf) / [Power (png)](http://ohm.bu.edu/~hazen/G-2/ASDQ_TDC_Tester/tester_pwr.png) / [Ground (png)](http://ohm.bu.edu/~hazen/G-2/ASDQ_TDC_Tester/tester_gnd.png)
 * Parts List:  [XLS](http://ohm.bu.edu/~hazen/G-2/ASDQ_TDC_Tester/TesterBOM.xls)

Suggestions for initial assembly / test:

 * Install J1 and J2 and carefully check for opens and shorts.
 * Install all parts on page 2 of the schematic (Power connectors, voltage regulators, etc)
 * Apply +4V with current limit, and check that +3V, +1.6V, +1.4V are all present
 * Apply -4V with current limit, and check that -1.6V and -3V are present
 * Install all parts on page 3
 * Power up and check that voltages on both ends of R11 and R16 are about -0.4V +/- 0.2V.

ECO list 12-8-14:

 * -1.6V Reg was outputting -2.9V, wrong feedback network
   * R19 to 68K
   * R20 to 24K
