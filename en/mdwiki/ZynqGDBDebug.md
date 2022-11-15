# ZynqGDBDebug
### info
Petalinux doesn't seem to come with useful tools like pstack or a full gdb, but it does include the gdbserver for remote debugging

This of course requires one to include debugging symbols in the executable.

### Petalinux side
On the zynq, get the program's PID and do the following:

```
# gdbserver --attach <remote IP>:<port number> <pid>
```

### Desktop linux side
Once the zynq has the gdbserver running, you run gdb on the host listed in the "gdbserver" command.

```
> source "/opt/Xilinx/SDK/"2015.4"/settings64.sh" && arm-xilinx-linux-gnueabi-gdb <path to local copy of zynq executable to debug>
```

Here the "source" command sets the environment needed to get the correct version of gdb.
The executable file given has been compiled with the petalinux/Xilinx SDK compilers and is the same file running on the zynq.

Once you are in gdb, type the following to connect to the remote gdbserver
```
(gdb) target remote <zynq IP><port number>
```

At this point you can run your gdb commands like "bt" to get the stack trace.
