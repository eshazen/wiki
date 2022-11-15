# QuadPulserControlDesignNotes
Nav: [QuadPulser](QuadPulser.md)

## Integrated ADC Hardware

 * ADC board:
   * Artix-7 FPGA to ADC board.  Suggest XC7A35T-FTG256.  This is a 1mm 17x17mm BGA (but no MGT).
   * Logic I/O controlled by FPGA:
     * 10 pin ribbon for DB-9 crimp
     * Additional 8 coax I/O (maybe just another header)
   * Interfaces to main board:
     * 100 MHz sampling clock (with on-board oscillator jumper option)
     * 4 pairs (bidirectional clk+data) to/from main board
   * Debug interface
     * Asynchronous serial (picoblaze?) with FTDI header
   * Flash memory
 * Main board:
   * re-use DOSI one.  Need four pairs (or maybe can manage 2) for readout/control interface
   * not needed in prototype, use FMC adapter to e.g. Zybo

## Mechanics

 * Hammond Rugged Rack Chassis [Link](https://www.hammfg.com/dci/products/accessories/rm) series seems a reasonable choice, either 1U or 2U.  Width inside about 16.6".  Standard FMC is 69mm (2.72 in).  Could extend board width up to ~4 in. Using *RM2U1918VBK*
 * SMB on board:
   * Edge mount SMB connectors (e.g. [142311](http://www.mouser.com/ds/2/18/142311-712936.pdf)) require 10mm (0.394) space.  Right-angle thru-hole types could probably be placed 0.3" center-to-center.
 * BNC on panel:
   * BNC connectors are ~14.5 mm diam (0.57 in).  Patch panels with ~0.8in spacing (20 per row) exist [Amphenol link](http://www.amphenolaudio.com/products/bnc/panel/patch-panel/)
   * We need 8X inputs and 2 or 3 outputs per pulser.  Total of 44-48 or 3 rows of 16 BNCs.
   * BNC bulkhead crimp RG-58 Amphenol RF# 112236 $4.27 @ 25 (Mouser)
   * SMA crimp RG-58 Amphenol RF# 132113 $3.63 @ 25 (Mouser)

## Digitizing and signal processing

 * Digitize 32 channels at 100 MSPS (single gain scale), full scale +/-5 or +/-10V
 * Artix XC7A35T has 1.8Mb block RAM.  These are around $35 each.  Propose to use one per Quad pulser (total of 4 in system).  This could store ~ 150us of waveform per channel on all channels, seems fine.
 * Transferring entire 1.8Mb in 10ms elsewhere requires a 180Mbps link (only)
 * Store zero-suppressed waveforms with length limit, when limit exceeded record just width or number of zero-crossings or other info to characterize the pulse.  Possibly the absolute-value envelope with low resolution but calculated in the FPGA
 * Readout via MGT point-to-point to !PicoZed, thence over Ethernet
 * Worst case bandwidth:  1.8Mb * 4 pulsers * 12Hz = 86Mbps (10 MBytes/sec or 2.7 MHz 32-bit words)

Observations about signals:

 * "Normal" case is three short pulses (few uS long at most) at 0, 50us and around 1ms
 * Stray discharges are typically quite short (few 100ns), amplitude similar to normal pulses (<1V)
 * Sparks are characterized by large amplitude and significant width.  There can be a train of spark pulses spread out over substantial fractions of the 1ms pulse period.
 * Beam timing has ~ 10ms between pulses where the should be no signals

## Initial Firmware Requirements

 * Waveform data
   * Limit data to ~ 10k samples per channel per spill
   * This is about 480 kBytes/spill, or 48 MB/s for continuous recording at 100 Hz
   * It takes ~ 20 sec to accumulate 1 Gb at this rate
 * Acquisition / control model
   * Capture counter summary and zero-suppressed waveforms every 10ms
   * Normally, discard spills in which there is no above-threshold data (hopefully most of the time!)
   * Buffer NZ records first in RAM up to 1 Gb then to SD card or Ethernet
   * Prioritize summary data if memory gets full



