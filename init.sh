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
# INSTALLATION
########################################################################

echo 'Installing last release of SphinxSearch...'

sudo add-apt-repository ppa:builds/sphinxsearch-rel21

sudo apt-get -y update

sudo apt-get -y install sphinxsearch mysql-client mysql-server

if [ ! -d /var/run/sphinxsearch ]
then
    sudo mkdir /var/run/sphinxsearch
fi

#
# Create sphinx.conf based on project configs
#
if [ -f /etc/sphinxsearch/sphinx.conf ];
then
    sudo mv /etc/sphinxsearch/sphinx.conf /etc/sphinxsearch/sphinx_old.conf
fi

sudo ln -s /vagrant/config/sphinx.conf /etc/sphinxsearch/sphinx.conf
