# StackMachineISA
Some thoughts on stack machine design:

 * 16-bit ALU (4x'181)
 * 4x registers (4x'670) used as: PC, DSP, RSP, X

Instruction fetch:

 * Select PC in register file
 * Latch IR

If not branch:

*
