# Install and configure NFS and MySQL client on your Web Servers

## 1. Prepare the Web Servers
We need to make sure that our Web Servers can serve the same content from shared storage solutions, in our case – NFS Server and MySQL 
database.

You already know that one DB can be accessed for reads and writes by multiple clients. For storing shared files that our Web Servers 
will use – 

This approach will make our Web Servers stateless, which means we will be able to add new ones or remove them whenever we need, and the integrity of the data (in the database and on NFS) will be preserved.

- Configure configure MySQL client (this step must be done on all three servers)
- Configure the Web Servers to work with a single MySQL database

1. Configure MySQL client

- Install MySQL client and test that you can connect from your Web Server to your DB server by using mysql-client

```
sudo yum install mysql -y 
```

```
ping $DB_SERVER
```
```
sudo mysql -u webaccess -p -h $DB_SERVER
```

- Check that you have successfully connected to a remote MySQL server and can perform SQL queries:

```
Show databases;
```

