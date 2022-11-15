# OEthernetMac
## What is OEthernetMac?

A simple ethernet mac that was designed to mate with IPBus.
Timing diagrams are on their way, but it attempts to look
like the output of the Xilinx TEMACS (Tri-Mode Ethernet MAC).

NOTE: This MAC really only supports Full Duplex transmission
      and has only been tested at 100Mbs. Moving it to a
      higher speed just means that clock generation needs to
      be taken care of. Lower speeds should work if they are
      running at Full Duplex.

All Xilinx projects are from ISE 13.3

## Directory Structure

 * archive/ : Holds important and key archives of different
  	     subsections of the project. Archived files are
	     named as such: name_of_folder_YEARMONTHDAY.tar.bz2

 * oethmac_base_ipbus/ : Contains the src directory including vhdl files, ucf
  		      	files (example for nexys3), and ipcores.
			The version of IPBus I tested on is included.

 * oethmac_ipbus_demo_nexys3/ : Contains a sample application of the OEthMac
  			       for a Nexys3 Development board. Arguably could
			       be made to work on other boards.


## Source

Sources can be found [here](http://edf.bu.edu/~cwoodall/OEthernetMac/)

Stable Versions:
 * [OEthernetMac Source w/ IPBus version I used](http://edf.bu.edu/~cwoodall/OEthernetMac/archive/oethmac_base_ipbus_20121119.tar.bz2)
 * [OEthernetMac Example Project (w/ IPBus) for Nexys3 Spartan 6 Development Board](http://edf.bu.edu/~cwoodall/OEthernetMac/archive/oethmac_ipbus_demo_nexys3_20121119.tar.bz2)

