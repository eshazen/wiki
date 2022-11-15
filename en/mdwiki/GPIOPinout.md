# GPIOPinout
Pin mapping for GPIO board.  10 pairs of signals are used, though they are not used as pairs for GPIO.  All should be designated as LVCMOS_25 type and assigned as input or output as given below.  The "Conn" column indicates the connector or pin on the GPIO board itself.

```

Zynq DIFF  Conn         Direction

P15  0P    SMA-J1       Input
E18  1P    SMA-J2       Input
L19  2P    SMA-J3       Input
M17  3P    SMA-J4       Input

L16  4P    J9-23        Input
G17  5P    J9-21        Input
G19  6P    J9-19        Input
K14  7P    J9-17        Input

H15  8P    J9-13        Output
L14  9P    J9-15        Output

P16  0N    SMA-J5       Output
E19  1N    SMA-J6       Output
L20  2N    SMA-J7       Output
M18  3N    SMA-J8       Output

L17  4N    J9-1         Output
G18  5N    J9-3         Output
G20  6N    J9-5         Output
J14  7N    J9-7         Output

G15  8N    J9-9         Output
L15  9N    J9-11        Output


```
