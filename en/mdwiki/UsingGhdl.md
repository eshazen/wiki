# UsingGhdl
[GHDL](http://ghdl.free.fr/) is an open-source VHDL simulator.  It works well and runs fast.  The main problem with using it for development of firmware for specific FPGAs is the fact that vendor-specific IP cores can't easily be used.  However, with care to use "inferred" IP whenever possible, much can be done with GHDL.

Simulator output can be written as text using `std_logic_textio` or other VHDL facilities, but also waveform data may be written in a [VCD](https://en.wikipedia.org/wiki/Value_change_dump) file and viewed by (for example) [gtkwave](http://gtkwave.sourceforge.net/).

Some notes to get started.  On Ubuntu (20.04, at least):

```
  $ sudo apt install ghdl
  $ sudo apt install gtkwave
```

To compile and run a simulation:

```
  $ ghdl -a --ieee=synopsys tdc.vhd
  $ ghdl -a --ieee=synopsys tdc_tb.vhd
  $ ghdl -e --ieee=synopsys tdc_tb
  $ ghdl -r --ieee=synopsys tdc_tb --stop-time=1000ns --vcd=test.vcd
  $ gtkwave test.vcd
```

See http://ohm.bu.edu/~hazen/ghdl_gtkwave/vhdl_example for a simple-minded but working example of a TDC with a VHDL testbench.  There's a makefile, which runs the above commands.

GTKwave is fairly intuitive, however I haven't found a way to automate the process of displaying all top-level waveforms.  You have to select the top-level entity, select all the signals, click "Append" then zoom full.  See below.


| <a href="http://ohm.bu.edu/~hazen/ghdl_gtkwave/slide1.jpg"><img src="http://ohm.bu.edu/~hazen/ghdl_gtkwave/slide1_sm.jpg"></a> | <a href="http://ohm.bu.edu/~hazen/ghdl_gtkwave/slide2.jpg"><img src="http://ohm.bu.edu/~hazen/ghdl_gtkwave/slide2_sm.jpg"></a> | <a href="http://ohm.bu.edu/~hazen/ghdl_gtkwave/slide3.jpg"><img src="http://ohm.bu.edu/~hazen/ghdl_gtkwave/slide3_sm.jpg"></a> |
| -- ------------------------------------------------------------ -------------------------------------------------------------- | -- ------------------------------------------------------------ -------------------------------------------------------------- | -- ------------------------------------------------------------ -------------------------------------------------------------- |
| Select the top entity | Select one signal, Ctrl-A, click Append | Click the "zoom all" button |



See also some helpful notes from René Doß:

You can found the article on my homepage:
[GHDL_uart_sim.pdf](http://www.dossmatik.de/ghdl/GHDL_uart_sim.pdf)

And the example files:
[UART.zip](http://www.dossmatik.de/ghdl/UART.zip)
