# AtlasChipTesting
This page contains documentation on the revival of the ATLAS MDT-ASD chip tester in 2012.

### Test Outline



[ASD Chip Testing](https://docs.google.com/document/d/122CjPG_3SuGM0Uh1Fsdzv5hqLtp1iGvWpWUWG6Pnbtg/edit)






### HOWTO Print Labels

Download the program and library here:  [MDTASDChip_BarCodes_2012-03-28.tar.gz](http://ohm.bu.edu/~hazen/ATLAS/ChipTest2012/MDTASDChip_BarCodes_2012-03-28.tar.gz)        [libdmtx-0.7.4.tar.gz](http://ohm.bu.edu/~along528/libdmtx-0.7.4.tar.gz)

 * Build the dmtx library by entering the libdmtx package and running the standard: <tt> ./conifgure; make; sudo make install </tt>
 * Compile the MDTASDChip package by with: <tt>./compile.sh</tt> inside the package.  (This has only been tested to work with Mac OS X Lion.)
 * The list of serial numbers already used is located inside a spreadsheet called Labels.xls in the home directory of the bmc account on ohm.bu.edu.  The number is in the form *'cc-aaa-bbb* where cc is a checksum (ignore it) and aaabbb is the six-digit serial number. You should start from the next 6-digit Serial number on the list.  Make sure to update the list with the newly printed sheets.  This will require you to log in to the bmc@ohm.bu.edu account according to the information on the marked page in the testing station log book.
 * Create a post-script file for a sheet of labels with <tt>./run_barcodes aaabbb labels.ps</tt>.
 * The program returns the starting serial number for the next sheet.  Therefore, in a bash shell, to produce 5 different sheets with the first sheet starting with the serial number "aaabbb", one can do:
<tt>serialnum="aaabbb";for i in $( seq 5 );do serialnum=`./run_barcodes $serialnum labels_$serialnum.ps`; done;</tt>
 * Preview the sheet if you like with <tt>gs labels.ps</tt>.
 * Load one sheet of labels into the single-sheet feeder on the EDF laser printer by Chris'' desk.  The page goes label side up, top towards the printer.
 * Print it (on the EDF printer) with <tt>lpr -PEDF-LaserJet-4100 labels.ps</tt> (You will probably need to be on ohm.bu.edu)

Contact Alex Long (along528@bu.edu) for additional help.

### HOWTO Verify Tested Chips
Download the program for verifying here: [DoubleCheckASDChips.tar.gz](http://ohm.bu.edu/~along528/DoubleCheckASDChips.tar.gz)

 * No compilation is necessary, but Python does need to be installed.  This should not be a problem as you should be running this on ohm.bu.edu which as of May 30, 2012 is running Python 2.4.3 by default.
 * Look at the README included in the package on how to use this script.  It includes an extensive description plus a briefer one for reference that will be repeated below for convenience. These steps should be repeated during each chip verification session.
 * From the chip test stand Windows computer: Open a Cygwin bash shell and from the home directory enter: <tt>bin/backup.sh</tt>
 * On ohm.bu.edu: While in the DoubleCheckASDChips package directory, run: <tt>./copydatabase.sh</tt> (if the first time it says, "rm: cannot remove `ASD_Tests/'': No such file or directory" this can be ignored)
 * You should verify exactly 9 trays of chips at a time. And, you should only verify as many chips as can be boxed afterwards.
 * To begin verification, on ohm.bu.edu do:  <tt>python VerifyChips.py</tt>. Follow the prompts.  Once prompted for a ChipID, one can scan a chip using the test stand barcode scanner. Type ''help' for some additional options.  Look at the README before scanning chips, as the program expects the user to test chips in a certain manner for error checking purposes.
 * Make sure that the audio is on and audible as system beeps are utilized to notify the user of important information.
 * A single system beep will alert you to duplicate barcodes.  It will also beep once to notify when a full tray has been scanned.
 * If a chip is classified as MISSING or FAILED, the system will beep twice and wait for you to acknowledge this by entering ''ok' before anything else can be done. You should remove the chip from the tray and place it in the correct one or put it aside to handle later.  You should then replace the hole in the tray with a new chip which has been verified to belong in the same tray #.
 * You should expect to here a beep after scanning all of the chips in a single tray. If you do not, then you have not scanned every chip!  To proceed to the next tray, type ''new'.
 * After all 9 trays=594 chips have been verified, place an empty tray on top so as to prevent any chips from falling out when boxing.  Wrap up the 10 trays using packing tape or something similar.
 * Place the wrapped up trays in one of the empty boxes that originally contained untested chips.  It does not matter which box you choose, but make sure that the number of chips listed on the label corresponds to the exact same number of chips that you are placing inside of it.
 * Close up the box and place a label on the box that makes clear that these correspond to verified chips as well as which tray # they correspond to.  It is obviously very important that the tray #''s don't get mixed up, therefore in the past I have been putting additional labels around the box with tray 2 chips so that these do not get confused with the tray 1 chips.
 * Once boxed and labeled, place the box aside with the rest.  These had been stacked over by the window of the EDF, but they may have been moved.  Check with Eric Hazen or someone else if you are not sure where they should go

Contact Alex Long (along528@bu.edu) for additional help.



### Blog of updates

*'2012-05-30, Alex Long*

Updated description inside "HOWTO Print Labels".  Added documentation on chip verification under "HOWTO Verify Tested Chips".

*'2012-03-29, hazen*

Saving getting slow due to large database file.  Copy empty database over ASD.mdb in c:\Teststand.  Copy cumulative file to ASD_cumulative_thru_2012-03-29.mdb on ohm.


*'2012-02-29, hazen*

Chip tester is working!  Socket #2 repaired and continuity tested by Chris.

Setup bmc account with random password.  Add same account to ohm.  Found old data
backup script in ~bmc/bin directory under Cygwin, setup Windows scheduler to run it
late every weekday night.

*'2012-02-14, hazen*

Try tester with 2nd ZIF socket.

*'2012-02-13, hazen*

Connect test stand computer to linksys box in front of EDF with DHCP address.

Create ~/Proj/ATLAS2012 directory on ohm for info.  Back up C:\Teststand to
~/Proj/ATLAS2012/Teststand-2012-02-13.

Connect all and try to test some chips.  After testing an old Grade 1 chip,
look at the data ([chan.csv](http://ohm.bu.edu/~hazen/ATLAS/ChipTest2012/chan1.csv)
and see that essentially all the AC measurements are dead.

*'2012-02-01, hazen*

Researching Vacuum baggers with gas purge.  A likely candidate is the Accu-seal model 35
([link](http://www.accu-seal.com/products/product.aspx?pid=1-6060&tb=1)

*'2012-01-31, hazen*

Boot with "new" HDD.  Reset bmc account password to "Room461" (hazen pw is buphy one).
Can''t login to bmc... says "account disabled"

*'2012-01-30, hazen*

Power up the old computer, observe that it boots (yes!) but no fans spin.
Have Guoan image the HDD and copy the image to a new(er) HDD for regular use.
Replace PSU fan and install two new case fans.  Remove spurious cables and
disconnect all unused devices (floppy, tape drive, old CDROM).

