# SigilentSDS5104X

## Remote Control

Used the Utility menu button to set the IP to a fixed 192.168.1.10.  The internet reveals that TCP port 5024 is used for SCIP.  Voila!

```
hazen:~$ telnet 192.168.1.10 5024
Trying 192.168.1.10...
Connected to 192.168.1.10.
Escape character is '^]'.
Welcome to the SCPI instrument 'Siglent SDS5104X'
>>*IDN?
Siglent Technologies,SDS5104X,SDS5XCAC3R0055,4.6.0.8.7R1B1
```

The remote control manual is [here](https://siglentna.com/USA_website_2014/Documents/Program_Material/SIGLENT_Digital_Oscilloscopes_Remote%20Control%20Manual.pdf).

Binary waveform data is sent as "definite length block data" which is defined as:

```
  # <num_digits> <byte_count> <data...> <NL> <END>
```

So for example, the waveform descriptor is 346 bytes:

```
cmd:  C1:WF? DESC
resp: C1:WF DESC,#9000000346WAVEDESCWAVEACEZ ��Siglent SDS�� �� ���������=�@���B[0VS_p�0 A�?�@��
```

Ignoring the funny characters, the "#9000000346" is the length of the response in bytes.

"DAT2" seems to contain the waveform data, so one can get the first 256 bytes with:

```
  WFSU NP,256
  C1:WF? DAT2
  C1:WF DAT2,#9000000256�������.....
```

