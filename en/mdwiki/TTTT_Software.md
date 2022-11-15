# TTTT_Software
This page describes some modest support software for the TTTT v1.  When TTTT v2 is finally released, it will likely have an Ethernet interface, making this software irrelevant.  Meanwhile, the interface is serial and therefore tied to a specific computer in the lab.  The tools documented here allow for remote access.

This software may be obtained from svn here:  http://edf.bu.edu/svn/edf/TTTT/software/SimpleServer/

## tttt_server

This is a fairly trivial TCP server which allows remote clients to connect from another computer to control the board.

Usage:
```
   $ ./tttt_server [port_name]
```
where `port_name` is the serial port (default `/dev/ttyUSB0`) where the TTTT is connected.
If you don't know, try `ls /dev/ttyUSB*`).

Then from another computer you can use `tttt_remote`.

## tttt_remote

When the server is running, you can (on another computer) connect and send commands
using `tttt_remote`.

Usage:
```
   $ ./tttt_remote <host_name> -x script        # run a script of commands
   $ ./tttt_remote <host_name> -i               # enter interactive mode
   $ ./tttt_remote <host_name> -e "command"     # run 1 command
```

See [TTTT Users Manual](TTTT_Users_Manual.md) for details on commands.

