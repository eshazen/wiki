# 2014-01-23_Mezz_Tester_Meeting
Mezz Tester organizational meeting on 2014-01-23

Materials:

 * [Slides](http://ohm.bu.edu/~hazen/ATLAS/NewMezzTester/TesterIntro.pdf) by Hazen

Notes:

Most of the discussion was around the computer interface.  USB is appealing,
but requires a device driver in the OS, which may or may not be present in the
future.  USB/serial is likely to continue to be supported, but perhaps not
other USB pseudo-devices.

For Ethernet, the "obvious" choice is IPBus as used in CMS.  However, the
software package has become unwieldy and already can only install on
scientific linux.

My proposal is that we research other UDP-based Ethernet options.
