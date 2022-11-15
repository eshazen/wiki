# Apollo_Bring-up
# Bring up
Follow the procedure below to bring up a new Service Module (SM).

Please read the full procedure and the notes at the end before working on a new SM.

## Bring up procedure
Pre-bring-up:

*Put kapton tape over resistor from R95 to R92 to prevent falling off.*

Put kapton tape over top 3 small holes WITHOUT touching 2 big holes on either sides as shown: <a href="http://ohm.bu.edu/trac/edf/attachment/wiki/Apollo%20Bring-up/KaptonTapeOverTraces%2BHoles.JPG"><img src="attachments/KaptonTapeOverTraces%2BHoles.JPG"></a>

Trim excess soldering off J40 and J46 and FP Board's LED arrays before installing front panel. Make sure none of these *short* to the front panel.

1. ECOs. ring up procedure ¶

  Carefully review and check

2. Regulator resistances.

  Measure the resistance between power supplies

|||
|||
  |Supply|Base-resistance|loc|
  |3.3V STB | 67 | J27 |
  | 12V     | 10k | J28 |-2X-XX	00-50-51-FF-1X-XX	Final Zy
  | 4.5V Z  | 24k | J25 |
  | 3.0V Z  | 20k ish | J26 |
  | 3.3V Z  | 5.5k | J29 |
  | 1.8V Z  | 4k | J30 |
  | 4.5V    | 24k | J32 |
  | 3.0V    | 20k ish | J33 |
  | 3.3V    | 4k| J34 |
  | 1.8V    | 1k| J35 |

3. First power-up

   (If putting Blade in 1U crate, install lower latch) (Also if using 1U crate, disconnect fans)

   Recommend disconnecting DUT between power supply and 1U shelf before changing any current limits and /or trips.

   Current limited supply (set to limit to 300mA  oc-trip to 600mA)

   Power on and Measure 3.3V STB and overall current (should be ~60mA?)

   Power down

4. First IPMC power-up

  Install special IPMC

  Power up and measure current (should be ~ 130mA?)

  Check 3.3V STB and 12V

  Power down

5. ESM Power-up

  Increase current limit and trip by 100mA each (400mA and 700mA respectively)

  Install ESM standoffs (2) M2.5x6mm with M2.5x6mm + M2.5x4mm screws

  Install the ESM switch along with jumper J45 set to always on

  Plug in ethernet cable J39

  Power up and measure current (should be ~ 270mA?)

  LEDs D9 and D10 should come on

  Measure voltage of 4.5V, 3.0V, 3.3V, and 1.8V

  ping the IPMC ip address (IP = 192.168.20.something; Special IPMc is 192.168.20.70)

  Power down

  If ping stops after power down, good.

  Disconnect J39

6.  Zynq + FP power-up test

  Install zynq board and FP board as [](attachments/).

  Install SD card with image from here (Look below)

  Plug in FP usb connector to minicom

  *Change J45 to !WaitZynq*

  update the power supply to have a current limit of 500mA and trip current of 800mA

  Power on to Boot zynq and check current ~370mA

  LEDs D6, D7, D8, D9, and D10 should all come on and after several seconds D12 should turn on as well.

  After several more seconds, the front panel LEDs should turn on.

  Measure voltage of 4.5V Z, 3.0V Z, 3.3V Z, and 1.8V Z

  Measure voltage of 4.5V, 3.0V, 3.3V, and 1.8V

  Plug in USB connector to watch FSBL + linux.

  Plug ethernet cable into J44.

  Check zynq has IP address.

  Ping cms4 at 192.168.1.4.

  Power down

7. Final shelf test

  Remove Zynq

  Remove special IPMC and install SM's default IPMC

  *Change J45 to Always On*

  *Have you trimmed the excess soldering off J40 and J46 and the FP Board's LED arrays to make sure they don't short to the front panel??*

  Install front panel hardware

  Put blade in shelf

  Ping IPMC at default address 192.168.1.34 (Using machine with address on edf network: 192.168.1.something)

  Load IPMC firmware (from http://ohm.bu.edu/~apollo/IPMC_FW/) with the following 2 ipmitool commands:
    ipmitool -I lan -H <IPMC IP address> -P "" hpm upgrade hpm1all-IPMC-sm-date.img force

    ipmitool -I lan -H <IPMC IP address> -P "" hpm activate

  Disconnect the blade using bottom latch

  Reconnect blade

  Ping IPMC at new IP address

  Disconnect blade again
8. Finalization

  Insert SD card in FP board

  Install Zynq

  *Change J45 to !WaitZynq*

  Reconnect blade

## Power supply notes

These tests use the Keysight E3634A power supply.

They connect to the DUT using either the 1U shelf or the EDF ATCA J10 Test board.

This supply provides -48V for the blade and uses the (-) black terminal as -48V and the (+) red terminal as -48V return.

The banana plugs on the testing setups should be color coded with matching red/black plugs.
-2X-XX	00-50-51-FF-1X-XX	Final Zy
The (+) side sense outputs should be connected to the power supply ground.

Setup <a href="http://ohm.bu.edu/~hazen/APOLLO/WebStuff/keysight_ps.jpg"><img src="http://ohm.bu.edu/~hazen/APOLLO/WebStuff/keysight_ps_tn.jpg"></a>

Setup [](attachments/)

To set the voltage press "Display LImit and then press the "!Voltage/Current" button until the voltage is flashing, then use the knob to adjust the voltage.
Then press the "Display Limit" button again.

### Configuring the currents on the supply

To configure the currents, turn the power on on the supply but make sure the output is off. (It will say this on the display)
To set the current limit, press the display limit button and use "!Voltage/Current" until the current value is flashing.
Now use the adjust to change is the the desired current, then press the display limit button again.

To set the current trip, press the "Over Current" button, adjust the trip current (a few 100mA above the limit) and press "Over Current" and wait.

If everything is set, then press the "Output on/off" button to turn on the output.

### Over current

If you have over currented because you chose a poor current limit, you need to press the "Output !On/Off" until the output is off, then press the "Over Current" button twice.
Once you are in this menu, adjust the knob until you see the display say "OCP Clear", then press the "!Voltage/Current" button twice.  This will clear the over current.

## SD Image notes
The Zynq SD image should go on a 8GB SD card.

From a fresh card, follow the instructions [SMZynqSDCard here], but make the first partition 1GB and have the second partition fill-out the rest of the card.

Once you have created a the correct partitions and formatted them, from [here](http://ohm.bu.edu/~apollo/Zynq/SD_Contents/), please extract the most recent zynq_sdcard_p1 tarball to sd card partition 1 and the most recent zynq_sdcard_p2 tarball to partition 2. You can extract the first file with the following commands:

Put file zynq_sdcard_p1-2019-07-24.tar.gz in any directory:

$ cd /directoryOfYourChoice

$ sudo mount /dev/xxxx /mnt/ (I had sdf1 for as my device name (xxxx))

$ cd /mnt/

Decompress and extract:

$ gzip -d -c ~/directoryOfYourChoice/zynq_sdcard_p1-2019-07-24.tar.gz | sudo tar -x

Following step below to change mac address:

