# Picoblaze_boot_loader
Debugging !PicoBlaze systems can be tricky.  Xilinx provides a JTAG loader which has exactly one function:  overwrite the entire program code with new code and reset the !PicoBlaze.  Also, only an executable with no source code is provided.  This page describes an alternative whereby the !PicoBlaze is given read/write access to it's own program memory, thus allowing for a small boot loader to accept new hex code for all or part of the program memory.

In addition, "in memory" code editing and debugging is made possible.

Option I:

 * Two program memories
   * one ROM built using the usual tools containing a monitor/bootloader mapped to a small portion (512 words?) of the address space
   * second dual-port RAM with second port accessible through I/O registers mapped to remainder of the address space
 * Compile main program with offset 512 to start of dual-port RAM (does the assembler have an ORG statement?)

Other options:

 * Replace the entity `jtag_loader_6` in `ROM_form.vhd` with something else
 * Rework/replace the `ROM_form.vhd` with something much simpler with inferred dual-port memory.

