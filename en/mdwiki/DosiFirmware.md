# DosiFirmware
Back to [Roblyer_dDOSI](Roblyer_dDOSI.md)

The DOSI system consists of:

 * One [ADC12D1800RFRB](http://ohm.bu.edu/~hazen/DataSheets/National/ADC12D1800RFRB.pdf)
 * Up to six [AD9910/eb](http://www.analog.com/en/rfif-components/direct-digital-synthesis-dds/ad9910/products/EVAL-AD9910/eb.html)
 * One [Custom FPGA board](http://ohm.bu.edu/~hazen/Roblyer/AdapterBoardDescriptionV2.pdf)

This page describes the firmware requirements for the custom FPGA board.  Referring to the first page of the FPGA board document, ADC data is received from the FPGA board continuously (once it is initialized) on four groups of 12 LVDS pairs, each at 450MHz DDR (900Mb/s).  There are a few LVDS control signals which may or may not be important (see ADC12D1800RFRB documentation above).  These signals are received by the main FPGA (U2) on the PCB.  Also connected to this FPGA is an SFP fiber transceiver which provides a Gigabit Ethernet (GbE) interface.

A second FPGA (U1) provides control signals for all the DDS boards.  Four I/Os are routed between the two FPGAs to be used as a simple serial communications interface.  Both FPGAs are the same type, Xilinx Spartan-6LXT P/N XC6SLX45T-FGG484.

The firmware may be developed in two phases.

## Phase 1 Firmware

*'General requirements*

 * Provide GbE computer interface for control and readout (suggest use of IPBus).
 * Receive DDR data from ADC and buffer in BRAM

 * Provide efficient GbE readout of buffered data
 * Provide a serial interface to access registers on the DDS boards
 * Provide a parallel interface to control other I/Os on DDS (PROFILE[2:0](2:0.md)

The functions are partitioned as follows between the two FPGAs:

*'U2 (Main FPGA)*

 * GbE interface
 * DDR data receiver and buffers
 * Master for simple serial interface to U1

*'U1 (Slave FPGA)*

 * Slave for simple serial interface from U1
 * For each of (6) DDS boards:
   * Serial interface to AD9910
   * Parallel interface for frequency setting
   * Control/readback of misc. control signals

*'Memory*

 * 4k samples on two channels.  Received as 4X 12-bit streams (two streams per ADC channel) so 1K DDR clocks per WF.
 * 4k x 12 WF requires (4) 2k x 9 BRAMs, so 8 BRAMS needed per 2-channel capture cycle.
 * LX45T FPGA has 116 BRAMS.  Could store i.e. 12X capture cycles (96 BRAMs) and use remainder for IPBus buffering.

*'Register Layout*

Present one capture cycle as 4k 32-bit words with two channels side-by-side in word
Operate as FIFO like DCC/AMC13 partitioned memory with "page advance" register to go to next waveform.


*

### Current Version

 * [DOSI firmware](http://physics.bu.edu/~wusx/download/DOSI/)

