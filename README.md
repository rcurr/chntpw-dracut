chntpw dracut module
====================

This is a dracut module to create a ramdisk image with the chntpw tools. This was created to produce a netboot image with 
chntpw that would support newer hardware.

Some inspiration is taken from the Bootable CD Image over at [chntpw](http://www.chntpw.com)

Requirements
------------
The following packages should be installed:

 - chntpw
 - dracut
 - ntfs-3g
 - kbd

Example Usage
-------------

Create the ramdisk:

```
dracut  -m 'chntpw' -o systemd initrd.gz $(uname -r)
```

Boot using your kernel and initrd using your method of choice. One method is creating a boot image and using syslinux:

Make a disk image large enough to fit your kernel and initrd:

```
qemu-img create ./myimage.img 50M
```

Add a partition to the image, then mkdosfs the partition. Install syslinux and add an mbr:

```
syslinux -i $partition
install-mbr $file
```

Then add syslinux.cfg:

```
DEFAULT chntpw

TIMEOUT 3
PROMPT 1

LABEL chntpw
    KERNEL vmlinuz
    # Lie to dracut about root
    APPEND initrd=initrd.gz root=/dev/null rootok=1
```
