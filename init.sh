#
# MySQL Configuration
# Allow us to Remote from Vagrant with Port
#
sudo cp /etc/mysql/my.cnf /etc/mysql/my.bkup.cnf
# Note: Since the MySQL bind-address has a tab cahracter I comment out the end line
sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/my.cnf

#
# Grant All Priveleges to ROOT for remote access
#
mysql -u root -proot -Bse "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"
sudo service mysql restart

#
# import sakila database
#
mysql -u root -proot < /vagrant/database/sakila.sql

#
# Composer for PHP
#
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

#
# install Vim
#
sudo apt-get -y install vim

#
# Install Sphinx
#
sudo apt-get -y install sphinxsearch
sudo chmod 777 /usr/bin/searchd
sudo chmod 777 /usr/bin/indexer
sudo chmod 777 /var/log/sphinxsearch

#
# Create sphinx.conf based on project configs
#
echo -e "#!/bin/bash\ncat /vagrant/Workshop/Config/*.conf" > /etc/sphinxsearch/sphinx.conf