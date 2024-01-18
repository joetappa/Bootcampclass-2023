
## downloading other applications 


1. Fork the tooling source code from [Darey.io Github Account](https://github.com/darey-io/tooling) to your Github account. 
```
git clone https://github.com/darey-io/tooling
```
2. Deploy the tooling website’s code to the Webserver. Ensure that the html folder from the repository is deployed to /var/www/html
```
mkdir tooling-site
```
```
sudo cp -r tooling/html/* tooling-site/
```
- confirm tooling-site is deployed 
```
ll /var/www/html/
```


Note 1: Do not forget to open TCP port 80 on the Web Server.

Note 2: If you encounter 403 Error – check permissions to your /var/www/html folder and also disable SELinux sudo setenforce 0
To make this change permanent – open following config file sudo vi /etc/sysconfig/selinux and set SELINUX=disabledthen restrt httpd.


3. Update the website’s configuration to connect to the database (in /var/www/html/functions.php file). 

```
vi /var/www/html/tooling-site/functions.php
```
Edit the following save and quit

$db = mysqli_connect('DB_HOST', 'DB_USER', 'DB_PASSWORD', 'DB_NAME');

$db = mysqli_connect('18.119.253.181', 'webaccess', 'web@123', 'tooling');

Apply tooling-db.sql script to your database using this command 

- test Connection 
```
mysql -h 18.119.253.181 -u webaccess -p
```
- Apply sql file 
```sql
mysql -h $DB_HOST -u $DB_USER -p $DB_NAME < tooling-db.sql
```

4. Create in MySQL a new admin user with the username: myuser and password: password:

Change to the Devops_tooling directory

- Connect to the mySQL server from the webserver using the ‘webaccess’ user created earlier and the private IP of the DB server.

```sql
sudo mysql -h $DB_SERVER -u $DB_SERVER -p
```
sudo mysql -u webaccess -p -h $DB_HOST
- Create in MySQL a new admin user by running the following SQL query

```sql
INSERT INTO tooling.users (id, username, password, email, user_type, status) VALUES (2, 'webaccess_user', '5f4dcc3b5aa765d61d8327deb882cf99', 'webaccess_user@mail.com', 'admin', 1);
```
6. Open the website in your browser http://public-ip-address/tooling-site/index.php and make sure you can login into the website with myuser user.

  
![6004](https://user-images.githubusercontent.com/85270361/210139699-6c023692-c7cb-404a-80c6-848434967fe9.PNG)

  
Congratulations!
You have just implemented a web solution for a DevOps team using LAMP stack with remote Database and NFS servers
  