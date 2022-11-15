# AutoCADTricks

[LibreCAD https://librecad.org/] is a nice open-source alternative to e.g. !AutoCAD for simple 2D drawing.  It's native format is DXF, which is supposed to be interchangeable with !AutoCAD.  However, as of now (LibreCAD 2.1.3) the DXF files produced provoke an error in at least !AutoCAD2000 such as:

```
  Unknown group 49 for table on line xxxx
  Invalid or incomplete DXF input -- drawing discarded
```

See [DXF format info](http://www.relief.hu/h_dxf12.html) (or [local copy](http://ohm.bu.edu/~hazen/AutoCAD/AutoCAD%20Release%2012%20DXF%20Format.html)).

The troublesome entity is a table which begins:
```
  0
TABLE
  2
DIMSTYLE
```

and ends:

```
  0
ENDTAB
```

After a few tests it seems that deleting this table makes the file usable.  Writing a perl script...
