#!/bin/bash

# Install and start docker as a service 
# This script works on amazon linux server  
# Your server must have at least 4GB of RAM

#update the server and change timezone and hostname 
sudo apt update -y
sudo hostnamectl set-hostname jenkins-server
sudo timedatectl set-timezone America/New_York

#1.Install prerequisit: JAVA, git, unzip
sudo apt install wget git unzip tar -y
sudo apt install openjdk-17-jre -y

#2. Add the Jenkins repo using the following command and Import a key file from Jenkins-CI to enable installation from the package:

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y
sudo apt install jenkins -y 

#5. Start and Enable the Jenkins service to start at boot:
sudo systemctl enable jenkins
sudo systemctl start jenkins