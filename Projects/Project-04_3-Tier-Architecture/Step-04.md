
## 1. Configure the Web Servers to communicate with NFS Server

We need to make sure that our Web Servers can serve the same content from shared storage solutions, in our case – NFS Server and MySQL 
database. we will utilize NFS and mount previously created Logical Volume lv-apps to the folder where Apache stores files to be served to the users (/var/www).

- Configure NFS client (this step must be done on all three servers)
- Install Apache and PHP 
- Deploy an application to our Web Servers into a shared NFS folder

### Define variables
NFS_SERVER="<NFS-Server-Private-IP-Address>"
DB_NAME="<DB_NAME>"
DB_USER="<DB_USER>"
DB_PASSWORD="<DB_PASSWORD>"
DB_HOST="<DB_HOST>"
SERVER_HOSTNAME="<SERVER_HOSTNAME>"

### Step 0: Update Server and Set Hostname
```sh
sudo yum update -y
sudo hostnamectl set-hostname $SERVER_HOSTNAME
```

### Step 1: Install NFS Client git and Wget
```sh
sudo yum install nfs-utils nfs4-acl-tools wget git -y
```

### Step 2: Install Apache, PHP, Required Repositories, and MySQL Client
```sh
sudo yum install httpd mysql -y
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo dnf install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
sudo dnf module reset php 
sudo dnf module enable php:remi-7.4 
sudo dnf install php php-opcache php-gd php-curl php-mysqlnd -y
```

### Step 3: Start and Enable PHP-FPM
```
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
sudo systemctl start httpd
sudo systemctl enable httpd
```
-  Reload systemd manager configuration
```
sudo systemctl daemon-reload
```

### Step 4: Disable SELinux for Apache
```
sudo setenforce 0
```
### Step 5: Mount the NFS Server's Export

```
sudo mount -t nfs -o rw,nosuid $NFS_SERVER:/mnt/apps /var/www
```
### Step 6: Verify NFS Mount and Make it Persistent
```
echo "$NFS_SERVER:/mnt/apps /var/www nfs defaults 0 0" | sudo tee -a /etc/fstab

# Mount all entries in fstab
sudo mount -a
```

### Step 7: Mount Apache log folder to NFS and make it persistent
```
LOG_DIR="/var/log/httpd" # Change to /var/log/apache2 for Debian/Ubuntu
```
```
sudo mount -t nfs -o rw,nosuid $NFS_SERVER:/mnt/logs $LOG_DIR
```

- Add Apache log NFS mount to /etc/fstab for persistence
```
echo "$NFS_SERVER:/mnt/logs $LOG_DIR nfs defaults 0 0" | sudo tee -a /etc/fstab
```

-  Mount all entries in fstab
```
sudo mount -a
```

- Reload systemd manager configuration
sudo systemctl daemon-reload

## Repeat steps 1-7 for another 2 Web Servers.

# Step 8: Download application example(WordPress) 

- Downloading WordPress
```
sudo wget https://wordpress.org/latest.tar.gz 
```
- Extracting WordPress
```
sudo tar -xzvf latest.tar.gz -C .
```
- Copy WordPress to /var/www/html/
```
sudo cp -r wordpress /var/www/html/
```
-  Clean up
```
sudo rm latest.tar.gz
```

Verify that Apache files and directories are available on the Web Server in /var/www and also on the NFS server in /mnt/apps. 
If you see the same files – it means NFS is mounted correctly. You can try to create a new file touch test.txt from one server and
check if the same file is accessible from other Web Servers.
