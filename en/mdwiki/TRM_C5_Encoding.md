# TRM_C5_Encoding
Up to [TrackerReadoutModule](TrackerReadoutModule.md)

This page discusses the command/control output to the TDC.
It follows closely the [IEEE paper](http://www-ppd.fnal.gov/eedoffice-w/projects/ckm/comadc/C5_IEEE.doc)
by J.Y.Wu on the C5 interface.

Here is a proposed VHLD entity for a C5 encoder, which encodes 4 data bits and
a control/data select line into 5 bits of C5 code.  This block would obviously
be used in conjunction with a higher-level protocol interface of some sort.

```
    entity c5_sender is
      port (
        clk40 : in  std_logic;
        rst_n : in  std_logic;
        d     : in  std_logic_vector(3 downto 0);
        cd    : in  std_logic;
        c5    : out std_logic;
        frame : out std_logic);
    end entity c5_sender;

```
This block expects to receive as input four data bits (d port) and one
bit cd which selects between sending a "control" and "data" code.
The output values are as shown in his "Table I".  The sequences in the
upper half of the table labeled D0 thru D15 would be output when cd is 0.
The sequences in the lower half of the table would be output when cd is 1.
The "Q0" code (all normal width pulses) should be output when cd is 1
and d is "0000".  There are many undefined control codes; when one of
them is input the output should be the same as Q0 (all normal width pulses).

The logic operates with a 20 clock cycle to produce 5 pulses on c5, each
of which is narrow, wide or normal (-1, 0, +1 in the paper).  Every 20 clocks
the frame signal should go high for one clock to indicate that the next
set of inputs on d and cd should be made available.

Following the suggested technique in the paper, each setup of cd, d inputs
specifies a look-up table which has 256 entries of 2 bits each.  The 256 entry
table is addressed using 8 address bits, five of which are specified by (cd, d)
and the other 3 by bits 4..2 of the modulo 20 counter.

Please refer to the
[XST User Guide](http://www.xilinx.com/support/documentation/sw_manuals/xilinx14_4/xst_v6s6.pdf)
ROM modeling in VHDL is described starting on page 262.



