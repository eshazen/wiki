# ComtelATCAShelf

 * [Power Module](http://ohm.bu.edu/~hazen/DataSheets/GE_Power/CP3500AC54TE_DS_July_22_2016.pdf) (model CP3000AC54TEZ)
 * [Power Shelf](http://www.mouser.com/ds/2/167/CPB-CPL%203-17-16-473069.pdf) (we have a J2014003L001)
 * [ATCA-F140 Switch](https://www.artesyn.com/computing/products/product/atca-f140-40g-advancedtca-switch-blade)

----
 == Crate info ==
   * The shelf manger is at 192.168.10.171.  This conflicts with something from the rarp server running on cmssun1, so shut it down if you want to talk to the shelf manager.

** Sending Raw hex commands to read sensor data:

  The following example uses the ipmitool raw command to get temperature data from !FanTray 1

  The argument 0x04 signifies !SensorEvent

  The argument 0x2d means read sensor data

  235 is the sensor number, in this case the temperature reading for FanTray1.

 {{{
[bkilian@cmssun1 ~]$ ipmitool -I lan -H 192.168.10.171 -P "" -t 0x20 raw 0x04 0x2d 235
 17 c0 c0
}}}

  The first value displayed, 17, is the HEX value of the temperature. c0 c0 signify the sensor status and the state mask.

 * Fan Speed

  To read the fan speed of the !FanTrays, use as the final argument:
    240 - FanTray1

    241 - FanTray2

    242 - FanTray3

    243 - FanTray4

  The resulting hex value multiplied by 46 is the fan speed in RPM. For example,
```
[bkilian@cmssun1 work]$ ipmitool -I lan -H 192.168.10.171 -P "" -t 0x20 raw 0x04 0x2d 243
 2c c0 c0
```
  gives us 2c, or 44, for fan speed. The actual fan speed is 44*46 = 2024 RPM

 * Temperature

  To read the temperature of each fan, use as the final argument:
    235 - FanTray1

    236 - FanTray2

    237 - FanTray3

    238 - FanTray4

  The first number that is output is the hex value, in degrees Celsius, of the exhaust of the fan.

Further examples (not specific to our shelf) using ipmitool raw can be found [here](https://github.com/erik-smit/oohhh-what-does-this-ipmi-doooo-no-deedee-nooooo/blob/master/1-discovering/snippets/Computercheese/IPMI-Sensor%20Device%20Commands.txt).

 == IMPORTANT NOTES ==
 * The COB's insertion lever's sensor is broken and you must run clia commands to install/uninstall it. This involves commands typed into the shelf manager (talk to Dan)

 To install: Insert COB as you normally would and then run the following command to tell the shelf the lever is correctly set

  ` clia sendcmd 0x96 0x2e 0x08 0x0a 0x40 0x00 0x00 0x01 `

  Where 0x96 is the IPMI address for the physical slot 2 and logical slot 11

 To remove: Type the following command to simulate the lever being opened

  ` clia sendcmd 0x96 0x2e 0x08 0x0a 0x40 0x00 0x00 0x00 `

  Wait for the COB state to be inactive and then remove it physically.

----

 == Log ==

 === 2016-09-12 Dan ===
 config file updates for sane fan trays

/etc/rc.comtel
```
#CARRIER_OPTIONS="USE_DEFAULT_COOLING=TRUE" # enables default cooling strategy (non-zoned)
CARRIER_OPTIONS="USE_DEFAULT_COOLING=TRUE" # enables default cooling strategy (non-zoned)
```
/etc/shelfman.conf.comtel
```
#MIN_FAN_LEVEL = 40
MIN_FAN_LEVEL = 1
```
/etc/shelfman.conf
```
# COOLING_FAN_DECREASE_TIMEOUT = 0
COOLING_FAN_DECREASE_TIMEOUT = 1
# COOLING_FAN_INCREASE_TIMEOUT = 0
COOLING_FAN_INCREASE_TIMEOUT = 1
```
```
#COOLING_POLL_TIMEOUT =30
COOLING_POLL_TIMEOUT =5
```

 === 2016-09-12 ===
 * Using a POT, the power shelf output voltage was set to 48V

 * Controller pinout

| J1 pin/color | Arduino pin | use   |
| -- --------- | ------- --- | ---   |
| 13/brown     |             | SCL_0 |
| 15/red       |             | SDA_0 |
| 18/white     |             | Alert#_0 |
| 19/orange    |             | \EN_B |
| 21/blue      |             | \EN_A |
| 20/brown     |             | ground |
| 22/red       |             | ground |

