# Configure a virtual host for WordPress using Apache

Create Apache site for WordPress. Create /etc/apache2/sites-available/wordpress.conf with following lines:

```
sudo vi /etc/apache2/sites-available/wordpress.conf 
```
next, copy the following content into the above file 

```
<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
```
Enable the site with:
```
sudo a2ensite wordpress
```
Enable URL rewriting with:
```
sudo a2enmod rewrite
```
Disable the default “It Works” site with:
```
sudo a2dissite 000-default
```
Or, instead of disabling the “it works” page, you may edit our configuration file to add a hostname that the WordPress installation will respond to requests for. This hostname must be mapped to your box somehow, e.g. via DNS, or edits to the client systems’ /etc/hosts file (on Windows the equivalent is C:\Windows\System32\drivers\etc\hosts). Add ServerName as below:
```
<VirtualHost *:80>
    ServerName hostname.example.com
    ... # the rest of the VHost configuration
</VirtualHost>
```
Finally, reload apache2 to apply all these changes:
```
sudo service apache2 reload
```