#!/bin/bash
sudo hostnamectl set-hostname jenkins-server
sudo timedatectl set-timezone America/New_York
sudo yum install wget git unzip tar -y
sudo yum install java-11-openjdk-devel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins