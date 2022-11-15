# Visual_Basic_Stepping_Motor_Notes
Notes on controlling stepping motor with simple
Visual Basic program ([Project1.zip](http://joule.bu.edu/~hazen/SteppingMotors/Project1.zip)

First, *'Visual Basic Express 2005* was used for this test.
Follow the "for developers" link on the Microsoft web site
to install it.

Second, the port driver *'inpout32.dll* from the web site http://logix4u.net/
must be installed (just find the DLL file and copy it to the c:\WINDOWS\system32
directory, at least under Windows XP)

Finally, the zip file referenced above must be unzipped on a local drive
(not a network share, unless you can fix the .NET framework security
problems which result).

Run the program, and you should get a dialog box
[like this](http://joule.bu.edu/~hazen/stepping_motors/visual_basic_form.gif)

Set the LPT port address (usually either the default 3bc or 378 (use the
windows device manager if necessary to find out).
Enter ''1' in the "speed (delay)" box.  Enter a number of steps in the "Steps"
box and press "GO".  For example, 200 steps is one revolution.
Enter a negative value for the opposite direction.

