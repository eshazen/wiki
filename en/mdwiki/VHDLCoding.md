# VHDLCoding

### ghdl on ubuntu

 * See BuildingGhdlUbuntu
 * See UsingGhdl

### std_logic_unsigned etc vs numeric_std

Use *numeric_std*.  It's an IEEE standard.  It is pretty horrible.  Example:

```
  a   : in  std_logic_vector(wid-1 downto 0);
  b   : in  std_logic_vector(wid-1 downto 0);
    ...
  signal sum : std_logic_vector( wid downto 0);

  sum <= std_logic_vector( unsigned(a) + unsigned(b));
```

### Testbench Notes

Problem:  how to handle a repeating clock and other synchronous signals, mixed with reading test vectors and asserting them.  First, some suggestions on how to handle clocks.  Even calculating the period is a pain in VHDL due to the weird behavior of the 'time' type.  Clock and reset can be done without a process, so:

```
architecture ....
  constant freq        : positive := 320e6;
  constant clk_per     : time     := (real(1e9)/real(freq)) * 1 ns;
  constant half_period : time     := clk_per/2;

  signal clk : std_logic := '0';  -- init needed if clock done as below
begin
  clk <= not clk after half_period;
  rst_n <= '0', '1' after clk_per * 8;
```

Next question:  test vectors from file.  One approach is to have a scheduled launch time in the vector file, in clock ticks or BcN/OrN or some other scheme.  How to handle this?

Internet references:

 * https://electronics.stackexchange.com/questions/148320/proper-clock-generation-for-vhdl-testbenches
 * http://www.tkt.cs.tut.fi/kurssit/50200/S15/Kalvot/Lecture%208%20-%20VHDL%20Test%20Benches.pdf
 * https://github.com/eliben/luz-cpu/blob/master/experimental/luz_uc/luz_uc_testbench/vhdl_utils/txt_util.vhd
