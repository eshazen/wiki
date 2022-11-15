# Z80Project
This is a project to develop a simple embedded Z80 system for use in FPGAs.

 * [Opencores T80](http://opencores.org/project,t80) - rather robust, simple Z80 core
 * [zasm](http://k1.spdns.de/Develop/Projects/zasm/) - Z80 toolchain, seems to be in active maintenance/development
  (sdcc port included)

## sdcc notes

 * Be sure to use const where appropriate for initializers, else the code can be bad.
 * Using ubuntu sdcc package (version 3.4.0).  Built from source (?) on watt.bu.edu.

Compile using `sdcc -mz80 source.c`

Convert to VHDL ROM with `ihex_to_vhdl.pl` script in ~/tools on watt.
