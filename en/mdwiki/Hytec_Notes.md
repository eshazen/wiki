# Hytec_Notes
I found the Hytec 2256 manual rather hard to understand.
To make the module work in a simple way, the following
should be observed:

 * Connect pins 4, 14 together to provide power for opto-isolators
 * Connect together 1, 5, 6, 7, 13, 15 (if using limit switch,
  connect N.C. switch in series with pin 5)
 * Step/direction outputs are opto-isolated open-collector.
  _'A pull-up resistor <= 1k is required_ to +5V (i.e. pins 4, 14).
  Risetime is quite slow (few us) so some de-bounce may be needed.



