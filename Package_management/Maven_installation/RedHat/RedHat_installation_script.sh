#!/bin/bash

#   Organization: United Core Systems, Worcester, Massachusetts.
##  Contacts: Phone: 774-515-0044, 617-955-5115 WebSite : http://unitedcoresystem.com Email: info@unicoresystem.com
### Authors : Emmanuel Mortoo, Ben Otoo Isaac Ntim and Theophilus Akonnor 

# install Java JDK 11+ as a prerequisit for maven to run.
sudo hostnamectl set-hostname Maven
sudo yum install wget vim tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y

# Download, extract and Install Maven
cd /opt
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.zip
sudo unzip apache-maven-3.9.4-bin.zip
sudo rm -rf apache-maven-3.9.4-bin.zip
sudo mv apache-maven-3.9.4/ maven

# Set Environmental Variable  - For Specific User eg ec2-user
echo "# .bash_profile" > /home/ec2-user/.bash_profile
echo "export M2_HOME=/opt/maven" >> /home/ec2-user/.bash_profile
echo 'export PATH=$PATH:$M2_HOME/bin' >> /home/ec2-user/.bash_profile
echo "# Get the aliases and functions" >> /home/ec2-user/.bash_profile
echo "if [ -f ~/.bashrc ]; then" >> /home/ec2-user/.bash_profile
echo "        . ~/.bashrc" >> /home/ec2-user/.bash_profile
echo "fi " >> /home/ec2-user/.bash_profile
echo "# User specific environment and startup programs" >> /home/ec2-user/.bash_profile
source ~/.bash_profile

# Verify prerequisit installation and confirm if maven is running
mvn --version

