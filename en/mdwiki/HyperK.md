# HyperK

Redmine project: [http://gauss.bu.edu/redmine/projects/hyper-k-tdc]

## Reference

 * [NIM Article](https://arxiv.org/pdf/0911.0986v1.pdf) on the QTC chip
 * [KLOE-2 TDC](https://forums.xilinx.com/xlnx/attachments/xlnx/Spartan/25924/1/low%20resource%20fpga%20based%20tdc.pdf) paper -- interesting four-phase low resource FPGA with 625ps resolution in Virtex-5
 * QBEE board [photo](http://ohm.bu.edu/~hazen/HyperK/QBEE/QBEE_board.jpg)

## Design Thoughts

 * [TKO spec](http://ohm.bu.edu/~hazen/SuperK/Ethernet/TKO_spec.pdf) (page 4) says max component height is 0.39" (9.9mm).  [FMC spec](http://joule.bu.edu/~hazen/edf_joule/vita/ANSI-VITA-57-1-Rev2010.pdf) (page 23) says minimum stacking height is 8.5mm.  This does not accommodate a 1.6mm standard thickness PCB.
 * Samtec [LSEM series](https://www.samtec.com/products/lsem) and similar connectors with stack heights down to 6mm exist.
