# EricsVivadoNotes
## Documentation

 * https://www.xilinx.com/products/design-tools/vivado.html#documentation
   * Esp UG901: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug901-vivado-synthesis.pdf

## Table of Contents

 * [#general My opinions on source code management]
 * [#build Building in Non-Project Mode]
 * [#build-ip Basic IP in Non-Project Mode]
 * [#simu Quick command-line simulation]

## Getting started:  Source code management == #general

Vivado has "project mode" and "non-project mode".  The project mode is typically used with the GUI and settings are kept in a project file.  This is essentially the only mode described in Xilinx documentation and tutorials.  Generally I prefer "non-project" mode, which is command-line or `Makefile` driven.

In either mode, I suggest to never run the tools in the directory containing the source tree, as Vivado clutters up the build directory with lots of temporary files.

Creating a project for project mode:

```
  $ source /opt/Xilinx/Vivado/2020.2/settings64.sh   # (change path as needed)
  $ vivado   # (opens the GUI)
```

 * Select "Create Project"
 * Select "Next".
 * Fill in a project name and directory (leave the "Create project subdirectory" checked).  Select "Next"
 * Leave defaults: (RTL project, nothing else checked), Select "Next"
 * Leave defaults: Language "VHDL", simulator "mixed", select "Next"
 * No constraints:  Select "Next"
 * Choose a part.  "xc7a35tcpg236-1" for the Basys3 for example.  Select "Next"
 * View summary, Select "Finish"

At this point I recommend to exit Vivado.

You'll see that Vivado has created a bunch of directories and files.  I suggest to navigate to the top-level design directory (where the `.xpr` file sits and immediately create a directory called `src` to keep your source code and constraint files in.

*Get or create a constraints file* -- for Digilent boards you can get a master XDC file [here](https://github.com/Digilent/digilent-xdc/) (Github link).  Edit it to uncomment the ports you are using. Recommend to save as `top.xdc` in your `src` folder.

*Get or create a top-level VHDL source file* -- Recommend to save as `top.vhd` in your `src` folder.

*Attach files to project*

 * Start vivado
 * Click "+" on "Sources" window or Alt-A, Select "Next"
 * Select "Add files", navigate to your file, select "Next"
 * Select "Finish"
 * Alt-A again, add your constraint file

Click the green "play" triangle and select "launch implementation" for a full build.  This starts a build in the background, which will take several minutes for even a trivial example.  You will observe that Vivado has now created a total of about 110 files and folders in your project directory, but the `src` folder should still have only your source and constraints files.

I recommend to store only the source (`xpr`) file, VHDL (`.vhd`) files and the project (`.xpr`) file in a repository at the start.

## Quick simulation from command line == #simu

Create [init.tcl](http://ohm.bu.edu/~hazen/Vivado/init.tcl) and [pulser.vhd](http://ohm.bu.edu/~hazen/Vivado/pulser.vhd)

```
  xvhdl pulser.vhd
  xelab -debug typical pulser -s pulser_sim
  xsim --gui pulser_sim -t init.tcl
```

Omit the `--gui` and end the tcl script with `quit` to run in batch mode.
Here is a simple example, to test a 4x4 multiplier with inputs (a,b) and output p:

```
puts "Starting multiplier test"
set errz 0
for {set i 0} {$i < 16} {incr i} {
    for {set j 0} {$j < 16} {incr j} {
	add_force a -radix dec $i
	add_force b -radix dec $j
	run 10
	set calc_p [expr {$i * $j}]
	set sim_p [get_value -radix unsigned p]
	if {$calc_p != $sim_p} {
	    puts "ERROR: Calculated: $calc_p simulated: $sim_p"
	    incr errz
	}
    }
}
puts "$errz total errors"
quit
```

## Building in Non-project Mode == #build

Below is the simplest possible (?) build script for a Vivado project.
Here is a fancier one from [this blog](https://hwjedi.wordpress.com/2017/01/29/vivado-non-project-mode-part-ii-building-off-a-solid-foundation/) [fancy_build.tcl](http://ohm.bu.edu/~hazen/Vivado/fancy_build.tcl).

```
# create_project -force proj1 ./proj1
# read_vhdl proj1/src/top.vhd
# read_xdc proj1/src/pins.xdc
synth_design -top top -part xc7a12t-cpg238-1
opt_design
place_design
route_design
write_bitstream -force proj1/proj1.bit
```

Here is a sample (working) constraints file with the minimum stuff in it:
```
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]

set_property -dict { PACKAGE_PIN k17 IOSTANDARD LVCMOS25 } [get_ports clk]
set_property -dict { PACKAGE_PIN n19 IOSTANDARD LVCMOS25 } [get_ports rst]
set_property -dict { PACKAGE_PIN n17 IOSTANDARD LVCMOS25 } [get_ports a]
set_property -dict { PACKAGE_PIN p18 IOSTANDARD LVCMOS25 } [get_ports b]
set_property -dict { PACKAGE_PIN r19 IOSTANDARD LVCMOS25 } [get_ports y]
```

For completeness here is a minimal VHDL file which works with the above
```
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity top is

  port (
    clk  : in  std_logic;
    rst  : in  std_logic;
    a, b : in  std_logic;
    y    : out std_logic);

end entity top;

architecture arch of top is

begin  -- architecture arch

  process (clk, rst) is
  begin  -- process
    if rst = '0' then                   -- asynchronous reset (active low)
      y <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge
      y <= a and b;
    end if;
  end process;

end architecture arch;
```

## Building With IP in Non-Project Mode == #build-ip

Got this from an AR, not tested/confirmed:

```
create_project -in_memory -part xc7vx415tffg1158-2
read_ip ./local_pcs_pma/local_pcs_pma.xci
set_property target_language VHDL [current_project]
generate_target all [get_files ./local_pcs_pma/local_pcs_pma.xci]
```

