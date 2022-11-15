# IPBusUserNotes
## Installing uHal/IPBus in 2021

Of course things have changed.  See:

https://ipbus.web.cern.ch/doc/user/html/software/install/compile.html

There was some issue with broken symlinks in `/usr/lib/erlang/man/man1`.  Find them with:

```
  $ find ./ -type l -exec file {} \; |grep broken
```

Then remove them by hand.

Dan says one must use the following extra flags for things to work with BUTool:

```
  $ make -j 6 LDFLAGS="-Wl,--no-as-needed"
```

## Installing uHal/IPBus in 2020

I'm working to install everything on Ubuntu 20.04.  Seems straightforward (ha!)

```
  $ sudo apt install python3-pip
  $ export PATH=${PATH}:/home/hazen/.local/bin
  $ sudo apt-get install make erlang g++ libboost-all-dev libpugixml-dev python-all-dev
  $ git clone --depth=1 -b v2.7.9 https://github.com/ipbus/ipbus-software.git
  $ cd ipbus-software
  $ make |& tee build_log.txt  # (note to self:  use '-j 8' next time!)
```

OK, it's failing a lot with 'python not found'.

```
  $ which python
  $ # hmm, no answer
  $ sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1
  $ sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 2
  $ which python
  /usr/bin/python   # ok, good
  $ python --version
  Python 3.8.5
```

Re-run make, all seemingly good now.

```
  $ sudo make install
```



## Older Notes (maybe still relevant)

The uHAL / IPBus software+firmware package [(source)](https://ipbus.web.cern.ch/ipbus/) provides a convenient way to read/write registers and memories on a hardware device.  The original use case was to access programmable logic (FPGAs) on a board connected to a computer over Ethernet.

The software component (uHAL) queues requested operations (_read_ and _write_) in a "packet" which is transmitted to the hardware device when a _dispatch_ function is called.  The firmware component (IPBus) parses the packet and performs the requested read and write operations in a logical 32-bit address space using a proprietary local bus (similar to Wishbone).

A key feature of the package is the _address table_ which is represented by one or more XML files.  Typically an address table names registers as in the following example:
```
  <node id="REG" address="0x0001" permission="rw">
    <node id="REG_TOP" mask="0xffff0000"/>
    <node id="REG_BOT" mask="0x0000ffff"/>
  </node>
  <node id="RESETS" address="0x0002" permission="w">
    <node id="RST_ALL" mask="1"/>
    <node id="RST_LINKS" mask="2"/>
  </node>
```

A bit of sample code taken from the tutorial illustrates the key points:
```
ConnectionManager manager("file://path/to/connections.xml");
HwInterface hw = manager.getDevice("dummy.udp.0");

//write 1 in the address 0x0001
hw.getNode ("REG").write(1);

//read back
ValWord< uint32_t > reg = hw.getNode ("REG").read();

//send the IPbus transactions
hw.dispatch();

std::cout << "REG = " << reg.value() << std::endl;
```

This code illustrates the typical use case, where one performs reads/writes on entire 32-bit registers using names from the address table.  In addition, the address table can contain a mask, which can be used to read or write subsets of bits from a register.  _However_ one must be careful, as the protocol only supports full 32-bit reads and writes.  Writing a masked value actually causes a read/modify/write which may not be what is desired.

Often we find that we want to do other things which are not trivially supported by uHAL, such as:
 * Read/write to numeric addresses
 * Read/write to an offset within a named region
 * Write a fixed set of bits to a register with no read

All these things can be accomplished, but require some cleverness.  To access the numeric address of a register, one can use the following code snippet:
```
 addr = hw.getNode( "rx_buffer").getAddress();
```
To access an offset from a named register, one must resort to some slightly more intricate code:
```
  val = hw.getClient().read( hw.getNode("rx_buffer").getAddress() + offset);
```

To write a single bit to e.g. a reset register as shown in the address table above, one can use the following:
```
  mask = hw.getNode( "RST_ALL"). getMask();
  hw.getClient().write( hw.getNode("RST_ALL").getAddress(), mask);
```

