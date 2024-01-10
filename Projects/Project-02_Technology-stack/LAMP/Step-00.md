# Overview 


![515](https://user-images.githubusercontent.com/85270361/210135514-94bd558b-4d6f-428a-b5f9-fafc2ee525bc.PNG)


The setup on the diagram above is a typical generic Web Stack architecture that you have already implemented in previous projects
(LAMP, LEMP, MEAN, MERN), this architecture can be implemented with many other technologies – various Web and DB servers, from small Single-page applications SPA to large and complex portals.


In this case, our Web Server has a role of a "Client" that connects and reads/writes to/from a Database (DB) Server (MySQL, MongoDB,Oracle, SQL Server or any other), and the communication between them happens over a Local Network (it can also be Internet connection,
but it is a common practice to place Web Server and DB Server close to each other in local network).

## STEP 1 — Install Apache HTTP Web server 

#### Prerequisite
+ Server Name: web-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: SSH 22, MySQL 3306, HTTP 80

### Prepare the NFS Server

-  Launch a RedHat EC2 instance – ‘web Server’
-  Install web Server 
-  Add two volumes of 10 gb inn the sama avaliability zone.
-  Open the following ports 

## STEP 2 — Install MYSQL on your DB server 

#### Prerequisite - DB Server
+ Server Name: DB-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, and 3306

### Prepare the 

-  Launch a RedHat EC2 instance that will have a role – ‘DB Server’
-  Install mysql Server 
-  Open port 3306 

