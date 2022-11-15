# ApolloIPMC

## Programming the IPMC

SVN: http://gauss.bu.edu/svn/common-atca-blade.firmware/ipmc/

IPMC information can be found side-by-side with the code, in the README file.

## Possible MAC Addresses

We were assigned a block of MAC addresses as follows for another project (Super-K).  In the Super-K application, bits 0-1 were always zeros, bits 2-23 were taken from a serial number chip.

`00-50-51-xx-xx-xx`

We propose to use the address range below for APOLLO (16k addresses):

`00-50-51-ff-00-00` to `00-50-51-ff-ff-ff`

Or, in more details:

00-50-51-FF-YX-XX

Y: IPMC or Zynq ports (0000, 0001, 0010, 0011, as explained below)

XXX: Number of the Service module

I further propose to assign 4 addresses to each blade, with the low 2 bits as follows:

```
 00 - IPMC
 01 - Zynq port facing Ethernet switch
 10 - reserved for 2nd Zynq port
 11 - reserved
```

Some examples:

```
IPMC of the SM1: 00-50-51-FF-00-01
ZYNQ port facing Eth sw of the SM1: 00-50-51-FF-10-01
```

```
IPMC of the SM2: 00-50-51-FF-00-02
ZYNQ port facing Eth sw of the SM2: 00-50-51-FF-10-02
```

```
IPMC of the SM15: 00-50-51-FF-00-0F
ZYNQ port facing Eth sw of the SM15: 00-50-51-FF-10-0F
```


