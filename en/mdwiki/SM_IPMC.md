# SM_IPMC
## Programming instructions
You will need a linux machine that has ipmitool installed.

If using the CERN dev-kit, you will also need mini-com and you will need to search your lab for a ethernet jack that the dev-kit likes... good luck.  This configuration will also require you to set the HW address via USB UART with the command "SETHA 0x34"

Once you have the IPMC powered up and plugged into the network, you need to be able to talk to it via ethernet.
