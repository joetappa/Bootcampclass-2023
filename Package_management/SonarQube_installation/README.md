# United Core Systems
### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

# SonarQube Installation And Setup In AWS EC2 Redhat Instance.
#### Prerequisite
+ AWS Acccount - Luanch an [ec2 instance](../EC2_Instances/README.md)
+ Create Redhat EC2 T2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 9000 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for SonarQube version 7.8
+  As a good security practice, SonarQuber Server is not advised to run sonar service as a root user


# Installation

#### 1. Create sonar user to manage the SonarQube server, Grand sudo access and set hostname for the sonarqube server
```sh
sudo useradd sonar
sudo sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
sudo hostnamectl set-hostname sonarqube-server 
sudo su - sonar
```
#### 2. Enable PasswordAuthentication in the server and install Java JDK 1.8+ required for sonarqube to start
```sh
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
sudo yum install unzip wget git -y
sudo yum install  java-11-openjdk-devel -y
```
#### 3. Download and extract the SonarqQube Server software.
```sh
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube
```
#### 4. Grant file permissions for sonar user to start and manage sonarQube
```sh
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/
sudo ln /opt/sonarqube/bin/linux-x86-64/sonar.sh /etc/init.d/sonar
```
#### 5. Run sonarqube as a service by running theses commands
```sh
sudo su - root
```

```sh
sudo echo "[Unit]" > /etc/systemd/system/sonar.service
sudo echo "Description=SonarQube service" >> /etc/systemd/system/sonar.service
sudo echo "After=syslog.target network.target" >> /etc/systemd/system/sonar.service
sudo echo "[Service]" >> /etc/systemd/system/sonar.service
sudo echo "Type=forking" >> /etc/systemd/system/sonar.service
sudo echo "ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start" >> /etc/systemd/system/sonar.service 
sudo echo "ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop" >> /etc/systemd/system/sonar.service
sudo echo "User=sonar" >> /etc/systemd/system/sonar.service
sudo echo "Group=sonar" >> /etc/systemd/system/sonar.service
sudo echo "Restart=always" >> /etc/systemd/system/sonar.service
sudo echo "[Install]" >> /etc/systemd/system/sonar.service
sudo echo "WantedBy=multi-user.target" >> /etc/systemd/system/sonar.service
exit
```
#### 6. Reload, enable and check sonar service 
```sh
sudo systemctl daemon-reload
sudo systemctl enable --now sonar
sudo systemctl status sonar
# NB: control C to exit from systemctl 
```
```sh
curl -v localhost:9000
```

# Configuration

### Sonaqube - Maven intergration  

#### Edit properties tag with server PublicIP Username password/token to enable connection in POM.XML file
```sh
<properties>
		<jdk.version>1.8</jdk.version>
		<spring.version>5.1.2.RELEASE</spring.version>
		<junit.version>4.11</junit.version>
		<log4j.version>1.2.17</log4j.version>
		<sonar.host.url>http://18.138.81.149:9000/</sonar.host.url>
		<sonar.login>admin</sonar.login>
		<sonar.password>admin</sonar.password> 
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
</properties>
```
