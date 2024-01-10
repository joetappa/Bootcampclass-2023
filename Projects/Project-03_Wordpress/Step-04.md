# Configure database

To configure WordPress, we need to create MySQL database. Let’s do it!

```
 sudo mysql -p
```
Outcome:
```
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.7.20-0ubuntu0.16.04.1 (Ubuntu)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
``` 
NEXT, Create a database with mysql command

```sql
CREATE DATABASE wordpress;
```
Outcome:
```
Query OK, 1 row affected (0,00 sec)
```
NEXT, Create a user and asign a password, replace <your-password> with your password

```sql
CREATE USER wordpress@localhost IDENTIFIED BY '<your-password>';
```
Outcome:
```
Query OK, 1 row affected (0,00 sec)
```
```sql
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;
```
Query OK, 1 row affected (0,00 sec)

```sq
FLUSH PRIVILEGES;
```
Outcome:
```
Query OK, 1 row affected (0,00 sec)
```
```sql
quit;
```
Outcome:
```
Bye
```
Enable MySQL service 
```
sudo service mysql start
```
