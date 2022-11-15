# setup_notes
### Laptop
 * Username + password are on desk.
 * to use altera to compile, ssh -YC EDFguest@volta.bu.edu
*

### flight simulator board
 * Flightsimulator board path: ~/work/flightsimulator/python
 * config file: trackersim.conf
 * executable: loadtimes.py
   * you must choose the correct USB device with the -u command (usually -u /dev/ttyUSB2)

### Tracker readout module
 * readout path: ~/work/TRM-python
 * command: readout.py -v (threshold in mV) -D /dev/ttyUSB(0-2)

### Histogram generation code
This script will run the readout module and make histograms of the least significant bits of the TDC bins.  Make sure flight simulator is running.
 * script directory: ~/work/TRM-python
 * command: substructureSearch.py -n (number of histogram entries) -o (path to output directory) -v (threshold in mV) -D /dev/ttyUSB(0-2)
