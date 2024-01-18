# How to Install MySQL and configure the database server 

1. Install MySQL on your database server 

- Install MySQL server
- Create a database and name it wordpress
- Create a database user and name it webaccess
- Grant permission to webaccess user on project4 database to do anything only from the webservers subnet cidr

1 — Install MySQL 

```
sudo apt update
sudo apt install mysql-server -y
```

Verify that the service is up and running by using sudo systemctl status mysqld, if it is not running, restart the service and enable it so it will be running even after reboot:

```
sudo systemctl restart mysql
sudo systemctl enable mysql
```

2. Create a database and database user and grant permission 

```
sudo mysql
```
Enter this command in mysql > 

```sql
CREATE DATABASE wordpress;
CREATE USER `webaccess`@`<Web-Server-private-ip>` IDENTIFIED BY 'web@123';
CREATE USER `webaccess`@`<Web-Server-private-ip>` IDENTIFIED BY 'web@123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'webaccess'@'<Web-Server-private-ip>';
GRANT ALL PRIVILEGES ON wordpress.* TO 'webaccess'@'<Web-Server-private-ip>';
FLUSH PRIVILEGES;
SHOW DATABASES;
```
```sql
exit
```

3. You might need to configure MySQL server to allow connections from remote hosts.

```
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
```

Replace ‘127.0.0.1’ to ‘0.0.0.0’ like this:

<img width="1232" alt="Screenshot 2024-01-10 at 16 16 24" src="https://github.com/emortoo-projects/crispy-kitchen/assets/63193071/0969cbd6-9a5c-4495-8d9e-e8722d0ac400">

4. Restart MySQL service 

```sql
sudo systemctl restart mysql
```
**Note:**  From mysql client Linux Server connect remotely to mysql server Database Engine without using SSH. You must use the mysql utility to perform this action.



