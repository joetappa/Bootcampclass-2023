# Configure WordPress to connect to the database

Now, let’s configure WordPress to use this database. First, copy the sample configuration file to wp-config.php:
```
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
```
Next, set the database credentials in the configuration file (do not replace database_name_here or username_here in the commands below. Do replace your-password with your database password.):

```
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/<your-password>/' /srv/www/wordpress/wp-config.php
```
Finally, in a terminal session open the configuration file in vim:
```
sudo -u www-data vim /srv/www/wordpress/wp-config.php
```
Find the following:

- define( 'AUTH_KEY',         'put your unique phrase here' );
- define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
- define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
- define( 'NONCE_KEY',        'put your unique phrase here' );
- define( 'AUTH_SALT',        'put your unique phrase here' );
- define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
- define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
- define( 'NONCE_SALT',       'put your unique phrase here' );

Delete those lines. Then replace with the content of https://api.wordpress.org/secret-key/1.1/salt/. (This address is a randomiser that returns completely random keys each time it is opened.) This step is important to ensure that your site is not vulnerable to “known secrets” attacks.

Save and close the configuration file by holding shift followed by zz 
