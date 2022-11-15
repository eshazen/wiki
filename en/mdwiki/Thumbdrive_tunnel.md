# Thumbdrive_tunnel
### Description
The purpose of this project is to give us the ability to bring a bootable USB thumb drive to a computer and boot up a secure Linux system that we can remotely control from ohm.
This is done by modifying a read-only "kubuntu install" distro so that it boots up, installs a preselected group of utilities and then calls home to ohm with an ssh tunnel.

### Building the initial thumb drive
Eric?

### Modification Procedure
#### squash fs
First we need to extract the read only part of the filesystem and make some modifications.
 * Locate the image (in /casper/filesystem.squashfs) and copy that to a local drive.
 * Go into a working directory to put the extracted filesytem
 * Run "sudo unsquashfs  filesystem.squashfs" to extract the filesystem in the "squashfs-root" directory in the current path. (This MUST be done as root to assure the file permissions are correct!)
 * Now you need to set the system to auto run a local script we control.  This is done through "extractedsystem/etc/rc.local" (Make sure that when you edit this, you don't change the permissions!!!)
 * The first thing we add to rc.local is the command to mount a read/write partition (labeled as WORK3.4G in this case) with the command "mount -L WORK3.4G /work"
 * Then we run a script on that newly mounted partition to do the rest of our work: "/work/startup.sh"
    Example rc.local
    {{{
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
mount -L WORK3.4G /work
/work/startup.sh
exit 0
    }}}

 * To allow for the tunneling, we need to setup a use with ssh keys for keyless login.  This should be done for a non-root user,but for now we use the fixed root account.
 * Go into the extracted "root" directory and fill a .ssh directory with some correctly generated keys (ssh-keygen with no passphrase).
 * Make sure you add the public key to the machine you want to tunnel to with the "ssh-copy" command (tunnel@ohm.bu.edu in our case)
 * With this done, we have the basics we need and can re-compress the filesystem.
 * (Again as root) Run "sudo mksquashfs squashfs-root/ filesystem.squashfs -noappend -always-use-fragments" to make the filesystem.squashfs file.
 * Pay attention to the output because we need to make a "filesystem.size" file with the uncompressed size of the filesystem and this is printed out by mksquashfs.
 * Now write these two files (filesystem.squashfs and filesystem.size) back to the thumb drive (/casper/filesystem.squashfs)
 * With this done, you can now boot up this thumb drive on a computer.

#### startup.sh
Now we need to fill startup.sh with the commands we want executed on boot up.

Our example will install the ssh server, setup a iptables firewall and then setup a reverse tunnel back to ohm.bu.edu for remote control.

Example startup.sh

```
#!/bin/bash
#DO NOT MODIFY THIS IF YOU DON"T KNOW WHAT YOU ARE DOING!
#CONTACT DAN GASTLER dgastler@bu.edu

start_time=$(date +%s)
echo $start_time > /work/.last_start
#setup IPTables to block incomming ssh on eth0
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 80 -j DROP
iptables -A INPUT -i eth0 -p tcp --dport 22 -j DROP


#install sshd
apt-get install -y openssh-server
/etc/init.d/ssh start

/work/reverse_tunnel.sh &
```
 * TODO: This script should be updated with a more complete iptables firewall
 * To have other software installed on boot, add other lines like the #install sshd line (don't forget the "-y" otherwise it will hang on boot)
 * reverse_tunnel.sh
    {{{
#!/bin/bash
while(true)
do
    #setup a tunnel on ohm.bu.edu
    start_time=$(date +%s)
    ssh -v -N -R 5678:localhost:22 tunnel@ohm.bu.edu >& /var/log/tunnel.$start_time.log
    sleep 3;
done
    }}}
  *
