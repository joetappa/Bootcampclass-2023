# Deploying Three-tier Architecture with Wordpress as application tier and MYSQL and NFS as a data tier 


## Prerequisites
Make sure that you have following servers installed and configured within Project-7:

1. Two RHEL8 Web Servers
2. One MySQL DB Server (based on Ubuntu 20.04)
3. One RHEL8 NFS server


![6007](https://user-images.githubusercontent.com/85270361/210140264-3d8cb37c-d631-4a16-bbeb-22e8e172595e.PNG)


In this project you will implement a solution that consists of following components:

1. Infrastructure: AWS
2. Webserver Linux: Red Hat Enterprise Linux 8
3. Database Server: Ubuntu 20.04 + MySQL
4. Storage Server: Red Hat Enterprise Linux 8 + NFS Server
5. Programming Language: PHP
6. Code Repository: GitHub


## 1. Launch two EC2 instances and name is "Web-Server-1 and Web-Server-2" in the same subnet. 

#### Prerequisite - Web Servers
+ Server Name: Web-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, 2049, and 80 
+ Storage: 10 gb

### Preparing  

-  Launch three EC2 instance that will serve as "Web Server" 
-  Open port 22, 2049 and 80 

## 2. Launch an EC2 instances and name is "DB-Server". 

#### Prerequisite - DB Server
+ Server Name: DB-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, and 3306
+ Storage: 10 gb 

### Prepare the 

-  Launch a RedHat EC2 instance that will have a role – ‘DB Server’
-  Open port 3306 

## 3. Launch another EC2 instances and name it "NFS-Server". 

#### Prerequisite
+ Server Name: NFS-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: SSH 22, TCP 111, UDP 111, UDP 2049 
+ Storage: Volume xvdf 10 gb 
+ Storage: Volume xvdg 10 gb
+ Storage: Volume xvdh 10 gb

### Prepare the NFS Server and volume 

-  Launch a RedHat EC2 instance – ‘NFS Server’
-  Add two volumes of 10 gb inn the sama avaliability zone.
-  Open the following ports TCP 111, UDP 111, UDP 2049

Step 1 — Prepare a NFS Server Volumes 

1. Launch an EC2 instance that will serve as "NFS Server". Create 3 volumes in the same AZ as your Web Server EC2, each of 10 GiB.

![attachv](https://github.com/emortoo-projects/crispy-kitchen/assets/63193071/bb2ce532-bce7-4093-a72f-4754b7cfd9fe)


2. Attach all three volumes one by one to your NFS Server EC2 instance

<img width="1750" alt="Screenshot 2024-01-10 at 15 03 28" src="https://github.com/emortoo-projects/crispy-kitchen/assets/63193071/ea118212-e8d8-455b-9a65-e167826e4b0c">


### Define variables
NFS_SERVER_IP="<NFS-Server-Private-IP-Address>"
DB_NAME="<DB_NAME>"
DB_USER="<DB_USER>"
DB_PASSWORD="<DB_PASSWORD>"
DB_HOST="<DB_HOST>"
SERVER_HOSTNAME="<SERVER_HOSTNAME>" 

#### INSTANCE Private IP Address
NFS_SERVER=<nfs-Server-Private-IP-Address>
DB_SERVER=<db-Server-Private-IP-Address>
WEB_SERVER_1=<web-Server-1-Private-IP-Address>
WEB_SERVER_2=<web-Server-2-Private-IP-Address>
SUBNET_CIDR=<subnet-IP-Address>


Let us get started!

Open up the Linux terminal to begin configuration


