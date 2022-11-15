# JTAG_programming_rPi_Hat
This is a small Raspberry Pi "Hat" board which allows programming of various devices using the JTAG protocol.  For example, one could connect this to a board with a Xilinx FPGA, and then use the Xilinx Virtual Cable protocol to access the programming and debug interface remotely without requiring a special JTAG programming cable.

Essentially the board must route a few GPIO from the rPi to an appropriate JTAG connector.  The reason this isn't trivial is because it would be very convenient if the JTAG interface could automatically adjust to the logic levels of the target device (1.8V/2.5V/3.3V or even 5V).

Also, it would be potentially very useful to have a small display and a few buttons on the board.

See:

 * https://en.wikipedia.org/wiki/JTAG
 * Similar hardware project: https://github.com/Blinkinlabs/JTAG_hat
 * Sofrware: https://github.com/derekmulcahy/xvcpi
 * [Xilinx XVC](https://www.xilinx.com/products/intellectual-property/xvc.html#:~:text=Xilinx%20Virtual%20Cable%20(XVC)%20is,without%20using%20a%20physical%20cable.)
 * Xilinx [Platform Cable USB II data sheet](https://www.xilinx.com/content/dam/xilinx/support/documentation/data_sheets/ds593.pdf)
 * Xilinx [Legacy Programming Cable](https://www.xilinx.com/support/documentation/user_guides/xtp029.pdf) information including schematic
