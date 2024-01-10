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


## 1. Launch three EC2 instances and name is "Web-Server-1 Web-Server-2 and Web-Server-3" in the same subnet. 

#### Prerequisite - Web Servers
+ Server Name: Web-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, 2049, and 80 
+ Storage: 10 gb

### Preparing  

-  Launch three EC2 instance that will serve as "Web Server" 
-  Install Apache HTTP, wordpress and php
-  Open port 22 2049 and 80 

## 2. Launch an EC2 instances and name is "DB-Server". 

#### Prerequisite - DB Server
+ Server Name: DB-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, and 3306
+ Storage: 10 gb 

### Prepare the 

-  Launch a RedHat EC2 instance that will have a role – ‘DB Server’
-  Install mysql Server 
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

### Prepare the NFS Server

-  Launch a RedHat EC2 instance – ‘NFS Server’
-  Install NFS Server 
-  Add two volumes of 10 gb inn the sama avaliability zone.
-  Open the following ports TCP 111, UDP 111, UDP 2049


Let us get started!

