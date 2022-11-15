# FridgeMonitor
SVN:  http://edf.bu.edu/svn/edf/EricHome/FridgeMonitor/

Wifi-enabled temperature logging via web.

Ordered an ESP8266:  https://www.amazon.com/gp/product/B01N3P763C

Works great!  Connected to kitchen Wifi.  Wrote a logger on ohm with simple authentication.

See:

 * https://github.com/esp8266/Arduino/blob/master/libraries/ESP8266HTTPClient/examples/Authorization/Authorization.ino
 * https://github.com/esp8266/Arduino
 * https://randomnerdtutorials.com/esp8266-ds18b20-temperature-sensor-web-server-with-arduino-ide/ (*USE THESE INSTRUCTIONS* to set up libraries)

Another project:  security camera to see when fridge is opened.
We have a Raspberry Pi 3, WiFi dongle, USB camera.
Set up the Pi3 with WiFi and installed _motion_ video capture package.

Now we need to have the Pi set up a reverse ssh tunnel on boot.  Try this:

https://www.tunnelsup.com/raspberry-pi-phoning-home-using-a-reverse-remote-ssh-tunnel/

