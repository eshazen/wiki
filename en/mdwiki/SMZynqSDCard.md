# SMZynqSDCard
use dmesg to find which device your SD card comes up as.

Mine comes up as:
```
  [6629320.914826] sd 8:0:0:0: Attached scsi generic sg7 type 0
  [6629321.237941] sd 8:0:0:0: [sdg] 15523840 512-byte logical blocks: (7.95 GB/7.40 GiB)
  [6629321.239081] sd 8:0:0:0: [sdg] Write Protect is off
  [6629321.239084] sd 8:0:0:0: [sdg] Mode Sense: 23 00 00 00
  [6629321.240068] sd 8:0:0:0: [sdg] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
  [6629321.248095]  sdg: sdg1 sdg2
  [6629321.252195] sd 8:0:0:0: [sdg] Attached SCSI removable disk
```
Zero out the first sector + more to be safe (where xxx is sdg from above)
```
  sudo dd if=/dev/zero of=/dev/xxx bs=1M count=10
```
Run fdisk
```
  sudo fdisk /dev/sdg
```

create partition 1
```
  Command (m for help): n
  Partition type
     p   primary (0 primary, 0 extended, 4 free)
     e   extended (container for logical partitions)
  Select (default p): p
  Partition number (1-4, default 1): 1
  First sector (2048-15523839, default 2048):
  Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-15523839, default 15523839): +1G

  Created a new partition 1 of type 'Linux' and of size 1 GiB.

  Command (m for help):
```

create partition 2
```
  Command (m for help): n
  Partition type
     p   primary (1 primary, 0 extended, 3 free)
     e   extended (container for logical partitions)
  Select (default p): p
  Partition number (2-4, default 2): 2
  First sector (2099200-15523839, default 2099200):
  Last sector, +/-sectors or +/-size{K,M,G,T,P} (2099200-15523839, default 15523839):

  Created a new partition 2 of type 'Linux' and of size 6.4 GiB.

  Command (m for help):
```

Set partition 1 to be bootable
```
  Command (m for help): a
  Partition number (1,2, default 2): 1

  The bootable flag on partition 1 is enabled now.

  Command (m for help):
```

set parition 1 to be vfat
```
  Command (m for help): t
  Partition number (1,2, default 2): 1
  Hex code (type L to list all codes): c

  Changed type of partition 'Linux' to 'W95 FAT32 (LBA)'.

  Command (m for help):
```
set partition 2 to be linux
```
  Command (m for help): t
  Partition number (1,2, default 2): 2
  Hex code (type L to list all codes): 83

  Changed type of partition 'Linux' to 'Linux'.

  Command (m for help):
```
Write partition table
```
  Command (m for help): t
  Partition number (1,2, default 2): 2
  Hex code (type L to list all codes): 83

  Changed type of partition 'Linux' to 'Linux'.
```
Format first partition
```
  $ sudo mkfs.vfat -F 32 -n BOOT /dev/sdg1
  mkfs.fat 4.1 (2017-01-24)
```
Format the second partition
```
  $ sudo mkfs.ext4 -L WORK /dev/sdg2
  mke2fs 1.44.5 (15-Dec-2018)
  Creating filesystem with 1678080 4k blocks and 420160 inodes
  Filesystem UUID: fc3e2979-b0c9-4ce8-917a-82685ce307db
  Superblock backups stored on blocks:
  	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632

  Allocating group tables: done
  Writing inode tables: done
  Creating journal (16384 blocks): done
  Writing superblocks and filesystem accounting information: done
```
Extract the filesystem files

mount partition 1 and make sure it is clear
```
  $sudo mount /dev/sdg1 /mnt
  $ls /mnt
```

Copy fw files to that partition, sync and umount
```
  $ sudo cp -r path/to/fw/* /mnt/
  $ ls /mnt/
  BOOT.BIN  image.ub  README.txt  startup.sh
  $ sudo bash -c "echo "00:50:51:FF:20:08" > /mnt/mac.dat"
  $ sync
  $ sudo umount /mnt/
```
mount partition 2 and make sure it is clear (except lost+found)
```
  $sudo mount /dev/sdg2 /mnt
  $ls /mnt
  lost+found
```
Copy work files to that partition, sync and umount
```
  $ sudo cp -r path/to/work/* /mnt/
  $ ls /mnt/
  address_apollo.xml  bin  connections.xml  env.sh  lib  lost+found
  $ sync
  $ sudo umount /mnt/
```
