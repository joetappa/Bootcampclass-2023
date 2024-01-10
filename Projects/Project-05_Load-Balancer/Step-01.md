# Install and setup Nginx 

## Step 1 – Launch an EC2 VM based on Ubuntu Server 20.04 LTS and name it Nginx LB 

1. Update the instance and Install Nginx

```
sudo apt update
sudo apt install nginx
```

2. Configure Nginx LB using Web Servers’ names defined in /etc/hosts

Hint: Read this blog to read about /etc/host

3.  the default nginx configuration file

sudo vi /etc/nginx/nginx.conf


```
#insert following configuration into http section

 upstream myproject {
    server Web1 weight=5;
    server Web2 weight=5;
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
