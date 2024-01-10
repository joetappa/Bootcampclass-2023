# Install Mysql client on the Web Server 

## Step 4 — Install MySQL client on your EC2 Web Server 

Step 1 — Configure WordPress to connect to remote database.

1. Install MySQL client and test that you can connect from your Web Server to your DB server by using mysql-client

```
sudo yum install mysql
sudo mysql -u admin -p -h <DB-Server-Private-IP-address>
```

2. Verify if you can successfully execute SHOW DATABASES; command and see a list of existing databases.

```
SHOW DATABASES;
```

3. Change permissions and configuration so Apache could use WordPress:

4. Enable TCP port 80 in Inbound Rules configuration for your Web Server EC2 (enable from everywhere 0.0.0.0/0 or from your workstation’s IP)

5. Try to access from your browser the link to your WordPress 

http://<Web-Server-Public-IP-Address>/wordpress/
  
![5040](https://user-images.githubusercontent.com/85270361/210138663-27322aaf-f020-4261-a695-a98dc5f2387c.PNG)

  
Fill out your DB credentials:
  
![5050](https://user-images.githubusercontent.com/85270361/210138669-88078473-e459-4864-856f-4e6cb3d457d6.PNG)


If you see this message – it means your WordPress has successfully connected to your remote MySQL database
  

![5060](https://user-images.githubusercontent.com/85270361/210138718-d9c15bc9-f5b0-45f8-b613-11882374bf63.PNG)

  
Important: Do not forget to STOP your EC2 instances after completion of the project to avoid extra costs.

CONGRATULATIONS!
You have learned how to configure a three-tier Architecture  deploying a full-scale Web Solution using WordPress CMS and MySQL RDBMS!
  

![5070](https://user-images.githubusercontent.com/85270361/210138753-775e4c79-c634-473a-9330-254b209347d1.PNG)

