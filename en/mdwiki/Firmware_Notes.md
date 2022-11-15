# Firmware_Notes
Can use direct control of IR LED/Sensor (without separate microcontroller?)

Here is a possible outline:

 * Interrupt at 80kHz
   * Toggle IR outputs
   * count to 80
 * Every 1ms
   * Check sensor status and update state
   * count to 10
 * Every 10ms
   * Check buttons and update state
   * count to 10
 * Every 100ms
   * Update display based on state

When timer is running, should try to update LCD in a ''smart' fashion
as fast as possible for a good effect.

Need to control alignment LEDs for sensors, and beeper too.



