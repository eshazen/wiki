# HTR_config
# VME HTR install

Test edit

[ Debug-log ](_Debug-log_.md)
### xdaq
This is a work in progress.

Follow [this](https://twiki.cern.ch/twiki/bin/viewauth/CMS/HcalTeststand)

### A2818
Use the src rpm to build and install the module (cached [here](http://ohm.bu.edu/~dgastler/CMS/daq-caena2818-1.17.0-1.cmsos12.slc6.gcc4_4_7.src.rpm))

If the rpm can't be built, but the components can, then move the contents of the "extras" folder in ~/rpmbuild/BUILD/*/extern to /lib/modules/"kernel version"/extra and run "sudo depmod -a"
