# How to host your website on web server 

## 1. Download and deploy finance web template

Create the directory name finance in the /tmp directory using ‘mkdir’ command as follows:

```
sudo mkdir -p /tmp/finance

```
Next, change director to tmp/finance directory 

```
cd /tmp/finance
```
Next, download  the finance template file from tooplate website  

```
sudo wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip
```
Next, unzip the finance template 

```
sudo unzip -o 2135_mini_finance.zip
```

Next, copy all the content of the the finance template to /var/www/html/

```
sudo cp -r 2135_mini_finance/* /var/www/html/
``` 

Next, assign ownership of the directory with your current system user:

```
sudo chown -R $USER:$USER /var/www/html/
```

Finally, reload Apache so these changes take effect:

```
sudo systemctl reload apache2
```

Now go to your browser and try to open your website URL using IP address:


```
http://<Public-IP-Address>:80
```

