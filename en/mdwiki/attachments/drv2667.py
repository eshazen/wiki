# Inject this code into whichever script is running the experiment

"""
 if using set_analog(), be sure to use turn_off() following waveform; ex:
     analog_con(gain)
     #send analog signal to DRV2667
     turn_off()
 if using set_digital():
     set_digital(amp, freq, dur, env, gain)
"""

import smbus2 #

drv = smbus2.SMBus(1) # driver will be on i2c port 1.

DRV_ADDRESS = 0x59 # DRV2667 address
_ANALOG_GAIN_ = [0x04, 0x05, 0x06, 0x07] # for gains of 28.8 dB, 34.8 dB, 38.4 dB, 40.7 dB
_DIGITAL_GAIN_ = [0x00, 0x01, 0x02, 0x03]

def set_digital(amp = 0x80, freq = 0x19, dur = 0x05, env = 0x00, gain = 0):
    """
    Outputs a digitally synthesized waveform using input parameters
    ----------
    amp : 0-255 (hex or decimal); amplitude of waveform
    freq : 0-255 (hex or decimal); frequency of waveform, this will be multiples of 7.8125 Hz
    dur : 0-255 (hex or decimal); number of cycles of waveform
    env : 0-255 (hex or decimal); envelope of waveform
    gain : 0-4; index for _DIGITAL_GAIN_ to use
    """
    # Control
    drv.write_byte_data(DRV_ADDRESS, 0x02, 0x00) # Write STANDBY to off, meaning writes are enabled HL
    drv.write_byte_data(DRV_ADDRESS, 0x01, _DIGITAL_GAIN_[gain]) # Writes gain value of 50 V; should write bits 6:3 as all high for CHIPID HL
    drv.write_byte_data(DRV_ADDRESS, 0x03, 0x01) # Upon seeing of the GO bit, play waveform ID 0x01 HL
    drv.write_byte_data(DRV_ADDRESS, 0x04, 0x00) # Writes null to 0x04 s.t. after 0x01 piezo stops  HL

    # Header
    drv.write_byte_data(DRV_ADDRESS, 0xFF, 0x01) # Opens RAM for writing                            HL
    drv.write_byte_data(DRV_ADDRESS, 0x00, 0x05) # Declares header to be size 5*5+1=26              HL
    drv.write_byte_data(DRV_ADDRESS, 0x01, 0x80) # Start address upper byte, basically mode + page
    drv.write_byte_data(DRV_ADDRESS, 0x02, 0x06) # Start address lower byte, start position on page
    drv.write_byte_data(DRV_ADDRESS, 0x03, 0x00) # Stop address upper byte, page number
    drv.write_byte_data(DRV_ADDRESS, 0x04, 0x09) # Stop address lower byte, end position on page
    drv.write_byte_data(DRV_ADDRESS, 0x05, 0x01) # Repeat number for waveform

    # Data
    drv.write_byte_data(DRV_ADDRESS, 0x06, amp)  # RAM waveforms stored in order Amplitude          HL
    drv.write_byte_data(DRV_ADDRESS, 0x07, freq) #                               Frequency          HL
    drv.write_byte_data(DRV_ADDRESS, 0x08, dur)  #                               Duration           HL
    drv.write_byte_data(DRV_ADDRESS, 0x09, env)  #                               Envelope           HL

    # Control
    drv.write_byte_data(DRV_ADDRESS, 0xFF, 0x00) # Exits RAM writing mode and sets to control mode  HL
    drv.write_byte_data(DRV_ADDRESS, 0x02, 0x01) # Writes 0x01 to ctrl; boost off and writes GO hi  HL

def set_analog(gain = 0):
    """
    Enables analog input to DRV2667 by activating the boost converter and amplifier
    Parameters
    ----------
    gain : 0-4; index for _ANALOG_GAIN_ to use
    """
    drv.write_byte_data(DRV_ADDRESS,0x02, 0x00) #Device out of standby
    drv.write_byte_data(DRV_ADDRESS, 0x01, _ANALOG_GAIN_[gain]) # Set analog input, with gain
    drv.write_byte_data(DRV_ADDRESS, 0x02, 0x03) # EN_OVERRIDE BIT to boost & amp active

def turn_off():
    """
    Turns off DRV2667 - use after stimulus is given to avoid overheating on breakout board.
    """
    drv.write_byte_data(DRV_ADDRESS,0x02, 0x00)  # Should write 0x40 to turn standby off            HL
