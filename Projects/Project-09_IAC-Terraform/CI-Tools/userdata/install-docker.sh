#!/bin/bash

# Install and start docker as a service 
# This script works on amazon linux server  
# Your server must have at least 4GB of RAM

#update the server and change timezone and hostname 
sudo yum update -y
sudo hostnamectl set-hostname docker-server
sudo timedatectl set-timezone America/New_York

#1. Installing Docker and Docker compose, git and java on Amazon linux server 
sudo yum install docker -y

#2 Enable and start the nexus services
sudo systemctl start docker
sudo systemctl enable docker

#3 Add docker to the ec2-user group 
sudo usermod -aG docker ec2-user


###################################################################################

# installing docker compose and other prerequisit

# 1.Install prerequisit: JAVA, git, unzip
sudo yum install wget git unzip tar -y
sudo yum install java-11-amazon-corretto -y

#2. Installing Docker compose, git and java on Amazon linux server 
sudo curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

#3 Add execution permission to docker-compose  
sudo chmod +x /usr/local/bin/docker-compose

#4 clone from repository 
git clone https://github.com/emortoo/registration-app.git
cd registration-app
git checkout dev

#5 Installation complete  
echo "end of installation" 
