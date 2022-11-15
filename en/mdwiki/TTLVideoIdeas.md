# TTLVideoIdeas
Looking at an all-TTL VGA (640x480) bit-map design.  Inspired by https://eater.net/vga#kits

The decoding isn't terrible.  Rough chip inventory without RAM or latches

```
  Horz/vert counter    (3) 74AC161
  Horz/vert decode     (1) 74AC04
                       (4) 74AC30
  Horz/vert sync       (1) 74AC174
                       (1) 74AC04
            Total     (10)
```

So about 20 chips for H/V counters and logic.  Then memory etc.  With 74AC logic should run fine at 25MHz.
The annoying bit is all the decoding for the sync and blanking.  Here's another crazy one:

https://hackaday.io/project/175434-worlds-simplest-ttl-vga-circuit

This one stores the HS, VS and reset _in the EEPROM_.  This is brilliant! It eliminates all the
complicated logic to decode the start and end of blanking, syncs, etc.   For our 640x480 timing where
we group the horizontal into 8-bit "characters", with a total of 80 per line and 524 lines, we can use
a separate EEPROM (e.g. AT28C256) with a 3-bit value per character to encode: (display, blank, HS, VS, end-of-frame).
If we read one byte per pair of "characters" then we need a 32k EEPROM just for the timing info, but still
800x524 = 19 bits of counter.  Idea:  use a 74AC161 for the pixel bits at 25.175MHz then a 74HC4040 for the
rest of the bits.  Also need some latches to line them all up to the pixel clock.

The pixel cycle time is 39.7ns.  For the video RAM, there is for example the 32Kx8 71256SA12TPG with
12ns access/cycle time.  Two chips would be required, providing 8 bits per pixel.

New chip inventory:

```
  Counters:       (1) 74AC161
                  (1) 74HC4040
  Latches:        (3) 74AC574
  EEPROM:         (1) AT28C256
  VRAM:           (2) 71256SAxx
```

Much better.  Definitely worth a prototype build.
