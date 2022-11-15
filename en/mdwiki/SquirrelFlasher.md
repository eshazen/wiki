# SquirrelFlasher

Rumor has it that Squirrels don't like strobe lights.  See for example:  https://www.evictor.com/products/10k

This thing is fine but requires AC power and costs $150.  I'm thinking much cheaper flashers made of high-power LEDs.  Digikey has a bunch from Bridgelux which seem possible, e.g.:

```
BXRE-40E6500-C-73  @ $14.64 ea

  nom 1440mA 52V  75W  12,400lm
  max 2800mA 56V  161W 22,000lm
```

See [datasheet](https://www.bridgelux.com/sites/default/files/resource_media/Bridgelux%20DS103%20V22%20Gen%207%20Array%20Datasheet%2020181105%20Rev%20N.pdf)

Maybe a 1000uF capacitor charged to a programmable
voltage in the 52-56V range discharged through the
LED through a MOSFET?

