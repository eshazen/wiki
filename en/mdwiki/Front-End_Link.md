# Front-End_Link
Navigate to: [Linear_Collider](Linear_Collider.md)

### Link Test Gadget
We propose to build a gadget consisting of a Xilinx Spartan-3E evaluation
board with a small adapter connected to simulate one or both ends
of the front-end link.  Here are some notes on this gadget:
 * Adapter: [Schematic](http://joule.bu.edu/~hazen/LinearCollider/felt_sch.pdf)
  [PCB layout](http://joule.bu.edu/~hazen/LinearCollider/felt_pcb.pdf)
 * Xilinx [Spartan-3E Eval Board](http://tinyurl.com/zr4zw)
  [User Guide](http://www.xilinx.com/bvdocs/userguides/ug230.pdf)
 * [FPGA_Design_Notes](FPGA_Design_Notes.md)

### Digital Isolators

The front-end link as specified requires one signal in each direction (Tx/Rx)
plus an additional asynchronous Tx signal for test pulse timing.
So, an isolator with 1/2 channels is required.

Isolators Options:

 * [ADuM340x](http://www.analog.com/UploadedFiles/Data_Sheets/16743415ADuM3400_1_2_0.pdf)
 * [Si843x](http://www.silabs.com/public/documents/tpub_doc/dsheet/Digital_Power/Isolators/en/Si843x.pdf)
 * [i171x](http://www.nve.com/isopdf/il71x.pdf)
 * [ISO721M](http://focus.ti.com/lit/ds/symlink/iso721m.pdf)

LVDS Tx/Rx:

 * [LVDS050](http://focus.ti.com/lit/ds/symlink/sn65lvds050.pdf)

[image:FELink](image:FELink.md)

