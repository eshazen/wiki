# Dan%27s_corner
# isim notes

## iSim 8b10b with tcl

## iSim UART with tcl

## Signals with external pull-ups
When you have an inout signal in a project that uses an external pull-up (i2c, one-wire), you need to do something special to get isim to play nice.

First, at your top level VHDL file, create a std_logic constant to drive the inout signal and set it to a value of 'H'.

Here 'H' will act like the weak external pull-up and bring the signal to a '1' if all other drivers are at 'Z'.


The other useful trick is to set all of your entities that use this signal to have a default value of 'Z' in their entity statement.

If you don't do this, then the simulation will leave the signal as 'U' until it knows what everyone's state is.

Ex:<img src="iSim_top_vhdl_Z_example.png">
