# How to configure EC2 insatnce as an Apache HTTP Web Server

## 1. Install Apache http web server  

#### Prerequisite
+ wget
+ unzip 
+ vim

- Change hostname 
```
sudo hostnamectl set-hostname project1-web-server
```
Exit and log back in 
``` 
exit
```

Install prerequisites using Ubuntu’s package manager ‘apt’:

```
sudo apt install wget unzip vim -y
```

Install Apache HTTP web server

```
# update a list of packages in package manager
sudo apt update

# run apache2 package installation
sudo apt install apache2 -y
```

## 2. To verify that apache2 is running as a Service in our OS, use following command

```
sudo systemctl status apache2
```

First, let us try to check how we can access it locally in our Ubuntu shell, run:

```
curl http://localhost:80
``` 

or

```
 curl http://127.0.0.1:80
```

**Note**
These 2 commands above actually do pretty much the same – they use ‘curl’ command to request our Apache HTTP Server on port 80
(actually you can even try to not specify any port – it will work anyway). The difference is that: in the first case we try to
access our server via DNS name and in the second one – by IP address (in this case IP address 127.0.0.1 corresponds to DNS name
‘localhost’ and the process of converting a DNS name to IP address is called "resolution"). We will touch DNS in further lectures 
and projects.



Now it is time for us to test how our Apache HTTP server can respond to requests from the Internet.

Open a web browser of your choice and try to access following url


```
http://<Public-IP-Address>:80
```

Another way to retrieve your Public IP address, other than to check it in AWS Web console, is to use following command:

```
curl ifconfig.me
```

The URL in browser shall also work if you do not specify port number since all web browsers use port 80 by default.

If you see following page, then your web server is now correctly installed and accessible through your firewall.

Apache Ubuntu Default Page

In fact, it is the same content that you previously got by ‘curl’ command, but represented in nice HTML formatting by your web browser.