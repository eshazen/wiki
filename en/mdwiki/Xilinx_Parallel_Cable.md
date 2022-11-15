# Xilinx_Parallel_Cable
Xilinx charges plenty for their programming cables, and the newer USB
ones come with their own software headaches.

## PCB Documentation

 * [PCB layout (color)](http://edf.bu.edu/~albyc27/xilinx_parallel/board_color.pdf)
 * [PCB silkscreen](http://edf.bu.edu/~albyc27/xilinx_parallel/board_mono.pdf)
 * [Parts list](http://edf.bu.edu/~albyc27/xilinx_parallel/parts_list.pdf)
 * [Schematic](http://edf.bu.edu/~albyc27/xilinx_parallel/xilinx_schematic.pdf)


I propose to make an ExpressPCB design for our own version of the cable
from the Xilinx published
[schematic](http://toolbox.xilinx.com/docsan/3_1i/data/common/jtg/dppb/appb.htm)
[local copy](http://joule.bu.edu/~hazen/jtag_test/xilinx_parallel_cable.gif)
The board should have a male DB-25 connector on one edge
to mate with a PC parallel port.  It should have three JTAG connectors:


pinout (see page 15 of [http://www.altera.com/literature/ug/ug_bbii.pdf
ByteBlaster datasheet]).


cable pinout ([datasheet](http://www.xilinx.com/bvdocs/publications/ds097.pdf)


  TMS, TDI, TDO, TCK, GND, VCC

Useful Links:

http://alternatezone.com/electronics/files/PCBDesignTutorialRevA.pdf


