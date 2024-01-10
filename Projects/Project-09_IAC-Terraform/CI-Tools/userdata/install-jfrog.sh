#!/bin/bash

# Install and start Jfrog as a service 
# This script works on RHEL 7 & 8 OS 
# Your server must have at least 4GB of RAM
# become the root / admin user via: sudo su -

#update the server and change timezone and hostname 
sudo yum update -y
sudo hostnamectl set-hostname jfrog-server
sudo timedatectl set-timezone America/New_York

# swtich to root user 
# sudo su - 

# 1. Install prerequisit: JAVA, unzip
sudo yum install wget nano tar unzip -y

# 2. Download jfrog software using RPM
wget https://releases.jfrog.io/artifactory/artifactory-rpms/artifactory-rpms.repo -O jfrog-artifactory-rpms.repo
sudo mv jfrog-artifactory-rpms.repo /etc/yum.repos.d/
sudo yum install jfrog-artifactory-oss -y 

# 3. Enable and start the artifactory services
sudo systemctl enable artifactory
sudo systemctl start artifactory
sudo systemctl status artifactory





