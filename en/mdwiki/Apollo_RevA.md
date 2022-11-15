# Apollo_RevA
## 2019-10-07

(Ben): Found how to read sensor values using ipmitool raw. See [ComtelATCAShelf](ohm) crate info for more information.

## 2019-09-25

SM#8 taken to CERN and installed in TIF.  Access is via `pcuptracker001.cern.ch` (ask if you need an account).
Reprogramming the IPMC with Thiago's IPMC version (1.20?) with DHCP enabled.

[apollo-ipmc-fw.zip](http://ohm.bu.edu/~hazen/APOLLO/FW_temp/apollo-ipmc-fw.zip)

Reprogramming incantation:
```
1) Copy the new firmware to the IPMC

    $ ipmitool -H $(SHM_IP) -P "" -t $(IPMB_ADDR) hpm upgrade hpm1all.img force

2) Activate the new firmware:

    $ ipmitool -H $(SHM_IP) -P "" -t $(IPMB_ADDR) hpm activate

Some explanations:

- $(SHM_IP) is the IP address of the shelf manager

- $(IPMB_ADDR) is the IPMB address assumed by the blade
when inserted in the crate. Physical slot 1 is 0x82;
Physical slot 2 is 0x84; Physical slot 3 is 0x86; and so on.
```

We found that the IPMB address was 0x96 for the 2nd slot from the left at the TIF.
All good.  Now the IPMC has IP 10.0.0.14 assigned by DHCP
(the Zynq is 10.0.0.13).

## 2019-08-06
(Dan): Put updated IPMC fw on SM07.  I2c works to temp sensors and did somethign with the Zynq IPMC slave.
It might have old zynq fw with some address mismatching.
Will fix tonight/tomorrow.

Sent SM09? to Cornell.

## 2019-07-26
(Felex):

SM008: Hadn't noticed this before but D9 and D10 light up momentarily during step 4 "Installing IPMC". Everything else was normal. However, I'm currently on SM002 and these 2 did not light up momentarily.

## 2019-07-25
(Felex):

SM004: More problems than previously. Everything was normal until zynq was installed and power turned on. This time, 4/6 LEDs did not turn on. Current drawn was ~170mA.

## 2019-07-24
(Felex):

SM004:
During step 4 of bring up after installing special IPMC current drawn hovered at 130mA instead of 120mA. SM004 had blue LED installed and it came on. Previously, SM007 did not have the blue LED installed during step 4 so maybe that is why SM007 hovered at 120mA. Also, one of six LEDs did not come on in the "boot zynq" step. Maybe linked to resistor between R95 and R92 falling off. Testing stopped.

## 2019-07-24
(Dan): Odd behavior when we loop the zynq second nic back to the ESM port.  Seemed to get stuck in an auto-negotiation mess. Fixed with "ethtool -s eth0 speed 100 duplex full autoneg off" and added it to the startup script.
Also odd behavior of dropbear not being able to write its newly generated key.   Look into image issues for this.


## 2019-07-22
(Felex and Dan): Using partially modified service module 8 to set up special IPMC. IPMC without 12V on draws ~70 mA. An IPMC and ethernet switch without 12V draws ~100 mA.

## 2019-07-11

(Eric:) Some random thoughts

 * Let's modify one SM so that the RED, GREEN and ORANGE LEDs are always on so we can optimize the front panel. The BLUE LED presumably does it's thing and we can see it already.
 * We have talked about an EEPROM with serial number, MAC address etc on the SM.  Maybe we should add this to the front panel board, or anyway we need to discuss it.

## 2019-06-25
(Felex): Command for ipmitool sol: ipmitool -C 0 -I lanplus -H <ipaddress> -U <username> -P <password> sol activate
Ask Dan or Felex for username and password.
## 2019-06-21
(Dan): Removed R92 and replaced it with a 4.7kOhm resistor to 3v3_stby.  This makes sure nothing is routed to the zynq console until the IPMC has brought up the zynq.
## 2019-06-04
(Dan): F140 switch is installed and can be accessed at 192.168.10.250.
(Dan): The blades in the shelf on a vlan that I don't yet know how to permanently change, but if you ssh in you can do the following to put the vlan interface on the 192.168.20 network our IPMCs are on.
```
ifconfig vlan1.21 192.168.20.1
```
The default network is 192.168.21.


## 2019-06-03

(Dan): On SM-001 I did the ECO for the UART multi-plexer

(DAN): On SM-005, I removed R94 & R98

(Dan): moved mounting hardware from SM-002 and installed in SM-005 for use in the ATCA shelf
## 2019-05-28

(Dan): To fix FP usb select, remove R2 and run a ~100 Ohm resistor from the USB_UART_EN side to the FT_3V3 side of C10.  Now the FP will be routed to the ZYNQ when the cable is plugged in.

(Dan): Removed R98 and R94 on SM (001).

(Dan): Remember that FP board LED reset and LED clk are swapped.


## 2019-05-20

(Eric+Thiago): IPMC can now control 12V.  Also, in ATCA shelf the 12V gets switched on as it should at power-up.

(Eric):  Working on *SM 003*:  Assembled new "pseudo backplane" board.  Jumpered for address 0x43 ("slot 3") by cutting jumpers 0, 1, 6.  Power up using old Lambda 40V PS set to maximum (ATCA PIM min Vin is 36V).  Now I *can ping the IPMC at 192.168.1.34* !  Leaving it on and connected; Thiago may be working remotely.

Notes on *slot address* setting:

According to the [CERN IPMC page](https://cern-ipmc.web.cern.ch/) the slot numbers are 0x41...0x50 for ATCA slots 1...16.  The corresponding IP addresses should be 192.168.1.20...192.168.1.35.  This feature is currently not working.  Also, 0x43 and 0x45 are the only slot addresses currently known to work (and they give the default IP address 192.168.1.34).

## 2019-05-15
Issues:
   * 220uF caps should get smaller (physically, too tall)
   * Remember to populate R50 with CERN IPMC value.
   * We should add a pull-down to U15 pin 1 for when we have no IPMC (added on board 1)
   * ~~We should add a pull-up to ETH_SW_RESET_N~~ (Has on-board pull-up, so we are OK)
   * Traces under mounting splice plate holes
Notes:
   * No IPMC/Switch/Zynq => 48V@ ~60mA
   * 3.3V and 12V => ~120mA
   * Powering up 3.3/1.8V regs gives ~200mA
   * Powering up with 3.3/1.8V + zynq 3.3/1.8 and 12V gives 230mA
