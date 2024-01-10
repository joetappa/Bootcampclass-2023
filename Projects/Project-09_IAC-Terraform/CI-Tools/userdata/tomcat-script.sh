#!/bin/bash
sudo hostnamectl set-hostname tomcat
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
cd /opt 
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.82/bin/apache-tomcat-9.0.82.tar.gz
sudo tar -xvf apache-tomcat-9.0.82.tar.gz
sudo rm apache-tomcat-9.0.82.tar.gz
sudo mv apache-tomcat-9.0.82 tomcat9
sudo chmod 777 -R /opt/tomcat9
sudo sh /opt/tomcat9/bin/startup.sh
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat