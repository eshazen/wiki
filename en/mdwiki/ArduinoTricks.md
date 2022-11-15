# ArduinoTricks
<toc>

## Timing with Interrupts

The *'delay()* function can be used to pause program execution for a number
of ms.  It has two problems:  it is not very accurate for periodic actions,
and the Arduino can''t do anything else while waiting for the delay.  The answer
to this is an _'interrupt_, which causes the CPU to stop what it is doing and
call a function, then return to whatever it was doing.  The source of the interrupt
can many things, but one of the simplest is a timer.  This allows a function to
be called at precise time intervals.  Here is an example:


```
  //
  // LED blink with interrupt
  //

```
```
  #include <TimerOne.h>          // use function definitions in this file

```
```
  void setup() {
    Timer1.initialize( 100000);  // initialize timer, period = 100ms
    pinMode( 13, OUTPUT);        // set pin 13 (with LED) as output
    Timer1.attachInterrupt( blink);  // "attach" function blink()
  }

```
```
  // nothing to do in the main loop!
    void loop() {
  }

```
```
  unsigned char led_state = 0;

```
```
  // toggle the LED state when called
  void blink() {
    digitalWrite( 13, led_state);
    led_state ^= 1;
  }

```
Before you can use this you must install the Timer1 library.
Get the code here:  [Timer1 page](http://playground.arduino.cc/code/timer1)
Read how to install a library here:  [Arduino Libraries](http://arduino.cc/en/Guide/Libraries)

NOTE:  Executing code takes time.  If you try to do too much in the interrupt function
and call it too fast, there may be no processor time left for the main *'loop()* function
to run.

## Memory

The Arduino processor ([ATMega328](http://www.atmel.com/devices/atmega328p.aspx)
types of [memory](http://playground.arduino.cc/Learning/Memory)
about are Flash (where the program is stored) and RAM (where your variable are stored).

If you overflow the 32k flash with code (or data stored in flash using PROGMEM)
you''ll get an error message:  *"Sketch too big"*.

RAM is more tricky.  You must keep track of how many bytes each of your variables uses
and avoid using close to the 2048 byte maximum.

You can see the size of the static memory areas using the tool ''avr-size'.
On a linux machine, look for a directory called /tmp/buildxxxxxxxxxxxx with the
most recent time stamp:

```
  $ ls -ldrt /tmp/build*

```
In this directory should be a file named something like

```
  your_sketch_name.cpp.elf

```
Run the command:

```
  $ avr-size your_sketch_name.cpp.elf

```
```
   text	   data	    bss	    dec	    hex	filename
   1244	      2	     17	   1263	    4ef	sketch_mar14a.cpp.elf

```
The values printed are as follows:

```
    text - flash data used for code
    data - Memory with initialized data (the initial value has to be stored in FLASH too!)
    bss  - Memory that is initialized with zero''s (the compiler will add some code so it will initialize data & bss)
    dec & hex are a decimal and hex display of the combined RAM and FLASH size of your program.

```
In the example there are two bytes of initialized data and 17 bytes of uninitialized memory, for
a total of 19 bytes of RAM used.

*'However* this only counts _static_ data (that is, variables declared outside any function).
It is safest to declare _all_ your variables like this so you can check using avr-size if you have
too much RAM used.

