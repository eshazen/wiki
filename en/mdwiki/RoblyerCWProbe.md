# RoblyerCWProbe
# CW DOSI Probe for Cancer Monitoring

The proposed probe contains six pairs of LEDs, one photo-detector assembly and drive electronics.
Each of the 12 LEDs may be selected individually, with external drive current controlling the output intensity.

The LED pairs are arranged in a circle with a 25.4mm radius, with the photodiode assembly in the center.

A single flexible, multi-conductor cable provides power and control.  The HDMI cable seems like
a reasonable off-the-shelf solution (with mini-HDMI type C connector on the probe)

# Updated Version (2019)

This is documentation for the V3 probe design by Fraunhaufer.  EDF is assisting in
a new manufacturing run starting March 2019.

 * SVN: http://gauss.bu.edu/svn/botlab.dosi/FlexiProbe/
 * Schematic: http://gauss.bu.edu/svn/botlab.dosi/FlexiProbe/CWProbeV3_V1.1/CWProbeV3_V1.1_sch.pdf
 * Stackup Document: file:///home/hazen/work/botlab.dosi/FlexiProbe/CWProbe3_V1.1_stackup_document.pdf
 * Current gerbers V3_1.1: http://gauss.bu.edu/svn/botlab.dosi/FlexiProbe/EDF_Fab_V3_V1.1/CWProbeV3_1.1_gerbers.zip (from [here](http://gauss.bu.edu/svn/botlab.dosi/FlexiProbe/February%202019%20Probe%20Order%20Files/February%202019%20Probe%20Order%20Files/PCBA_Manufacturing_Package_CWProbeV3_2018/Gerber%20Files_CWProbeV3_2018/))
 * KiCAD files V3_1.1: http://gauss.bu.edu/svn/botlab.dosi/FlexiProbe/CWProbeV3_V1.1/
 (but gerbers there are V1 which are out of date)

NOTE:  The LEDs vary in whether they have an Anode polarization mark or Cathode polarization mark.
Due care must be taken when preparing assembly documentation !!

The layout V3_1.1 expects one of each, so the two packages are reversed on the silkscreen.

V3_1.1 layout:

 * 850nm expect Cathode mark
 * 750nm expect Anode mark

# Obsolete Versions

## Initial (Rigid PCB) Design
 * Schematic: [PDF](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/cw_pcb_low_profile_sch.pdf) [ExpressPCB](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/cw_pcb_low_profile.sch)
 * Layout: [ExpressPCB](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/cw_pcb_low_profile.pcb)
 * Parts list: [proto1_BOM.xlsx](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/proto1_BOM.xlsx)

## Revised (Flex PCB) Design

 * Second Layout
   * KiCAD (FINAL): [CWProbe2_Final.zip](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/FlexV2/CWProbe2_Final.zip) (gerber files included, updated 2015-01-14 to correct MOSFET part number)
   * Schematic: [PDF](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/FlexV2/Probe2.pdf)
   * Parts List (FINAL): [XLS](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/FlexV2/Probe2.xls) (updated 2015-01-14 to correct Q1..Q6 part number)
   * [SVN repository](http://edf.bu.edu/svn/edf/Roblyer/CWProbe2/) (link for EDF staff)
 * Preliminary Layout
   * KiCAD (PREVIEW): [CWProbe.zip](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/CWProbe.zip)
   * Gerbers (PREVIEW): [CWprobeV1.zip](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/CWprobeV1.zip)
   * Schematic: [schematic.pdf](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/FlexV1/schematic.pdf) -- Preview draft 2014-10-15
   * Layout: [TOP](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/FlexV1/top.png) [BOTTOM](http://ohm.bu.edu/~hazen/Roblyer/DC_Probe/FlexV1/bottom.png) -- Preview draft 2014-10-15
 * Suggested parts:
   * Photodiode: [S4797](http://www.hamamatsu.com/resources/pdf/ssd/s5627-01_etc_kspd1025e06.pdf) (Hamamatsu, low profile SMT)
   * LED 850nm: [smt850-23.pdf](http://www.roithner-laser.com/datasheets/led_div/smd/smt850-23.pdf) (low profile SMT)
   * LED 750nm: [smt750-23.pdf](http://www.roithner-laser.com/datasheets/led_div/smd/smt750-23.pdf) (low profile SMT)
   * [74HC4514](http://www.nxp.com/documents/data_sheet/74HC_HCT4514_CNV.pdf) decoder in [TSSOP24](http://www.nxp.com/documents/outline_drawing/sot355-1_po.pdf) package (original)
   * [74HCT154](http://www.nxp.com/documents/data_sheet/74HC_HCT154.pdf) (Digi-Key 568-8858-1-ND) in VQFN 3.5mm x 5.5mm package (Alternative, see Note 1)
   * [DMN2004DMK-7](http://www.diodes.com/datasheets/ds30937.pdf) dual N-channel MOSFET (Digi-Key DMN2004DMKDICT-ND)
   * [DMP2004VK-7](http://www.diodes.com/datasheets/ds30916.pdf) dual P-channel MOSFET
   * uHDMI connector -- WM1280CT-ND

Notes:

1.  The 74HCT154 is attractive because of the very small package, but has active-low logic outputs.  This requires a small change in the schematic.  The control interface should be unchanged.  Alternatively, the 4514 decoder is available in a TSSOP24 package which is about 7mm x 8mm


## Interface Cable

### Pinout for micro HDMI

NOTE NOTE NOTE:  uHDMI and standard HDIMI pinouts are different!


| *Pin* | *uHDMI Pin* | *HDMI Pin* | *DOSI Use* | *Notes* |
| ----- | ------ ---- | ----- ---- | ----- ---- | ------- |
| 1 | - | Hot Plug Detect/HEAC- | | |
| 2 | - | Utility/HEAC+ |  | |
| 3 | 1 | TMDS Data2+ | Photodiode+ | Photodiode Anode |
| 4 | 2 | TMDS Data2 Shield | Photodiode GND | Shield for Photodiode signal |
| 5 | 3 | TMDS Data2- | Photodiode- | Photodiode Cathode |
| 6 | 4 | TMDS Data1+ | LED Power | Power for LEDs |
| 7 | 5 | TMDS Data1 Shield | AGND | Shield for LED power |
| 8 | 6 | TMDS Data1- | AGND | Ground for LEDs |
| 9 | 7 | TMDS Data0+ | A1 | Address 1 |
| 10 | 8 | TMDS Data0 Shield | DGND | Logic GND |
| 11 | 9 | TMDS Data0- | DGND | Logic GND |
| 12 | 10 | TMDS Clock+ | LE | Latch enable |
| 13 | 11 | TMDS Clock Shield | DGND | Logic GND |
| 14 | 12 | TMDS Clock- | DGND | Logic GND |
| 15 | 13 | CEC | A0 | Address 0 |
| 16 | 17 | DDC/CEC/HEAC Ground | DGND | Logic GND |
| 17 | 15 | SCL/DDC clock | A2 | Address 2 |
| 18 | 16 | SDA/DDC data | A3 | Address 3 |
| 19 | 18 | +5V power | VCC | Logic power (3.3V-5V) |

