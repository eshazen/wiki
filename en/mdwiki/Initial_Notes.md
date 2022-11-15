# Initial_Notes
### Design Notes for Single Board

 * Channel count:
   * Each VFE card handles 5 ADC channels.
   * Each channel has a 12bit ADC value and two bits of gain code for a total of 14bits/channel.

 * Pin count:
   * Each VFE connector consists of two 50-pin [ERNI](http://gauss.bu.edu/redmine/projects/cms-ecal-vfe-adapter/repository/changes/VICE/hardware/docs/ERNI-2x25-female.pdf) connectors with a combined total of 70 pins for ADC/Gain signals, 7 misc signals, and a clock diff pair, giving a total of 79 signals.
   * This board acts as a pass-through, so a total of 79x2(io)=154 signals are needed per VFE, but only (36x2)x2 = 144 of these are data signals that need to be locally passed through.
 * Artix-7 (All IOs are HR in Artix):
   * ~~1 FPGA per VFE: XC7A 15,35,50.  These have 4GTPs and 150 IOs CSG325 15x15mm~~
   * ~~1 FPGA per 2 VFE: XC7A 75,100.   These have 8GTPs and 300 IOs. FGG676 27x27mm~~
   * ~~2 FPGAs per VFE (1-in, 1-out): These would have to be staggered with high speed interconnects~~
     * With 16Gbps sending the raw data of the 5 14bit channels gives an ADC sample rate of 16Gbps/(5channels*14bits) = 228Mhz
     * If we use the GTPs directly and use a 160Mhz sample rate, then we'd need to transfer 5 ch * (14bits +2 padding) * 160Mhz = 12.8Gbps
     * Splitting this between the four GTPs and accounting for 8b10b overhead, we get 12.8Gbps * (1/4GTP) * 10bits/8bits = 4Gbps on each GTP link
   * 2 FPGA per 1 VFE (each takes half)
     * Give each connector its own FPGA and split the VFE.  For simplicity, one takes two channels, the other takes three.
     * 3channels * 14bits per channel * 2 (in and out) = 84
     * this count can be done by nominally all of the Artix series A15T (10mm x 10mm,) has 106 IOs
     * This would require 10 FPGAs and they would be staggered between handling 2 and 3 channels so that a 2 ch FPGA for one VFE would be next to a 3 ch FPGA for the adjacent VFE
     * Artix LVDS IOs: 600Mbps SDR, 950Mbps DDR
    *


### Design Notes for Multi-Board
 * Pin count:
   * 5 channels * 14 bits, Clock p+n, 8misc = 80
   * need an in and an out for each, so 160 pins
   * Same as above, 154 signals total, 144 of them are ECAL data
 * Artix-7:
   * 1 FPGA, needs to have 160 + misc = 200ish signals
   * XC7A15/35/50T has a 250 IOs package
   * XC7A100 has a 210 IOs package


|= Connection =|= Pin count =|= single ended signal count =|= differential signal count =|= total signals=|
|- ---------- -|- --- ----- -|- ------ ----- ------ ----- -|- ------------ ------ ----- -|- ----- --------|
| VFE | 100 | 5*14 + 8 = 78 | 1 | 80 |
| new VFE | 100 | 8 | (5*7) + 1 | 80 |
| option 1 FPGA A in | - | 3 | (2*7) + 1 | 33 |
| option 1 FPGA A out | - | 3 | (2*7) + 1 | 33 |
| option 1 FPGA A total | - | - | - | 66 |
| option 1 FPGA B in | - | 5 | (3*7) | 47 |
| option 1 FPGA B out | - | 5 | (3*7) | 47 |
| option 1 FPGA B total | - | 5 | (3*7) | 94 |
| option 1 FPGAs (A715/35/50)  | | | | 106 |
| option 2 |

### Connectors
   * [VFE](http://gauss.bu.edu/redmine/projects/cms-ecal-vfe-adapter/repository/changes/VICE/hardware/docs/VFE-connector-ERNI-154765.PDF)
   * [Adapter-to-VFE](http://gauss.bu.edu/redmine/projects/cms-ecal-vfe-adapter/repository/changes/VICE/hardware/docs/Adapter-VFE-connector-ERNI-154765.PDF)
### TODO

 * FE-like design
   * FPGA pinout and layout issues for 0.5mm pitch FPGA
     * Can route one trace out between pads with 3mil trace buffered by 3 mil gaps. (Cirexx says 3mil trace width and 3mil air gap)
     * Vias must be 4mil, just at the end of Cirexx, though we might be able to do most of the routing on the front two layers and via in the open rows in the middle of the FPGA.
 * VFE-like design

 * ALTERA?
Contacts:  Dan Gastler / Eric Hazen
