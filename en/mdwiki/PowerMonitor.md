# PowerMonitor
This is a project to report the whole house electricity use via a web page.  See [FridgeMonitor](FridgeMonitor.md).

Bought:

 * SCT-013-000 Non-invasive AC Current Sensor Split Core Transformer 100A [Amazon](https://www.amazon.com/gp/product/B07FZZZ62L/ref=ppx_yo_dt_b_asin_title_o03_s00?ie=UTF8&psc=1)
 * NodeMCU ESP8266 module
 * Cheezy Arduino rip-off ("Elegoo")

Installed the power monitor library from openenergymonitor.org.  Hooked up to sensor with 33 ohm load resistor and wrote a bit of code.  Tested with 100W incandescent bulb and seems to work OK.

Rearranged wiring a bit in the electric panel so two of these sensors can fit on the main feed wires.

Built firmware for Arduino to output one measurement per second on A4/A5 using software serial at 115200.
ESP8266 can access this using it's port... tested using the telnet/serial bridge on WiFi.

