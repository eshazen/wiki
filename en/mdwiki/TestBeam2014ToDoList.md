# TestBeam2014ToDoList
# Test Beam 2014 To Do List
## Emergency DAQ Plans

 * See [Robs Notes](http://ohm.bu.edu/~hazen/G-2/TestBeam2014/facts%20about%20the%20testbeam.txt) about test beam
 * Test 1MHz operation of a couple of TDC channels
 * Fix the logic on the Xilinx board so a single command/signal can reset, trigger, readout
 * Triggering options
   * External "spill" input which causes one TDC cycle with readout
   * Computer-triggered "spill" providing an output logic signal
 * Get 16MB on-board RAM on NEXYS3 working for buffering during a 4sec machine cycle.


## To Buy

 * VMOD-WW wire-wrap adapter board for (ordered 11/25/13 for 2-day shipping)
 * ATLYS board (ordered 11/25/13)
 * More JTAG cables from Samtec (P/N FFSD-08-S-10.00-01-N, ordered 11/25/13)
 * *Altera USB programming cable*

## Tasks

 * Get flash memory working on TDC board
 * Test multi-channel TDC operation
 * Calibrate discriminator threshold vs input charge
 * Get together a simple python data-taking script

## For chamber commissioning (early Dec.)

 * 1 set working electronics (ASDQ + TDC board) at FNAL
 * Nexys3 Xilinx board with connector board
 * MicroUSB cables (2)
 * Readout cable (Xilinx-to-TDC) ~ 1m long
 * Computer with Altera and Xilinx software for FPGA programming
 * *Altera USB programming cable*

## For test beam (early Jan.)

 * 3 sets working electronics (ASDQ + TDC board) at FNAL
 * Computer with IPBus and some sort of DAQ (plus Xilinx and Altera software)
*
