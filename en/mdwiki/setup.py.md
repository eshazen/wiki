# setup.py
## Setup.py\\\\
### Imports\\\\
{{{ #!div style="font-size: 90%"
{{{ #!python
import uhal
from I2CuHal import I2CCore
import time
from si5344 import si5344
}}}
}}}
`uhal` for communication with the board.\\
`I2CuHal` for communications through I^2^C.\\
`si5344` for configuring the Si5344 Clock.
----
{{{ #!div style="font-size: 90%"
{{{ #!python
uhal.setLogLevelTo(uhal.LogLevel.NOTICE)
manager = uhal.ConnectionManager("file://connections.xml")
hw_list = [manager.getDevice("DUNE_FMC_TX"), manager.getDevice("DUNE_FMC_RX")]
pll_cfg_list = ["SI5344/PDTS0003.txt", "SI5344/PDTS0000.txt"]
}}}
}}}
Starts logging messages of level NOTICE and above.\\
Creates a `ConnectionManager` from the connections file.\\
>Contains `DUNE_FMC_RX` and `DUNE_FMC_TX`, their respective IPs, and the top.xml files that describe them.\\
Gets each individual device in the connections file.\\
Gets registers for Si5344.\\\\
Unless otherwise denoted, the following code is done for each entry in the connections file.
----
{{{ #!div style="font-size: 90%"
{{{ #!python
reg = hw.getNode("io.csr.stat").read()
hw.getNode("io.csr.ctrl.soft_rst").write(1)
hw.dispatch()

time.sleep(1)
}}}
}}}
Retrieves node `io.csr.stat` and stores it as `reg`.
{{{ #!div style="font-size: 75%"
{{{ #!xml
<node id="io" description="FMC IO" fwinfo="endpoint">
		<node id="csr" address="0x0" description="ctrl/stat register" fwinfo="endpoint;width=1">
				<node id="stat" address="0x1">
					<node id="sfp_los" mask="0x1"/>
					<node id="sfp_flt" mask="0x2"/>
					<node id="cdr_los" mask="0x4"/>
					<node id="cdr_lol" mask="0x8"/>
}}}
}}}
Writes 1 to node `io.csr.ctrl.soft_rst`.
{{{ #!div style="font-size: 75%"
{{{ #!xml
<node id="io" description="FMC IO" fwinfo="endpoint">
		<node id="csr" address="0x0" description="ctrl/stat register" fwinfo="endpoint;width=1">
				<node id="ctrl" address="0x0">
					<node id="soft_rst" mask="0x1"/>
}}}
}}}
`dispatch` is used to send the transaction.\\
Waits one second.
----
{{{ #!div style="font-size: 90%"
{{{ #!python
hw.getNode("io.csr.ctrl.pll_rst").write(1)
hw.dispatch()
hw.getNode("io.csr.ctrl.pll_rst").write(0)
hw.dispatch()
}}}
}}}
Sets pll_rst high then low.
{{{ #!div style="font-size: 75%"
{{{ #!xml
<node id="io" description="FMC IO" fwinfo="endpoint">
		<node id="csr" address="0x0" description="ctrl/stat register" fwinfo="endpoint;width=1">
				<node id="ctrl" address="0x0">
					<node id="pll_rst" mask="0x10"/>
}}}
}}}
----
{{{ #!div style="font-size: 90%"
{{{ #!python
uid_I2C = I2CCore(hw, 10, 5, "io.uid_i2c", None)
}}}
}}}
Creates a new `I2CCore`.\\
>`hw` is the target node.\\
>`10` is the value of the wishbone clock (unused).\\
>`5` is the value of the i2c clock (unused).\\
>`io.uid_i2c` is the prefix for all the nodes read by `I2CCore`.\\
>`None` is the delay before checking `ack` (?).
Retrieves the `ps_lo`, `ps_hi`, `ctrl`, `data`, and `cmd_stat` nodes.
----
{{{ #!div style="font-size: 90%"
{{{ #!python
uid_I2C.write(0x21, [0x01, 0x7f], True)
uid_I2C.write(0x21, [0x01], False)
res = uid_I2C.read(0x21, 1)
uid_I2C.write(0x53, [0xfa], False)
res = uid_I2C.read(0x53, 6)
}}}
}}}
`write` takes three parameters: `addr`, `data`, and `stop`.\\
`addr` is bitwise & to 0x7f, then shifted << 1.\\
`addr` is written to node `data`.\\\\
