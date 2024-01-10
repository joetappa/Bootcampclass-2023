#!/bin/bash
sudo hostnamectl set-hostname nexus
sudo useradd nexus
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus
cd /opt
sudo yum install wget vim git -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
sudo wget http://download.sonatype.com/nexus/3/nexus-3.61.0-02-unix.tar.gz 
sudo tar -zxvf nexus-3.61.0-02-unix.tar.gz
sudo mv /opt/nexus-3.61.0-02 /opt/nexus
sudo rm -rf nexus-3.61.0-02-unix.tar.gz
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work
sudo echo  'run_as_user="nexus" ' > /opt/nexus/bin/nexus.rc
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus