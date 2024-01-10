# Install and configure NFS and MySQL client on your Web Servers

## 1. Prepare the Web Servers
We need to make sure that our Web Servers can serve the same content from shared storage solutions, in our case – NFS Server and MySQL 
database.

You already know that one DB can be accessed for reads and writes by multiple clients. For storing shared files that our Web Servers 
will use – we will utilize NFS and mount previously created Logical Volume lv-apps to the folder where Apache stores files to be served to the users (/var/www).

This approach will make our Web Servers stateless, which means we will be able to add new ones or remove them whenever we need, and the integrity of the data (in the database and on NFS) will be preserved.

- Configure configure MySQL client (this step must be done on all three servers)
- Configure NFS client (this step must be done on all three servers)
- Install Apache and PHP 
- Deploy a Tooling application to our Web Servers into a shared NFS folder
- Configure the Web Servers to work with a single MySQL database

1. Configure MySQL client

- Set hostname

```
sudo hostnamectl set-hostname web-server 
```

- Install MySQL client and test that you can connect from your Web Server to your DB server by using mysql-client

```
sudo yum install mysql
sudo mysql -u admin -p -h <DB-Server-Private-IP-address>
```

- Verify if you can successfully execute SHOW DATABASES; command and see a list of existing databases.
```
SHOW DATABASES;
```

2. Configure NFS client

- Install NFS client

```
sudo yum install nfs-utils nfs4-acl-tools -y
```

-  Mount /var/www/ and target the NFS server’s export for apps

```
sudo mkdir /var/www
sudo mount -t nfs -o rw,nosuid <NFS-Server-Private-IP-Address>:/mnt/apps /var/www
```
- Backup and Mount /var/log by Creating /home/recovery/logs to store backup of log data

```
sudo mkdir -p /home/recovery/logs
```

- Use rsync utility to backup all the files in the log directory /var/log into /home/recovery/logs (This is required before mounting the file system)

```
sudo rsync -av /var/log/. /home/recovery/logs/
```

- Mount /var/log on lv-logs logical volume. (Note that all the existing data on /var/log will be deleted. That is why the above step is very important)
```
sudo mount -t nfs -o rw,nosuid <NFS-Server-Private-IP-Address>:/mnt/logs /var/log
```
- Restore log files back into /var/log directory

```
sudo rsync -av /home/recovery/logs/. /var/log
```

- Verify that NFS was mounted successfully by running df -h. 

```
df -h
```

- Make sure that the changes will persist on Web Server after reboot:

```
sudo vi /etc/fstab
```

add following line

```
<NFS-Server-Private-IP-Address>:/mnt/apps /var/www nfs defaults 0 0
<NFS-Server-Private-IP-Address>:/mnt/logs /var/log nfs defaults 0 0
```
- Test the configuration and reload the daemon

```
sudo mount -a
sudo systemctl daemon-reload
```

3. Install [Remi’s repository](http://www.servermom.org/how-to-enable-remi-repo-on-centos-7-6-and-5/2790/), Apache and PHP

```
sudo yum install httpd -y
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo dnf install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm
sudo dnf module reset php
sudo dnf module enable php:remi-7.4
sudo dnf install php php-opcache php-gd php-curl php-mysqlnd -y
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
sudo setsebool -P httpd_execmem 1
```
**Important Notice** 
Verify that Apache files and directories are available on the Web Server in /var/www and also on the NFS server in /mnt/apps. 
If you see the same files – it means NFS is mounted correctly. You can try to create a new file touch test.txt from one server and check if the same file is accessible from other Web Servers.