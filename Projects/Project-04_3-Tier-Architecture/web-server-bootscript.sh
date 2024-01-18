#!/bin/bash

# Define variables
NFS_SERVER="<NFS-Server-Private-IP-Address>"
DB_NAME="<DB_NAME>"
DB_USER="<DB_USER>"
DB_PASSWORD="<DB_PASSWORD>"
DB_HOST="<DB_HOST>"
SERVER_HOSTNAME="<SERVER_HOSTNAME>"

# Step 0: Update Server and Set Hostname
echo "Updating server packages..."
sudo yum update -y

echo "Setting server hostname..."
sudo hostnamectl set-hostname $SERVER_HOSTNAME

# Step 1: Install NFS Client and Wget
echo "Installing NFS client utilities and wget..."
sudo yum install nfs-utils nfs4-acl-tools wget -y

# Step 2: Install Apache, PHP, Required Repositories, and MySQL Client
echo "Installing Apache, PHP, EPEL, Remi's repository, and MySQL Client..."
sudo yum install httpd mysql -y
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
sudo dnf install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
sudo dnf module reset php -y
sudo dnf module enable php:remi-7.4 -y
sudo dnf install php php-opcache php-gd php-curl php-mysqlnd -y

# Step 3: Start and Enable PHP-FPM
echo "Starting and enabling PHP-FPM..."
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
sudo systemctl start httpd
sudo systemctl enable httpd

# Reload systemd manager configuration
sudo systemctl daemon-reload

# Step 4: Disable SELinux for Apache
echo "Setting SELinux boolean for Apache..."
sudo setenforce 0

# Step 2: Mount the NFS Server's Export
echo "Mounting NFS export to /var/www..."
sudo mount -t nfs -o rw,nosuid $NFS_SERVER:/mnt/apps /var/www

# Step 3: Verify NFS Mount and Make it Persistent
echo "Adding NFS mount to /etc/fstab for persistence..."
echo "$NFS_SERVER:/mnt/apps /var/www nfs defaults 0 0" | sudo tee -a /etc/fstab

# Mount all entries in fstab
sudo mount -a

# Step 7-10: Additional Configuration and Verification

# Mount Apache log folder to NFS and make it persistent
echo "Mounting Apache log folder to NFS..."
LOG_DIR="/var/log/httpd" # Change to /var/log/apache2 for Debian/Ubuntu
sudo mkdir -p $LOG_DIR
sudo mount -t nfs -o rw,nosuid $NFS_SERVER:/mnt/logs $LOG_DIR

echo "Adding Apache log NFS mount to /etc/fstab for persistence..."
echo "$NFS_SERVER:/mnt/logs $LOG_DIR nfs defaults 0 0" | sudo tee -a /etc/fstab

# Mount all entries in fstab
sudo mount -a

# Reload systemd manager configuration
sudo systemctl daemon-reload

# Step 7: Download and Set Up WordPress
echo "Downloading WordPress..."
sudo wget https://wordpress.org/latest.tar.gz 

echo "Extracting WordPress..."
sudo tar -xzvf latest.tar.gz -C .

echo "Copy WordPress..."
sudo cp -r wordpress /var/www/html/

# Clean up
sudo rm latest.tar.gz

echo "Script execution completed."

