set -e

#DIRECTORY TO PULL FILE
 
 if [[  "$PWD" =="~/Documents/vagrant/vms"]]; then
  else
  mkdir -p ~/Documents/vagrant/vms
  cd ~/Documents/vagrant/vms
  vagrant init ubuntu/focal64
  fi 

#!/bin/bash

# Update package
sudo apt-get update -y

# Install Apache
sudo apt-get install apache2 apache2-utils -y
sudo ufw allow http

# Install MySQL 
sudo apt-get install mysql-server -y

# Install PHP and required modules
sudo apt-get install php -y

# Enable Apache extensions for php
sudo apt-get install php libapache2-mod-php php-mysql -y

# enable phpinfo page
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/test.php

#Install composer dependencies and composer
sudo apt-get install php-xml php-curl -y
sudo apt-get install php-cli php-json php-common curl php-mbstring php-zip unzip zip unzip php-curl php-xml -y
sleep 5

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer install
sleep 5

# update the repo
composer update

# disable the default apache page
sudo a2dissite 000-default

# open a new configuration file in Apache’s sites-available directory
cd /etc/apache2/sites-available

#create config file
touch laravelproject.conf

# update the content
sudo sed -n 'w laravelproject.conf' <<EOF
<VirtualHost *:80>
    ServerAdmin dgdud@localhost
    DocumentRoot /var/www/laravelproject/public

    <Directory /var/www/laravelproject/public>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/laravel-error.log
    CustomLog \${APACHE_LOG_DIR}/laravel-access.log combined

    <IfModule mod_dir.c>
        DirectoryIndex index.php
    </IfModule>
</VirtualHost>
EOF

# enable the site
sudo a2ensite laravelproject

#Copy all files and directories inside the /vagrant/laravel-app/ directory to the /var/www/html/ directory.
cp -r /vagrant/laravel-app/* /var/www/html/

# Restart Apache
sudo systemctl reload apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

  