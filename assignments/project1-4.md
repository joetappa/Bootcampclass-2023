**Group Assignment: Automate Project 1 - 4 **

**Objective:** 
Automate project by scripting repeatable processes

**Prerequisites:**
1. Completed project 1 - 4
2. 

**Instructions:**

1. **Boost strap Script**:
    - Script the step 4 of project 1 and name it finance-website.sh

2. **Web tier**:  
    - Remove MySQL-server on your web server from project 2 

3.  **Data tier**: 
    - launch an ubuntu instance as your database server in a seperate subnet 
    - open mysql/aurora port 3306 
    - connect to your server and Install MySQL server 
    - Connect your webserver-1 to this database server 

use this to create a new user and grant access to all web servers in the subnet cidr

```sql
sudo mysql
CREATE DATABASE wordpress;
CREATE USER `webaccess`@`<Web-Server-subnet cidr>` IDENTIFIED BY 'web@123';
GRANT ALL ON wordpress.* TO 'webaccess'@'<Web-Server-subnet cidr>';
FLUSH PRIVILEGES;
SHOW DATABASES;
exit
```

4. **Test Connections**
