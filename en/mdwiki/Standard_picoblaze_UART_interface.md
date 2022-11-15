# Standard_picoblaze_UART_interface
To check out:
svn co https://edf.bu.edu/svn/edf/Dan/Nexys3/picoblazeUART/

Similar non-broken [link](http://gauss.bu.edu/redmine/projects/g2-quad-pulser/repository/g2-quad-pulser-firmware/show/ADC_Board/trunk/src/uC)

This page describes the EDF base UI for the Xilinx picoblaze micro-controller over UART.

[PicoblazeUartToDoList]

## CLI features
 * A prompt
 * Accept user input up to a max buffer size
 * Do sane things when the buffer size is reached.
 * Accept LF or CR to start a command
 * Accept backspace to modify the current line
 * Simple interface for adding new commands to CLI
 * Some basic tokenization of user input into scratchpad memory
 * There will be a VR command to list the version
 * There will be some kind of help command to list all commands.
----
## Code structure
### CLI
User input will be read from the UART and copied into the scratch pad memory from 0 up to CLI_BUFFER (= 32).

The current position in this CLI buffer will be stored at CLI_BUFFER in the scratchpad.

Every new character is checked for CR/LF or backspace.

If it is CR/LF, then we parse the command.

### parsing
First the command parser will look for a known command at the start of the string.

Once found, the end of the command position is passed to the tokenizer to look for arguments
The tokenizer processes the command line and looks for up to 4 32bit hex values separated by non-hex characters

These values will be stored in the scratch memory at
 * CLI_WORD1 32 bits of argument
 * CLI_WORD2 32 bits
 * CLI_WORD3 32 bits
 * CLI_WORD4 32 bits
 * CLI_COUNT count of validly parsed 32bit words
 * CLI_WORD1_POS position in the buffer of the first parsed argument
 * CLI_WORD2-4_pos same as above
 * CLI_WORDN_SIZE (1byte) Count of the nibbles in the command line argument

At this point, the command is called.

An example of parsing more than 4 arguments can be found in the CMD_multiarg command.
----
## Files

### CLI.psm
 * Stores main CLI loop, command parsing code
 * calls cmds.psm to process newly parsed commands
### Cmds.psm
 * Determines which function to call, parse command line options and call the function
### Cmd_names.psm
 * Stores the command names
 * Stores the function used by cmds.psm to find and call functions
### Cmds_A-Z.psm
 * stores code for commands starting with that letter (ex. cmds_R.psm would have the code for the RamWrite "RW" command)
### Utils.psm
 * Hex-to-bin and Bin-to-hex code
 * EOL function
### UART.psm
 * stores uart read/write, blocking, and status code.
### "other".psm
 * ex: ram.psm
 * holds code for functions associated with some interface (ex: RAM,FLASH)
 * include these in the cli.psm
----
## Scratchpad map
<img src="picoblazeScratchRam_new.png">
