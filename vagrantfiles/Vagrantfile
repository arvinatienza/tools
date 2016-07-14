# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT
    echo "Installing required programs..."
    {
        apt-get update 
        apt-get install -y \
            curl python-software-properties build-essential \
            vim tmux git mysql-client \
            php5 nodejs ruby 
        apt-get clean
        rm -rf /var/lib/apt/lists/*
        ps aux | grep 'sshd:' | awk '{print $2}' | xargs kill
    } > /dev/null
    exit 0
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "ARA_Projects"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "10.10.29.10"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision "docker"
  config.vm.provision "shell", inline: $script
end
