# UsingAlteraQuartus
### Getting Started

 * Quartus Prime standard edition 15.1 is currently preferred.
 * We have a license server for 5 licenses.  Use "1800@watt.bu.edu" as the license file.  Note also that both ports 1800/tcp and 1801/tcp are used for communication with the server, so both must be open in firewalls
 * For the Terasic DE0-Nano board, see this page for USB setup details: http://www.local-guru.net/blog/2011/9/25/Using-the-terasic-DE0-Nano-on-ubuntu

 === On-Chip Block Memory ===

 * IP generator for ROM:1-port works with MIF (memory init file) *BUT* you must add the MIF file to the project or it is silently ignored!

 === Simulation ===

 * Step 1: Ignore all documentation from ALTERA
 * Step 3: open your project and go Processing->Start-> Start Analysis & Elaboration
 * Step 4: resolve all errors
 * Step 5: Tools->Run Simulation Tools->RTL Simulation
 * Step 6: Now Modlesim is open; click around until you find the transcript terminal, now you can type the following:
  cd <your working directory>

  #make the work library
  vlib work

  #compile all the files
  vcom file1.vhdl
  vcom file2.vhdl

  #or if you have verilog
  vlog file3.v

  #now start a simulation
  vsim my_top_level

 * Step 7: Now you should get a list of signals which you can force via the GUI or by shell commands
 * Step 8: In Objects you need to select all the signals you want to see and then right click -> add wave
 * Step 9: Now go to town with tcl!
  #run it for some time
  run 1 us

  #start simulation over
  restart -f

 === Programming (remotely) ===

  These are instructions on how to plug in the USB-Blaster cable on computer A, and use this from computer B

  Computer A must already have Altera's Quartus or QuartusProgrammer packages installed

 * Step 1: On computer A, do a "sudo killall jtagd" to remove all instances of the jtag server.
 * Step 2: On computer A, run "jtagconfig" to start the local programming server.
 * Step 3: On computer B, do a "sudo killall jtagd" to remove all instances of the jtag server (really important!)
 * Step 4: on computer B, setup an ssh tunnel to computer A to forward port 1309 from localhost on B to localhost on A
  `ssh -v -N -L 1309:localhost:1309 user@computerA `
 * Step 5: Run quartus as normal on computer B.  You have now tricked it to use the tunneled jtagd.
