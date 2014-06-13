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

########################################################################
# INSTALLATION, includes libstemmer because it's the edge repo :D
########################################################################

echo 'Installing DAILY build of SphinxSearch...'

VERSION_NAME=`cat /etc/lsb-release | grep CODENAME | awk -F '=' '{print $2}'`

if [ $(cat /etc/apt/sources.list | grep "deb http://ppa.launchpad.net/builds/sphinxsearch" | wc -w) = "0" ];
then
  echo "deb http://ppa.launchpad.net/builds/sphinxsearch-daily/ubuntu $VERSION_NAME main" >> /etc/apt/sources.list
fi

if [ $(cat /etc/apt/sources.list | grep "deb-src http://ppa.launchpad.net/builds/sphinxsearch" | wc -w) = "0" ];
then
  echo "deb-src http://ppa.launchpad.net/builds/sphinxsearch-daily/ubuntu $VERSION_NAME main" >> /etc/apt/sources.list
fi  

sudo apt-get update
sudo apt-get install sphinxsearch mysql-client mysql-server

#
# Create sphinx.conf based on project configs
#
echo -e "#!/bin/bash\ncat /vagrant/src/Workshop/Config/*.conf" > /etc/sphinxsearch/sphinx.conf
