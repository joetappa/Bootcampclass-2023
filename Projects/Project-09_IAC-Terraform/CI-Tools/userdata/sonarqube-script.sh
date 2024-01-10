#!/bin/bash
sudo useradd sonar
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
sudo hostnamectl set-hostname sonar 
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
sudo yum install unzip wget git -y
sudo yum install java-11-openjdk-devel -y
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/
echo "[Unit]" > /etc/systemd/system/sonar.service
echo "Description=SonarQube service" >> /etc/systemd/system/sonar.service
echo "After=syslog.target network.target" >> /etc/systemd/system/sonar.service
echo "[Service]" >> /etc/systemd/system/sonar.service
echo "Type=forking" >> /etc/systemd/system/sonar.service
echo "ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start" >> /etc/systemd/system/sonar.service 
echo "ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop" >> /etc/systemd/system/sonar.service
echo "User=sonar" >> /etc/systemd/system/sonar.service
echo "Group=sonar" >> /etc/systemd/system/sonar.service
echo "Restart=always" >> /etc/systemd/system/sonar.service
echo "[Install]" >> /etc/systemd/system/sonar.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/sonar.service
sudo systemctl daemon-reload
sudo systemctl enable --now sonar
sudo systemctl status sonar