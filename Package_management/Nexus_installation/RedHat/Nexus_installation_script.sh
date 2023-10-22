#!/bin/bash

#   Organization: United Core Systems, Worcester, Massachusetts.
##  Contacts: Phone: 774-515-0044, 617-955-5115 WebSite : http://unitedcoresystem.com Email: info@unicoresystem.com
### Authors : Emmanuel Mortoo, Ben Otoo Isaac Ntim and Theophilus Akonnor 

# Set hostname, Add Nexus as a user and to the Sudors file.
sudo hostnamectl set-hostname nexus
sudo useradd nexus
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus

# install Java JDK 11+ as a prerequisit for nexus to run.
cd /opt
sudo yum install wget nano tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y

# Download, extract and Install Nexus
sudo wget http://download.sonatype.com/nexus/3/nexus-3.61.0-02-unix.tar.gz 
sudo tar -zxvf nexus-3.61.0-02-unix.tar.gz
sudo mv /opt/nexus-3.61.0-02 /opt/nexus
sudo rm -rf nexus-3.61.0-02-unix.tar.gz

# Set set ownership permissions to nexus 
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work

# change from #run_as_user="" to [ run_as_user="nexus" ]
echo  'run_as_user="nexus" ' > /opt/nexus/bin/nexus.rc

# Create a softlink for nexus 
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

# Enable and start the nexus services
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus