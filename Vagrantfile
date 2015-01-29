# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Supports local cache, don't wast bandwitdh
  # vagrant plugin install vagrant-cachier
  # https://github.com/fgrehm/vagrant-cachier 
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Set all boxes to have 2GB of ram
  # and 2 CPUS
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end 

  # Define our DB Server
  config.vm.define :db do |db_config|
    # Set a private network ip
    db_config.vm.network :private_network, :ip => '10.20.1.3'

    # Define Hostname
    db_config.vm.hostname = "db"

    # Forwarded ports to the host
    db_config.vm.network :forwarded_port, guest: 3306, host: 33066

    # Provision our server using puppet
    db_config.vm.provision :puppet do |dbpuppet|
      dbpuppet.manifests_path = "puppet/manifests"
      dbpuppet.module_path = "puppet/modules"
      dbpuppet.manifest_file = "db.pp"
    end 
  end

  # Define our Ruby on Rails server
  config.vm.define :rails do |rails_config|
    # Set a private network ip
    rails_config.vm.network :private_network, :ip => '10.20.1.2'

    # Define hostname
    rails_config.vm.hostname = "rails"

    # Forwarded ports to the host
    rails_config.vm.network :forwarded_port, guest: 80, host: 8080     


    # Setup a couple of synced folders
    rails_config.vm.synced_folder '.', '/vagrant', type: 'nfs'      
    rails_config.vm.synced_folder './code', '/home/vagrant/code', type: 'nfs'

    # Provision our server using puppet
    rails_config.vm.provision :puppet do |rpuppet|
      rpuppet.manifests_path = "puppet/manifests"
      rpuppet.module_path = "puppet/modules"
      rpuppet.manifest_file = "rails.pp" 
    end
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
