# PicozedZynqSoftware
When you boot up the Picozed you have two possible ways to communicate:\\
Either a) Use a serial terminal (such as !GtkTerm) with the baud set to 115200\\
or b) SSH in -- but if you SSH in then you have to wait for the full boot process to take place.\\\\

The username and password on the board are root.\\
You will need to mount /rootfs:
```
  # mkdir /rootfs
  # mount /dev/mmcblk0p2 /rootfs
```

The command you need is in /roofs/ and is called adc, so you can run it from anywhere as /rootfs/adc or cd into that directory and run ./adc\\
adc has a whole host of possible parameters, but the two you'll use the most are --start and -F.\\\\

--start will automagically align all the channels it can, then put the adc into data collection mode so you can start reading out from the analog inputs. You should do this before anything else.\\
-F will silently empty the fifo, fill the fifo back up, then read out the contents of the fifo to you. This is the simplest way to gather data.\\
-v is a flag for verbose mode, it will cause the program to print out what its doing to the console. Its helpful for debugging, not much else.\\\\

-C is the flag for writing registers.\\
-a is the parameter for the address you're writing to.\\
-r is the parameter for the data of the register you're writing.\\
A full command with these would look like: ./adc -C -a 0x00 -r 0x000.\\
-p are presets for different outputs of the adc.\\
./adc -C -p 0 puts the adc into normal data collection mode.\\
./adc -C -p 1 puts the adc into sync mode (0xFC0).\\
./adc -C -p 2 puts the adc into deskew mode (0xAAA).\\
./adc -C -p 3 puts the adc into all ones mode (0xFFF).\\\\

-f will only read out the contents of the fifo, it does not automatically fill it first.\\
--min will dictate the first entry printed out to the console when used with -f.\\
 --max will dictate the last entry printed out to the console when used with -f.\\\\

-z is manual control of the write enable on the fifo\\
./adc -z 0 stops the fifo from reading, while -z 1 will start it reading again.\\\\

-b allows you to select a channel 0 to 3 to bitslip, while\\
-s allows you to select which half of that channel you want to bitslip (1 for the bottom half, 2 for the top half, 3 for both).\\\\

--byte allows you to change the mode from BITwise mode (1) and BYTEwise mode (0). I recommend keeping it in BITwise mode. --start does this for you automatically.\\\\

Finally,\\
-?, --help, --usage will all print out a help table that shows an abbreviated version of this.\\\\
