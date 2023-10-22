# United Core Systems
### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

# Nexus Installation And Setup In AWS EC2 Redhat Instance.
### Pre-requisite
+ AWS Acccount - Luanch an [ec2 instance](../EC2_Instances/README.md)
+ Create Redhat EC2 t2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 8081 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for Nexus version 3.61.0-02

# Installation

#### 1. Set hostname, Add Nexus as a user and to the Sudors file.
```sh
sudo hostnamectl set-hostname nexus
sudo useradd nexus
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus
```
#### 2. install Java JDK 11+ as a prerequisit for nexus to run.
```sh
sudo yum install wget nano tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
```
#### 3. Download, extract and Install Nexus
```sh
cd /opt
sudo wget http://download.sonatype.com/nexus/3/nexus-3.61.0-02-unix.tar.gz 
sudo tar -zxvf nexus-3.61.0-02-unix.tar.gz
sudo mv /opt/nexus-3.61.0-02 /opt/nexus
sudo rm -rf nexus-3.61.0-02-unix.tar.gz
```
#### 4. Set set ownership permissions to nexus 
```sh
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work
```
#### 5. Run nexus as a user by modifying #run_as_user="" 
```sh
sudo echo  'run_as_user="nexus" ' > /opt/nexus/bin/nexus.rc
```
#### 6. Create a softlink for nexus 
```sh
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
```
#### 7. Enable and start the nexus services
```sh
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus
#NB: control C to exit from systemctl 
```
#### 8. Verify Nexus connection by running this command
```sh
curl -v localhost:8081
```
#### 9. Access Nexus by entering server ip address with port number and default credentials
```sh
# publicIP:8081
# default USERNAME: admin
# nexus password 
sudo cat /opt/sonatype-work/nexus3/admin.password   
```
# Configuration

## POM.XML 

#### Edit URL in POM.xml file
```sh
<distributionManagement>
	    <repository>
	      <id>nexus</id>
	      <name>United Core System Releases Nexus Repository</name>
	      <url>http://54.255.174.111:8081/repository/unitedcore/</url>
	    </repository>
	    
	    <snapshotRepository>
	      <id>nexus</id>
	      <name>United Core System Snapshot Nexus Repository </name>
	      <url>http://54.255.174.111:8081/repository/unitedcore/</url>
	    </snapshotRepository>    
</distributionManagement>
```

## Creating repositories

### Login to Nexus using you public ip of your server as shown below into URL of a web browers:
http://public-ip-address:8081    

#### "Sign in": Enter default username "admin" and password copied from Nexus server 
![Sign in](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/ae9faaee-a095-438f-a8f2-45af3747d4f8)

#### "Navigate to Settings": click on the "Settings" icon (a gear) on the toolbar, which takes you to the administration section.    
![Navigate to Settings](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/d42cf86a-604e-4474-b037-877937dcf48d)

#### "Navigate to Repository": Click on "Repositories" in the left sidebar or the main menu.
![Navigate to Repository](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/af947112-9f02-4122-a766-87a1bb544dc8)

#### "Create New Repository": Click on the "Create repository" button.
![Create New Repository](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/791cb26c-a4d4-4357-9a69-9561b0014cd0)

#### "Create a Maven Hosted Repository": In the "Select Recipe" page, select "maven2 (hosted)".
![Create a Maven Hosted Repository](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/165ed860-e7da-4612-8c53-950c0b7acd32)

# Configuring the Repository:
1. Fill in the "Name": Give your repository a unique name.
2. "Version policy": Choose between "Release", "Snapshot", or "Mixed" depending on your use case.
3. "Layout policy": Choose "Strict".
4. "Blob store": Leave on default.
      
![Configuring the Repository](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/87b8cf2a-99b3-4374-a231-37c7f0f1c5ba)

5. "Deployment policy": Choose who can deploy artifacts to the repository (e.g., "Allow Redeploy"). 
6. "Save": Click on the "Create repository" button at the bottom.
      
![Configuring the Repository](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/ec5c6d12-ac0f-402b-a747-432c373444c5)

Retriving Repository url : Click on copy on the same line of your repo and copy url in the popup box

![Retriving Repository url](https://github.com/unitedcoresystems/Bootcampclass-2023/assets/63193071/a3b6353b-3775-48c9-be7d-e0e900d56b3e)
