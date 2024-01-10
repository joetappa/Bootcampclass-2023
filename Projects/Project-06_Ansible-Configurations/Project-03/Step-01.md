# Setup your 3-Tier 

## Step 1 – Launch two EC2 instances, one will serve as a “WEB SERVER” and the other as a "DB SERVER". 

### Prepare a Web Server

-  Launch an EC2 instance that will serve as "Web Server" 
-  Open port 80 

### Prepare the Database Server

-  Launch a second RedHat EC2 instance that will have a role – ‘DB Server’
-  Open port 3306 

Use RedHat OS for this project

By now you should know how to spin up an EC2 instanse on AWS, but if you forgot – refer to Project-01 Step 1.
In previous projects we used ‘Ubuntu’, but it is better to be well-versed with various Linux distributions, thus, for this projects
we will use very popular distribution called ‘RedHat’ (it also has a fully compatible derivative – CentOS)

Note: for Ubuntu server, when connecting to it via SSH/Putty or any other tool, we used ubuntu user, but for RedHat you will need
to use ec2-user user. Connection string will look like ec2-user@<Public-IP>

Let us get started!


