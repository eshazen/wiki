# Talking_to_LeCroy_Scopes
This page is intended to document an EDF effort to provide relatively general
C++ support for various instruments, including LeCroy (and possibly other brand)
oscilloscopes, Agilent AWGs and perhaps GPIB instruments such as signal generators
and VOMs via a GPIB-Ethernet interface.

## LeCroy Oscilloscopes

Allegedly one can communicate with LeCroy oscilloscopes over Ethernet.
This is "easy" if you use Windows and the DLL supplied by LeCroy, however
here we use mostly linux and prefer not to rely on black-box software.

I am working with a WaveRunner 64xi-A scope.

The scopes as it turns out support two different protocols, and you must select one
in the remote control configuration menu in the instrument.  One protocol is VICP
which is proprietary to LeCroy but rather simple.  The other is VXI, which is widely-used
but more complex.  I have had some success with the sample program supplied with the
Linux VXI-11 driver linked below.  This seems like a good approach.

 * [LeCroy Remote Control manual](http://www.lecroy.com/support/techlib/registerpdf.aspx?documentID=5209)
 * ["Understanding VICP..."](http://ohm.bu.edu/~hazen/DataSheets/LeCroy/lab_wm827.pdf)
 * [LeCroyVICP1.0.zip](http://ohm.bu.edu/~hazen/DataSheets/LeCroy/LeCroyVICP1.0.zip)
(see [Sourceforge link](http://lecroyvicp.sourceforge.net/)
 * [vxi11.tar.gz](http://ohm.bu.edu/~hazen/DataSheets/LeCroy/vxi11.tar.gz)
 * [LeCrunch!](https://bitbucket.org/tlatorre/lecrunch)

## Agilent AWG

The Agilent AWG we have is simpler, as it responds directly to SCIP (aka GPIB) commands
on a TCP server with no additional protocol.  Perhaps VXI is supported also, but I haven''t
looked in to this.

Here is a very simple program ([awg_comm.c](http://ohm.bu.edu/~hazen/Agilent/awg_comm.c)
opens a connection to the Agilent AWG and allows the user to enter commands.

 * [Agilent 18860A User Manual](http://ohm.bu.edu/~hazen/DataSheets/Agilent/81160-91020.pdf)

