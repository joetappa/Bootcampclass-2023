#!/bin/bash

# Install and start Jenkins as a service 
# This script works on EC2 server  
# Your server must have at least 4GB of RAM

#update the server and change timezone and hostname 
sudo hostnamectl set-hostname jenkins-server
sudo timedatectl set-timezone America/New_York

#1.Install prerequisit: JAVA, git, unzip
sudo yum install wget git unzip tar -y
sudo yum install java-11-openjdk-devel -y

#2. Add the Jenkins repo using the following command
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

#3. Import a key file from Jenkins-CI to enable installation from the package:
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade

#4. Install Jenkins
sudo yum install jenkins -y

#5. Start and Enable the Jenkins service to start at boot:
sudo systemctl enable jenkins
sudo systemctl start jenkins