# -*- mode: ruby -*-
# vi: set ft=ruby :


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "avenuefactory/lamp"
  config.vm.box_url = "https://vagrantcloud.com/avenuefactory/lamp/version/4/provider/virtualbox.box"
  config.vm.box_url = "http://avenuefactory-vagrant.s3.amazonaws.com/avenuefactory-lamp-0.1.3.box"
  config.vm.network "private_network", ip: "192.168.56.99"

  # Provisioning Script
  # --------------------
  config.vm.provision "shell", path: "init.sh"

  # Synced Folder
  # --------------------
  config.vm.synced_folder ".", "/vagrant/", :mount_options => [ "dmode=777", "fmode=666" ]

end
