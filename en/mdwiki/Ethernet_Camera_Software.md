# Ethernet_Camera_Software
# EDF Camera 1 Software

I have written a few simple programs for readout of the CCD camera.
Software is archived here: [CCD_2014-07-14.tar.gz](http://ohm.bu.edu/~hazen/AhlenCCD/CCD_2014-07-14.tar.gz)].

To compile the programs, type:

```
 $ cd EDF_Camera1
 $ make

```
Please see the file *'README.txt* for up-to-date information on how to run each program.

## Capturing Images

To capture an image from the camera, first please make sure it is in single-frame mode (switch 1 only is on).

```
 $ ImageCapture -c test.pgm

```
This will capture an image using the current settings of the camera in PGM format and store it in the file *'test.pgm*.

To see a (text) histogram of the pixel values in the file, type:

```
 $ pgmhist test.pgm

```
To convert the image to PNG format for convenient viewing, type:

```
 $ pnmtopng test.pgm > test.png

```
To equalize the histogram (maximize contrast) and convert, type:

```
 $ pnmhisteq test.pgm | pnmtopng > test_eq.png

```
To view a png image, using eog, type:

```
 $ eog test.png

```


