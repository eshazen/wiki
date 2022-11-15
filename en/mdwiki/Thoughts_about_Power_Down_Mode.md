# Thoughts_about_Power_Down_Mode
```
Here are some thoughts about the power-down mode.
Battery capacity is around 1.0 A-hr.  Discharge time vs current draw:

1uA    1e6 hours    100 years
10uA   1e5 hours    10 years
100uA  1e4 hours    1 year

So we should probably keep the quiescent current below 100uA so the
battery lasts a year when the device is "off".

Switching Converter (TPS61097)
    The quiescent current is listed as typically 2uA though the data sheet
    is a bit confusing.  Highest number is 5uA which is fine.

BLE module
    It has a sleep mode, but the power consumption seems to be at least 60uA
    which is probably too much.  We should put the P-MOSFET power control back
    on the BLE module.

Gyro (L3GD20H)
    This has a power-down mode which draws 1uA.  This seems ok,
    but we should read the data sheet carefully to be sure we can enable this mode

ATMega328
    There are six sleep modes.  The lowest-power is "Power-down" mode.
    In this mode the current is much less than 1uA
    It can be woken from power-down mode by a pin change interrupt.

The firmware must take care to disable all the ouutputs with pull-up resistors
before going into power down mode.
```

