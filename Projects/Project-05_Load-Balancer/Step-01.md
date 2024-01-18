# Install and setup Nginx 

## Step 1 – Launch an EC2 VM based on Ubuntu Server 20.04 LTS and name it Nginx LB 

1. Update the instance and Install Nginx

```
sudo apt update
sudo apt install nginx -y
```

2. Configure Nginx LB using Web Servers’ names defined in /etc/hosts

```
sudo vi /etc/hosts
```

Example 
172.31.6.156  WEB_SERVER_1
172.31.6.14   WEB_SERVER_2
172.31.14.181 WEB_SERVER_3

3.  the default nginx configuration file

sudo vi /etc/nginx/nginx.conf

```
#insert following configuration into http section

 upstream myproject {
    server WEB_SERVER_1 weight=5;
    server WEB_SERVER_2 weight=5;
    server WEB_SERVER_3 weight=5;

  }

server {
    listen 80;
    server_name www.domain.com;
    location / {
      proxy_pass http://myproject;
    }
  }

#comment out this line
#       include /etc/nginx/sites-enabled/*;
```


Restart Nginx and make sure the service is up and running


```
sudo systemctl restart nginx
sudo systemctl status nginx
```
