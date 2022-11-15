# SunriseLamp
Project to build a fade-up sunrise lamp for Sara.  Philips one [link](https://www.amazon.com/gp/product/B00F0W1RIW/ref=oh_aui_detailpage_o01_s00?ie=UTF8&psc=1) is a disaster, very hard to program, flaky and forgets everything if you unplug it.  Surely one can do better!

## Specs / Requirements

 * Fairly bright RGB LED strip, maybe similar to the one described [here](https://www.nycresistor.com/2012/09/16/sunrise-lamp-alarm-clock/)
 * Time display / setting controls (but not as primary clock)
 * Fade up nice warm color in morning, fade down at night
 * Gentle wake-up beeper which fades on
 * single button quick fade-off sleep button
 * 7 day schedule
 * toggle / slide switch for alarm/light on/off
 * keep track of time when power off

See [ESP8266](ESP8266.md) page for a better plan

## Parts / ideas

 * LED strip: https://www.adafruit.com/product/285 or https://www.adafruit.com/product/346
   * 30 LEDs/m (0.6A total) or 60 LEDs/m (1.2A total)
 * Recessed lights: http://a.co/iXtIPjC (mount in headboard)
 * Arduino
 * LCD/Keypad shield i.e.
   * $11.50 plus S/H [sainsmart](https://www.sainsmart.com/products/lcd-keypad-shield-for-arduino-duemilanove-uno-mega2560-mega1280)
   * $7.50 Chinese one: http://a.co/4WytBNq
 * $15.00 Sound generator i.e. https://www.adafruit.com/product/2342
   * or $25.00 version with amp https://www.adafruit.com/product/2210
 * $4.95 https://learn.adafruit.com/adafruit-pcf8523-real-time-clock/


