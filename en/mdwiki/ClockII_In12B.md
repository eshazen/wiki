# Nixie Clocks

## 2004 version

* 2004 version: http://ohm.bu.edu/~hazen/Nixie/

## Nixie transistor clock

* [NixieTransistorClock](NixieTransistorClock.md) (from kit: https://tube-clock.com/)

## In-12B clock built in 2018-2020

* Github:  https://github.com/eshazen/nixie-clock-2
* SVN:  http://edf.bu.edu/svn/edf/EricHome/NixieClockII/ (obsolete)
* Nixie mount PCB:  http://edf.bu.edu/svn/edf/EricHome/NixieClockII/hardware/trunk/ExampleNixieHolder.pcb
* https://www.ebay.com/itm/D-Sub-Crimp-Contact-Pin-Female-50pcs-per-lot/372631469576?hash=item56c290fe08:g:YeQAAOSw9r1V9QwJ
* http://www.craigandheather.net/celenixieclock.html


<a href="http://ohm.bu.edu/~hazen/Nixie/New2019/mainboard_big.jpg"><img src="http://ohm.bu.edu/~hazen/Nixie/New2019/mainboard.jpg"></a>

<img src="http://ohm.bu.edu/~hazen/Nixie/New2019/socket_board.jpg">

PCB holding two IN-12B (B-5991) nixie plus two neons for optional colon.
Pins for D sub connectors fit well but are relatively expensive except for crimp ones.

New PCB done in 2018 in SVN above with ATTiny861A.  Parts kit and PCBs in stock.  Designed ATTiny861A which unfortunately doesn't have asynchronous serial either, but at least has 512 bytes of RAM so can be programmed in C.  Seems like an ATTiny2313 with serial port could be used too.

*2020-06-27*

It's all in a box (except the ESP8266). Crashes when the ESP8266 reboots.  Add a 30s startup delay, seems OK now.

Eliminated the time-of-day increment in the AVR so it now depends entirely on the ESP8266 (otherwise there were weird interactions).

*2020-06-07*

Time to finish this thing!  Moved doco to github.  Wired an ESP8266 to get the time from wifi, and added support in the AVR code.  Now just need to figure out a 5V supply solution and get it in a box.

Power supply notes:
 * AC in 100V on output of Triad N68X isolation transformer
 * DC 240V on rectifier output (+ term of C1).
 * DC across zener 157V
 * Cathode R (10k) drop 20V so ~ 2mA which is well within [IN-12A spec](http://www.tube-tester.com/sites/nixie/data/in-12a.htm).
 * AC input measures 42mA with cheap meter.

R1 is dissipating 0.7W but it's rated 1W so probably ok.

So, we need a transformer which can provide 120V at ~ 0.5A and maybe 6.3V ~ 50mA for 5V.  Bought a [Triad F-344X](https://www.mouser.com/datasheet/2/410/media-1068269.pdf) on eBay.  12.6VCT, dual 120/240 primaries, 25VA.  Plan to make 5V using rectifiers and 7805 the old-school way.

Notes from svn:
```
Question is how to mount things.  Nixies/sockets on
standoffs from rear vertical alu panel.
PCB under box?  Transformer next to nixies?

Other items:

      Transformer:  F-314X (237-1968-ND)
        Dual 117V primary and 6.3V secondary
      A1A neons for colon
      Switches
      box Hammond 1590R or RBK ~ 7.5 x 4.4 x 2.4
          Hammond 1590D or DBK ~ 7.4 x 4.7 x 2.0
      plexiglas cover
      AC power input
```


*2020-03-02*

New nixie socket board works!

Looking at 60Hz input.  Layout has a mistake... missing via under pin 2 of C4.  Added a wire.  No signal downstream of C4 (ratty 300mV).  Not sure what the plan was with D4.  Should be between GND and VCC.  Could cut the trace to D4 pin 2 and wire to VCC.  Tried this, no better.  Need to redesign this.

*2020-02-09*

Verified that the board works (drives two Nixies), but with some issues:

 * Tens and Ones digits reversed.
 * Nixies too close together
 * Spun a Rev B of the socket board and ordered from Osh park today

## ECOs

 * Change 10 pin ISP for 6 pin

## Debug Log

 * avrdude incantation: `avrdude -p t861 -c avrispv2`
 * blinky test runs!  http://edf.bu.edu/svn/edf/EricHome/NixieClockII/software/Test1

