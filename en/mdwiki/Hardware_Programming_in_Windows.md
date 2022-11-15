# Hardware_Programming_in_Windows
Low-level programming (i.e. controlling parallel and
serial ports) can be tricky in Windows (expecially
for someone used to doing it under Linux).
Fortunately the
[cygwin](http://www.cygwin.com/)
this easy to do in a unix-similar way.

### Serial Port Programming

Cygwin is
[POSIX](http://en.wikipedia.org/wiki/POSIX)
-compatible enough that programs which
access the serial port in a POSIX way
will work without modification.

Here is an example:
[sio_example.zip](http://joule.bu.edu/~hazen/edf_tech/sio_example.zip)
library developed for a specific project, but it should give you
an idea of what is needed for basic port operations.

### Parallel Port Programming

*'Cygwin and PortTalk DLL*

Use Cygwin and the
[http://www.beyondlogic.org/porttalk/porttalk.htm
porttalk driver]
from
[beyondlogic.org](http://www.beyondlogic.org/)

I have tested version 2.2 of the porttalk driver on my Thinkpad T43 running WinXP
and it works.

*'inpout32.dll from Logix4u*

Another option is the inpout32.dll library from [logix4u.net](http://logix4u.net/)
This comes with a VB example which works out of the box with Visual Basic Express 2005
(free).  *'NOTE:* the project must be located on a local hard drive, not a network
share, or you will get a security exception from the .NET framework.

