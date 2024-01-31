# Configure NFS Server 

1. Use lsblk command to inspect what block devices are attached to the server. Notice names of your newly created devices. All devices in Linux reside in /dev/ directory. Inspect it with ls /dev/ and make sure you see all 3 newly created block devices there – their  names will likely be xvdf, xvdh, xvdg.

```
lsblk
```

Outcome 
```
[ec2-user@ip-172-31-59-249 ~]$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
xvda    202:0    0   10G  0 disk
├─xvda1 202:1    0    1M  0 part
├─xvda2 202:2    0  200M  0 part /boot/efi
├─xvda3 202:3    0  600M  0 part /boot
└─xvda4 202:4    0  9.2G  0 part /
xvdf    202:80   0   10G  0 disk
xvdg    202:96   0   10G  0 disk
xvdh    202:112  0   10G  0 disk
```

2. To create partitions Use gdisk utility to create a single partition on each of the 3 disks

After launching gdisk, you can use the 'n' command to create a new partition and follow the prompts to set the partition size, type, etc. After defining your partitions, don't forget to use the 'w' command to write the changes to the disk.

```
sudo gdisk /dev/xvdf
```
Example: 
```
Command (? for help): n
Partition number (1-128, default 1): 1
First sector (34-20971486, default = 2048): [press Enter]
Last sector (2048-20971486, default = 20971486): [press Enter]
Hex code or GUID (L to show codes, Enter = 8300): [press Enter]

Command (? for help): w

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): y
```

This will create a new partition on /dev/xvdf. After this, you can format the partition and mount it as needed.
Now,  your changes has been configured succesfuly, exit out of the gdisk console.

3. Create partitions for other disks /dev/xvdh and /dev/xvdg.

```
sudo gdisk /dev/xvdh
```

```
sudo gdisk /dev/xvdg
```

4. Use lsblk utility to view the newly configured partition on each of the 3 disks.

```
lsblk
```

Outcome 
```
[ec2-user@ip-172-31-59-249 ~]$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
xvda    202:0    0   10G  0 disk
├─xvda1 202:1    0    1M  0 part
├─xvda2 202:2    0  200M  0 part /boot/efi
├─xvda3 202:3    0  600M  0 part /boot
└─xvda4 202:4    0  9.2G  0 part /
xvdf    202:80   0   10G  0 disk
└─xvdf1 202:81   0   10G  0 part
xvdg    202:96   0   10G  0 disk
└─xvdg1 202:97   0   10G  0 part
xvdh    202:112  0   10G  0 disk
└─xvdh1 202:113  0   10G  0 part
```

5. Install lvm2 package. 

```
sudo yum install lvm2 -y 
```
6. Run sudo lvmdiskscan command to check for available partitions.

```
sudo lvmdiskscan
```

7. Use pvcreate utility to mark each of 3 disks as physical volumes (PVs) to be used by LVM

```
sudo pvcreate /dev/xvdf1
sudo pvcreate /dev/xvdg1
sudo pvcreate /dev/xvdh1
```

8. Verify that your Physical volume has been created successfully

```
 sudo pvs
```
Outcome
```
[ec2-user@ip-172-31-59-249 ~]$ sudo pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/xvdf1    lvm2 ---  <10.00g <10.00g
  /dev/xvdg1    lvm2 ---  <10.00g <10.00g
  /dev/xvdh1    lvm2 ---  <10.00g <10.00g
```

9. Use vgcreate utility to add all 3 PVs to a volume group (VG). Name the VG webdata-vg

```
sudo vgcreate webdata-vg /dev/xvdh1 /dev/xvdg1 /dev/xvdf1
```

10. Verify that your VG has been created successfully by running 

```
sudo vgs
```
outcome
```
[ec2-user@ip-172-31-59-249 ~]$ sudo vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  webdata-vg   3   0   0 wz--n- <29.99g <29.99g
```

11. Use lvcreate utility to create 2 logical volumes. apps-lv (Use half of the PV size), and logs-lv Use the remaining space of
 the PV size. NOTE: apps-lv will be used to store data for the Website while, logs-lv will be used to store data for logs.
 
```
sudo lvcreate -n lv-apps -L 9G webdata-vg
sudo lvcreate -n lv-logs -L 9G webdata-vg
sudo lvcreate -n lv-opt -L 9G webdata-vg
```

12. Verify that your Logical Volume has been created successfully by running 

```
sudo lvs
```

```
  LV      VG         Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv-apps webdata-vg -wi-a----- 9.00g                                                    
  lv-logs webdata-vg -wi-a----- 9.00g                                                    
  lv-opt  webdata-vg -wi-a----- 9.00g 
```


13. Verify the entire setup

```
sudo vgdisplay -v #view complete setup - VG, PV, and LV
sudo lsblk 
```

14. Use mkfs.xfs to format the logical volumes with xfs filesystem

```
sudo mkfs -t xfs /dev/webdata-vg/lv-apps
sudo mkfs -t xfs /dev/webdata-vg/lv-logs
sudo mkfs -t xfs /dev/webdata-vg/lv-opt

```

15. - Create mount points on /mnt directory for the logical volumes as follow:

Mount lv-apps on /mnt/apps – To be used by webservers
Mount lv-logs on /mnt/logs – To be used by webserver logs
Mount lv-opt on /mnt/opt – To be used by Jenkins server in the next Project

```
sudo mkdir /mnt/apps 
sudo mkdir /mnt/logs 
sudo mkdir /mnt/opt
```

16. Mount lv-apps on /mnt/apps – To be used by webservers


```
sudo mount /dev/webdata-vg/lv-apps /mnt/apps 
```

17. Mount lv-logs on /mnt/logs – To be used by webserver logs

```
sudo mount /dev/webdata-vg/lv-logs /mnt/logs
```

18. Mount lv-opt on /mnt/opt – To be used by webserver logs

```
sudo mount /dev/webdata-vg/lv-opt /mnt/opt
```

19. Update /etc/fstab file so that the mount configuration will persist after restart of the server.

-  The UUID of the device will be used to update the /etc/fstab file;

```
sudo blkid
```
Outcome:
```
[ec2-user@ip-172-31-59-58 ~]$ sudo blkid
/dev/xvda4: LABEL="root" UUID="2cfdcca4-d3e3-40cb-b58e-0bed76bdceec" /TYPE="xfs" PARTUUID="6264d520-3fb9-423f-8ab8-7a0a8e3d3562" /
/dev/mapper/webdata--vg-logs--lv: UUID="f3aeed0e-1f5b-4994-9c17-a95ae7984404" /

/dev/xvdh1: UUID="nOMyfQ-GL3z-O2Ky-O9FJ-KyC6-SX0I-jCnYEi" TYPE="LVM2_member" PARTLABEL="Linux filesystem" PARTUUID="cfa16d1a-aba0-4958-9db5-148a87c9a830"

/dev/xvdf1: UUID="Ut3SFy-M05A-fK0Y-m3HJ-hcXG-l6Ow-4nJUkz" TYPE="LVM2_member" PARTLABEL="Linux filesystem" PARTUUID="461cfe09-28f4-49d5-b670-b3eb568dcafe"
/dev/mapper/webdata--vg-apps--lv: UUID="a8a79107-1ae6-4c20-bb5b-5e9db101b724" TYPE="xfs"

/dev/xvdg1: UUID="IKgMpe-tdgd-Nghl-LzxM-IHRU-ipwp-XzMFoG" TYPE="LVM2_member" PARTLABEL="Linux filesystem" PARTUUID="ad9b4189-f2d7-4f6f-acc1-db7afe92a96c"
```
Copy the the UUID from the following and add to /etc/fstab file
/dev/mapper/webdata--vg-lv--logs: UUID="e463452f-de1f-417c-a479-47ffa83517ad" TYPE="xfs"
/dev/mapper/webdata--vg-lv--apps: UUID="5d1789ef-5a55-4aa8-8ea9-fbb714640984" TYPE="xfs"
/dev/mapper/webdata--vg-lv--opt: UUID="1ba6954f-743e-40b8-be67-6de5ec6c5180" TYPE="xfs"


```
sudo vi /etc/fstab
```
Example 
```
# worpress 
UUID=f3aeed0e-1f5b-4994-9c17-a95ae7984404  /mnt/logs  default 0 0
UUID=a8a79107-1ae6-4c20-bb5b-5e9db101b724  /mnt/apps  default 0 0
UUID=a9u7050n-1ar5-4887-dd9a-5e6264d520    /mnt/opt   default 0 0
```

Note: Update /etc/fstab in this format using your own UUID and rememeber to remove the leading and ending quotes.


20. Test the configuration and reload the daemon

```
sudo mount -a
sudo systemctl daemon-reload
```

21. Verify your setup by running df -h, output must look like this:

```
df -h
```

22.  Install NFS server 


- Install NFS server, configure it to start on reboot and make sure it is up and running

```
sudo yum -y update
sudo yum install nfs-utils -y
sudo systemctl start nfs-server.service
sudo systemctl enable nfs-server.service
sudo systemctl status nfs-server.service
```

Make sure we set up permission that will allow our Web servers to read, write and execute files on NFS:

```
sudo chown -R nobody: /mnt/apps
sudo chown -R nobody: /mnt/logs
sudo chown -R nobody: /mnt/opt
```

```
sudo chmod -R 777 /mnt/apps
sudo chmod -R 777 /mnt/logs
sudo chmod -R 777 /mnt/opt
```
```
sudo systemctl restart nfs-server.service
```

verify 
```
ll /mnt
```
Outcome 
```
total 0
drwxr-xr-x. 2 nobody nobody 6 Jan  8 02:37 apps
drwxr-xr-x. 2 nobody nobody 6 Jan  8 02:37 logs
drwxr-xr-x. 2 nobody nobody 6 Jan  8 02:37 opt
```

Configure access to NFS for clients within the same subnet (example of Subnet CIDR – 172.31.32.0/20 ):

```
sudo vi /etc/exports
```
```
/mnt/apps <Subnet-CIDR>(rw,sync,no_all_squash,no_root_squash)
/mnt/logs <Subnet-CIDR>(rw,sync,no_all_squash,no_root_squash)
/mnt/opt <Subnet-CIDR>(rw,sync,no_all_squash,no_root_squash)

Esc + :wq!
```
```
sudo exportfs -arv
```

6. Check which port is used by NFS and open it using Security Groups (add new Inbound Rule)

```
rpcinfo -p | grep nfs
```
Outcome

    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100227    3   tcp   2049  nfs_acl


Important note: In order for NFS server to be accessible from your client, you must also open following ports: TCP 111, UDP 111, UDP 2049


<img width="1404" alt="Screenshot 2024-01-07 at 23 14 10" src="https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/d569d677-3ad4-4da7-bfaf-9a42ef041479">



