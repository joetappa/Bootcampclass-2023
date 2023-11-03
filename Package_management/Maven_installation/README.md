# United Core Systems

### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

## Apache Maven Installation And Setup In AWS EC2 Instance.
#### Prerequisite
+ AWS Acccount - Luanch an [ec2 instance](../EC2_Instances/README.md)
+ Create Security Group and open Required ports.
   + 22 ..etc
+ Create EC2 T2.micro Instance with 2GB of RAM.
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+

# Installation 

#### 1. Install Java JDK 11+ and other prerequisite softwares (GIT, wget, tree and VIM)
``` sh
sudo hostnamectl set-hostname maven
sudo yum install wget vim tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
sudo su - ec2-user
```

#### 2. Download, extract and Install Maven
``` sh
cd /opt
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.zip
sudo unzip apache-maven-3.9.4-bin.zip
sudo rm -rf apache-maven-3.9.4-bin.zip
sudo mv apache-maven-3.9.4/ maven
```
#### 3. Set environmental variable  - for specific user eg. ec2-user
``` sh
vi ~/.bash_profile
```
#### 4. Insect the script below under first line "# .bash_profile" 
``` sh
export M2_HOME=/opt/maven
export PATH=$PATH:$M2_HOME/bin
```
#### 5. Refresh the profile file and Verify if maven is running
```sh
source ~/.bash_profile
mvn --version
```

# Configuration 

### Nexus - Maven intergration 

#### 1. Configure nexus login credentials in settings.xml file in the conf directory in the maven server 
```sh 
sudo vi /opt/maven/conf/settings.xml          
```

#### 2. Edit and add credentials as shown below under commentted <server> </server> tag  
```sh
   <server>
      <id>nexus</id>
      <username>admin</username>
      <password>admin@123</password>
    </server>
```
#### 3. Save and exit from settings.xml  
$ esc :wq! 
$ esc hold "Shift" +  ZZ
