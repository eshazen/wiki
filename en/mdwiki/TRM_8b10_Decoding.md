# TRM_8b10_Decoding
Up to [TrackerReadoutModule](TrackerReadoutModule.md)

Data from the TDC is encoded using
[8b10b](http://en.wikipedia.org/wiki/8b/10b_encoding)

Need to double-check the following, but here are our current assumptions:
<pre>
Each 32-bit word is sent as four bytes, in network byte order. This would be:

```
  1.  bits 31:24
  2.  bits 23:16
  3.  bits 15:8
  4.  bits 7:0

```
Each byte is encoded 8b/10b using the "IBM" 8b10b encoding
http://en.wikipedia.org/wiki/8B10B#Encoding_tables
where the 8-bit code (ABCDEFGH) maps to bits (01234567)
and the 10-bit code (abcdei fghj) maps to bits (0123456789).
In the 10-bit code the bits are shifted out LSB-first so abcdeifghj come out
in that order with a being sent first.

What 8b10b code is sent while the link is idle?  It says "0''s" in your
document, but does that mean D.0.0?
</pre>

Decoding involves a 3-step process:

## Data recovery

This is the process of recovering a reliable stream of serial data from a data link for which
no separate clock is available.  See for example
[this paper](http://ohm.bu.edu/~hazen/Papers/blind_oversampling_CDR.pdf)

Below is a prototype VHDL entity for a data recovery block.  The <b>oversamp</b> parameter sets
the ratio of the <b>clk</b> rate to the bit rate.  The <b>d</b> input is the bit stream from
the TDC.  The <b>q</b> output is the recovered data stream, with <b>dav</b>=1 indicating
a valid bit.  Generally, <b>dav</b> will be high one clock every 5th for an oversampling
factor of 5.  The <b>err</b> output may indicate a failure to identify a valid bit stream.

```
  entity data_rec is
    generic (
      oversamp : integer := 5);           -- oversampling factor
    port (
      clk   : in  std_logic;              -- oversampling clock
      rst_n : in  std_logic;              -- active low async reset
      d     : in  std_logic;              -- bitstream
      q     : out std_logic;              -- data output
      dav   : out std_logic;              -- data valid
      err   : out std_logic);             -- error output
  end data_rec;

```
## Byte synchronization

Byte synchronization is the process of assembling the bit stream from the data recovery
block into 10-bit symbols.  The synchronizer watches for a specific unique pattern which
does not otherwise occur in the bit stream to acquire synchronization, then simply
shifts 10 bits at a time into a register and provides them as output to the decoder.

The TDC sends the 8b10b code K.28.1 ("0011111001" or "1100000110") at the start of each transmission.
This code contains the unique bit sequence "0011111" or "1100000" which does not otherwise occur in
the bit stream.

Below is a prototype VHDL entity for a synchronizer.


```
  entity synchro is
    port (
      clk     : in  std_logic;                      -- oversampling clock
      rst_n   : in  std_logic;                      -- active low async reset
      d       : in  std_logic;                      -- serial bits in
      dav_in  : in  std_logic;                      -- input data valid
      comma   : out std_logic;                      -- comma sequence detected
      in_sync : out std_logic;                      -- synchronized
      err     : out std_logic;                      -- error in bit stream
      dav_out : out std_logic;                      -- data valid out
      q       : out std_logic_vector(9 downto 0));  -- symbol out
  end synchro;

```

## 8b10b decoding

This is the process of converting the 10-bit symbols from the bit stream
back to 8-bit bytes.  A simple decoder may be downloaded
from [opencores](http://opencores.org/project,8b10b_encdec)
prototype VHDL entity for the decoder:

```
  entity dec_8b10b is
    port (
      clk    : in  std_logic;                     -- oversampling clock
      rst_n  : in  std_logic;                     -- asynchronous reset active low
      d_in   : in  std_logic_vector(9 downto 0);  -- data symbol in
      dav_in : in  std_logic;                     -- input data valid
      d_out  : out std_logic_vector(7 downto 0);  -- decoded data out
      k      : out std_logic);                    -- control character
  end dec_8b10b;

```

