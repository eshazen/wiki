# KiCad_3D_Models
## Acceptable File Types

*Updated 7/3/20*

KiCAD is known to support at least the following file types, as of vsn. 5.0.0.
 * .wrl
 * .stp (STEP)

## Making your own model

The path we'll take goes from OpenSCAD to FreeCAD to !KiCad. You can skip over OpenSCAD if you would prefer to design in !FreeCad.

*Note:* as of at least v0.18.4, FreeCAD ships with an OpenSCAD plugin so it can open `.scad` files directly.

## Installing OpenSCAD
To install OpenSCAD, run the commands

```
sudo add-apt-repository ppa:openscad/releases
sudo apt-get update
sudo apt-get install openscad
```

And to open, run the command

```
openscad
```

## Using OpenSCAD

From here, you can actually use the software! OpenSCAD has a great tutorial here: [http://www.openscad.org/documentation.html]. In short, the software relies on typed user inputs of shapes with given parameters. For example, to make a traffic cone, one could type:

```
cylinder(h=5,r=800,$fn=4);
cylinder(h=900,r1=400,r2=1,$fn=50);
```

Once you have made your 3D model, just save it to the normal `.scad` file.

## FreeCad

FreeCad is a graphical modeling software. A good starter tutorial can be found here:[https://www.freecadweb.org/wiki/Creating_a_simple_part_with_PartDesign].

In FreeCAD, select *View->Workbench->OpenSCAD* then *File->Open* will let you open the `.scad` file directly.

For best use in KiCad, this file should be exported to the .wrl type. Again follow `File > Export` (or `Ctrl + E`) and navigate to your desired directory. type a file name and select "VMRL V2.0 (*.wrl, *.vmrl, *.wrz, *.wrl.gz)" from the "Files of type" dropdown

## KiCad

To load a 3D model into KiCad, one must begin in Pcbnew with footprint components placed on the board. When parts are in their final places, edit your first footprint. Select the tab "3D Settings," and click "Add 3D Shape" in the upper-right corner. Navigate to the subdirectory in which the 3D model is stored, select the file you desire, and hit "OK". This selection associates the .wrl file with the footprint. More likely than not, the 3D model will look very wrong. Barring any poor design, the discrepancy comes from three aspects of the shape. First is the offset - if the origin for a footprint is in the upper-left-hand corner but the 3D model is centered around the origin, the model will be 50% too far in both directions. To correct this, simply offset the "3D Shape" (as KiCad calls it) by the displacement between the origins on each axis.

Second, the part may be rotated. For example, a connecter may be designed with keying holes pointed upwards for simplicity but may need them pointing parallel to the board. Simply rotate by +/- 90 deg. along the necessary axis.

Last is the Scale of the part. Because KiCad uses Imperial units for 3D modeling dimensions and many CAD softwares (notably, FreeCad) use metric units, the size of the part should always be off by a factor of 2.54. To fix this, change the scaling factor in the X, Y, and Z boxes to 0.3937.

N.B. In KiCad 4, there is a bug with relative paths where they often will not display parts in the 3D viewer. For best results use KiCad 5.
