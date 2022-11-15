# Xilinx_ISE
## Xilinx ISE 13.2 under Ubuntu 11.04

For simulation to work, you must bugger the libstdc++ files supplied by ISE
so the system ones are used instead:

```
 #/bin/tcsh
 #
 # library fix from
 # http://xlnx.lithium.com/t5/Installation-and-Licensing/ISE-13-1-on-kubuntu-11-04/td-p/151626
 #
 cd /opt/Xilinx/13.2/ISE_DS/ISE/lib/lin/
 mkdir orig && mv libstdc++* orig
 cd /opt/Xilinx/13.2/ISE_DS/ISE/lib/lin64/
 mkdir orig && mv libstdc++* orig
 cd /opt/Xilinx/13.2/ISE_DS/common/lib/lin/
 mkdir orig && mv libstdc++* orig
 cd /opt/Xilinx/13.2/ISE_DS/common/lib/lin64/
 mkdir orig && mv libstdc++* orig﻿

```

## Xilinx ISE almost works "out of the box" under Ubuntu 10.04.

You must change the default shell from "dash" to "bash" or
some scripts will fail.

<pre>
  sudo dpkg-reconfigure dash
</pre>

and answer "no" to the dialog.

