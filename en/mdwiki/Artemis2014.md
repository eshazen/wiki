# Artemis2014

2018 slides:
http://ohm.bu.edu/~hazen/Artemis/Hazen_uC_arduino2018.pdf

## Sample Sketches

 * [dance4b.ino](http://ohm.bu.edu/~hazen/Artemis/2014/dance4b.ino)
 * [http://ohm.bu.edu/~dean/ws2182b/artemis_test/artemis_test/artemis_test.ino] - Dean's sample code

## Addressable RGB LED project

 * Soldering, Arduinos, LEDs:  [Eric's Slides](http://ohm.bu.edu/~hazen/Artemis/2014/Hazen_uC_arduino.pdf)
 * [Sparkfun addressable RGB LED](https://www.sparkfun.com/products/12877)
   * [Details](https://learn.sparkfun.com/tutorials/ws2812-breakout-hookup-guide/ws2812-overview) from a related product
   * [Adafruit NeoPixel](https://github.com/adafruit/Adafruit_NeoPixel) library for arduino
   * TO INSTALL:
     * Download this zip:  [http://ohm.bu.edu/~hazen/Artemis/2014/Adafruit_NeoPixel.zip]
     * Open Arduino software
     * do *Sketch->Import Library->Add Library* and select the zip you downloaded
   * WS2812 controller data sheet: [Adafruit hosted PDF](http://www.adafruit.com/datasheets/WS2812.pdf) [EDF PDF](http://ohm.bu.edu/~hazen/DataSheets/Worldsemi/WS2812.pdf) (needs password)
 * Sample 4-LED flash rhythm sketch
   * Arduino sketch:  [dance4.zip](http://ohm.bu.edu/~hazen/Artemis/dance4.zip) (requires Adafruit NeoPixel library above)
   * Video of sketch running: [(youtube link)](https://www.youtube.com/watch?v=YIbmivYCsNY)
   * Wiring photos:  [top](http://joule.bu.edu/~hazen/Artemis/2014/Dance4/wiring_1.jpg) [bottom](http://joule.bu.edu/~hazen/Artemis/2014/Dance4/wiring_2.jpg)
 * Python serial communications
   * [Adafruit Serial Lesson](http://www.ladyada.net/learn/arduino/lesson4.html)
   * [serialSetLed](http://ohm.bu.edu/~hazen/Artemis/2014/serialSetLed.zip) -- sample sketch to set LED using serial commands
   * [led_serial.py](http://ohm.bu.edu/~hazen/Artemis/2014/led_serial.py) -- Python script to blink LEDs using above script
 * PowerTestingNotes

## TO DO list

 * EDF Team
   * Test and reprogram all Arduinos (Eric, Dan, Dean, Daniel?)
   * Get python / python-serial working and tested on CAS lab computers (Artemis team)
   * Find soldering irons, check tips, sponges
   * Get together all other materials on a cart
 * Artemis Team
   * Setup C/C++ environment for C training (if using)

## Supplies List for Artemis 2014

 * Artemis supplied:
   * RGB LEDs (Cynthia ordered)
   * Foam core (12+)
   * Markers / other art supplies
   * Pencils to poke holes in foam core
   * Regular LEDs for Artemis experiments
   * Computers with:
     * Arduino software
     * Python?
   * C training and "cheat sheet"
 * EDF supplied:
   * Arduinos (12+)
   * USB cables (12+)
   * Single-strand wire (lots) [from PY371?]
   * Soldering irons (12?)
   * Solder
   * Wire cutters
   * Wire strippers
   * stuff for practice soldering
   * vices / clamps
   * Wall-wart power supplies
   * Power-points:

     * Arduino software environment
     * More on wiring

### Reference

 * [First Bytes 2014](http://www.cs.utexas.edu/users/ans/firstbytes/index.html) -- project from U-Texas
 * [Blog Post](http://www.deepdarc.com/2010/11/27/hacking-christmas-lights/) with lots of protocol details
 * [PY371](http://edf.bu.edu/PY371/) class link and [Archive](http://edf.bu.edu/PY371/Files2013/) of sample projects

### 2015 Volunteers

 * Dan G
 * Zach C
 * Alex G
 * (4) Artemis organizers
 * Jason C (Monday only)
 * Raeef I
 * Hannah P
 * (Daniel A)
