#!/bin/bash

#   Organization: United Core Systems, Worcester, Massachusetts.
##  Contacts: Phone: 774-515-0044, 617-955-5115 WebSite : http://unitedcoresystem.com Email: info@unicoresystem.com
### Authors : Emmanuel Mortoo, Ben Otoo Isaac Ntim and Theophilus Akonnor 

# Update Server and set timezone and hostname
sudo yum update
sudo hostnamectl set-hostname Maven
sudo timedatectl set-timezone America/New_York

# install Java JDK 11+ as a pre-requisit for maven to run.
sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install wget vim tree unzip git-all -y

# Run this commands to Install Maven
cd /opt 
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.82/bin/apache-tomcat-9.0.82.tar.gz
sudo tar -xvf apache-tomcat-9.0.82.tar.gz
sudo rm apache-tomcat-9.0.82.tar.gz
sudo mv apache-tomcat-9.0.82 tomcat9

# Ensure that Tomcat is running and accesible using this command
sudo chmod 777 -R /opt/tomcat9
sudo sh /opt/tomcat9/bin/startup.sh

### Create a soft link and start tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat


