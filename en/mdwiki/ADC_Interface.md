# ADC_Interface
The AD9928 provides 160MHz DDR data.  A very similar implementation was done for the "Time Reversal Mirror" project
using a Spartan-3E chip (XC3S500E-4PQG2308)
([firmware](http://ohm.bu.edu/~cdubois/Waveform%20Mirror/vhdl.tar.gz)
[Wiki page](http://ohm.bu.edu/cgi-bin/edf/Time_Reversal_Mirror)

Here ([des8.zip](http://ohm.bu.edu/~hazen/Frangioni_Public/FPGA_Board/Firmware/Samples/des8.zip)
implementation of an 8-bit deserializer, along with two scripts (init.tcl, f5a.tcl) which simulate it.

Here ([deser.zip](http://joule.bu.edu/~hazen/Frangioni_Public/FPGA_Board/Firmware/Samples/deser.zip)
sample.  (see README.txt file in the zip archive).

Refer to [UG381](http://www.xilinx.com/support/documentation/user_guides/ug381.pdf)
and [Spartan-6 Libraries](http://www.xilinx.com/support/documentation/sw_manuals/xilinx11/spartan6_hdl.pdf)
and [AD9928 Data Sheet](http://ohm.bu.edu/~hazen/Frangioni/Camera/AD9928_SpB.pdf)

Essentially, at the top level we instantiate IBUFDS for the data, IBUFGDS for the DDR clock:

```
        -- (inside a generate loop)
        --
        lvds_serial: IBUFDS generic map(
		CAPACITANCE => "LOW",
                DIFF_TERM => FALSE,
                IBUF_DELAY_VALUE => "0",
		IFD_DELAY_VALUE => "0",
		IOSTANDARD => "LVDS_25") port map (
		O => serial,
		I => SERIAL_P,
	        IB => SERIAL_N);

```
```
	lvds_clk: IBUFGDS generic map(
                IOSTANDARD => "LVDS_25") port map (
                O => clk,
                I => CLK_P,
                IB => CLK_N);

```
Then we instantiate an IDDR2 for each serial data input.  Note that ''phased' is the phase-adjusted
clock from the DDR, and ''reversed' is the clock shifted 180 degrees (CLK180 output of DCM).

```
        doubler : IDDR2 port map(
                D  => DATA,
                Q0 => nexte,
                Q1 => nexto,
                C0 => phased,
        	C1 => reversed,
                CE => ''1',
		R  => ''0',
                S  => ''0');

```
In the time mirror project a DCM was used to clean the clock.
This may not be necessary.  In any case, the deserializer itself
is just simple VHDL.  Here CLOCK is the frame clock from the ADC.
We probably need to generate this ourself.

```
        tick: process(phased)
        begin
                if phased''event and phased = '1' then
                        even <= nexte;
                        odd <= nexto;
                        odd_group <= odd_group(5 downto 0) & odd;
                        even_group <= even_group(5 downto 0) & even;
                end if;
        end process;

```
```
        tock: process(CLOCK)
        begin
                if CLOCK''event and CLOCK = '0' then
                        --current implementation assumes that msb is sent first across serial port
                        SAMPLE <= even_group(6)& odd_group(6)& even_group(5)& odd_group(5)&
                                even_group(4)& odd_group(4)& even_group(3)& odd_group(3)&
                                even_group(2)& odd_group(2)& even_group(1)& odd_group(1);
                end if;
        end process;

```
