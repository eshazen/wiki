# MakingBootableCard

This recipe seems to work:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841655/Prepare+Boot+Medium

My version:

Find the device name.  For my Lenovo laptop with built-in card reader, it's `/dev/mmcblk0`.
Partitions are `/dev/mmcblk0p1` etc.  Unmount the card if mounted.

*Erase the first sector*

```
  $ dd if=/dev/zero of=/dev/xxxx bs=1024 count=1
```

'''Calculate `new_cylinders`

```
  $ fdisk -l /dev/xxxx

  Disk /dev/sdb: 8068 MB, 8068792320 bytes
  249 heads, 62 sectors/track, 1020 cylinders, total 15759360 sectors
  Units = sectors of 1 * 512 = 512 bytes
  Sector size (logical/physical): 512 bytes / 512 bytes
  I/O size (minimum/optimal): 512 bytes / 512 bytes
  Disk identifier: 0x00000000

  Disk /dev/sdb doesn't contain a valid partition table
```

Note the size in bytes (i.e. 8068792320).  Calculate:

`new_cylinders = size_in_bytes/8225280`

(round down).  For this 8Gb example the result is 980.

*Partition the card*

Creat one 200MB FAT32 partition and the remainder as ext2
(ext4 should work too).  First, have to set CHS correctly.

```
  $ fdisk /dev/xxxx
```

(delete any existing partitions; shouldn't be any)

```
  Command (m for help): x
  Expert command (m for help): h
  Number of heads (1-256, default 30): 255
  Expert command (m for help): s
  Number of sectors (1-63, default 29): 63
  Expert command (m for help): c
  Number of cylinders (1-1048576, default 2286): <new_cylinders calculated from above>
  Expert command (m for help): r
```

Now create partitions:

```
Command (m for help): n
Partition type:
 p primary (0 primary, 0 extended, 4 free)
 e extended
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-15759359, default 2048):
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-15759359, default 15759359): +200M

Command (m for help): n
Partition type:
 p primary (1 primary, 0 extended, 3 free)
 e extended
Select (default p): p
Partition number (1-4, default 2): 2
First sector (411648-15759359, default 411648):
Using default value 411648
Last sector, +sectors or +size{K,M,G} (411648-15759359, default 15759359):
Using default value 15759359
```

Set bootable flag, partition types:

```
Command (m for help): a
Partition number (1-4): 1

Command (m for help): t
Partition number (1-4): 1
Hex code (type L to list codes): c
Changed system type of partition 1 to c (W95 FAT32 (LBA))

Command (m for help): t
Partition number (1-4): 2
Hex code (type L to list codes): 83
```

Check table and write changes:

```
Command (m for help): p

Disk /dev/sdb: 8068 MB, 8068792320 bytes
249 heads, 62 sectors/track, 1020 cylinders, total 15759360 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x920c958b

 Device Boot Start End Blocks Id System
/dev/sdb1 * 2048 411647 204800 c W95 FAT32 (LBA)
/dev/sdb2 411648 15759359 7673856 83 Linux

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: If you have created or modified any DOS 6.x
partitions, please see the fdisk manual page for additional
information.
Syncing disks.
```

*Create filesystems*

```
mkfs.vfat -F 32 -n boot /dev/sdX1
mkfs.ext4 -L root /dev/sdX2
```

*Mount boot partition*

```
mkdir -p /mnt/boot
mount /dev/sdX1 /mnt/boot
```

*Copy required files*
```
cp BOOT.BIN /mnt/boot
cp image.ub /mnt/boot
umount /mnt/boot
```
