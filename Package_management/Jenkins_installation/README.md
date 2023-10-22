#  **<span style="color:blue">United Core Systems, Worcester, Massachusetts.</span>**
### **<span style="color:blue">Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/></span>**
### **Email: info@unicoresystem.com**

# Jenkins Installation And Setup In AWS EC2 Ubuntu Instance.
##### Pre-requisite
+ AWS Acccount - Luanch an [ec2 instance](../EC2_Instances/README.md)
+ Create ubuntu EC2 t2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 8080 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for Jenkin version 

# Installation 

#### Update server, change hostname and Install Java JDK 11+ and other pre-quisite software packages (git, vim and wget)
``` sh
sudo apt update
sudo hostnamectl set-hostname Jenkins
sudo apt-get install openjdk-11-jre -y
sudo apt-get install wget vim git -y
```
#### Run this commands to Install Jenkins
```sh
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y 
```
#### Start and Enable the Jenkins service to start at boot:
```sh
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
#NB: control C to exit from systemctl 
``` 
####  Ensure that Jenkins is running and accesible on the browser. Jenkins default port is 8080
```sh
curl -v localhost:8080
```
#### Run the command to copy the Jenkins Admin Password 
```sh
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

# Configuration 

### Jenkins - Nexus intergration 

#### 1. Configure nexus login credentials in settings.xml file in the conf directory in the jenkins server 
```sh 
sudo vi /var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/3.9.5/conf/settings.xml         
```

#### 2. Edit and add credentials as shown below under commentted <server> </server> tag  
```sh
   <server>
      <id>nexus</id>
      <username>admin</username>
      <password>password</password>
    </server>
```
#### 3. Save and exit from settings.xml  
$ esc :wq! 
or
$ esc hold "Shift" +  ZZ

### Login to Jenkins using you public ip of your server as shown below into URL of a web browers:
http://public-ip-address:8080    

### Copy password and paste into Administrator password on jenkins URL
      
<img width="1291" alt="Screenshot 2023-02-01 at 10 56 25 AM" src="https://user-images.githubusercontent.com/43399466/215959008-3ebca431-1f14-4d81-9f12-6bb232bfbee3.png">

### Click on Install suggested plugins

<img width="1291" alt="Screenshot 2023-02-01 at 10 58 40 AM" src="https://user-images.githubusercontent.com/43399466/215959294-047eadef-7e64-4795-bd3b-b1efb0375988.png">

### Wait for the Jenkins to Install suggested plugins

<img width="1291" alt="Screenshot 2023-02-01 at 10 59 31 AM" src="https://user-images.githubusercontent.com/43399466/215959398-344b5721-28ec-47a5-8908-b698e435608d.png">

### Create First Admin User and add your email address

<img width="990" alt="Screenshot 2023-02-01 at 11 02 09 AM" src="https://user-images.githubusercontent.com/43399466/215959757-403246c8-e739-4103-9265-6bdab418013e.png">

### Jenkins Installation is Successful. You can now starting using the Jenkins 

<img width="990" alt="Screenshot 2023-02-01 at 11 14 13 AM" src="https://user-images.githubusercontent.com/43399466/215961440-3f13f82b-61a2-4117-88bc-0da265a67fa7.png">

