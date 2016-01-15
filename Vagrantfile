# -*- mode: ruby -*-
# vi: set ft=ruby :

APP_NAME = "lapp-with-ansible"
HOST_NAME = APP_NAME + ".dev"
VM_IP = "192.168.34.200"

Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.provider :virtualbox do |provider, override|
    provider.name = APP_NAME
    provider.memory = 1024
  end

  #config.vm.box = "bento/centos-7.1"
  config.vm.box = "opscode-centos65"
  config.vm.hostname = HOST_NAME
  config.vm.network :private_network, ip: VM_IP

  config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=777", "fmode=666"]

  config.vm.provision :ansible_local do |ansible|
    ansible.playbook       = "provision/vagrant.yml"
    ansible.verbose        = true
    ansible.install        = true
    ansible.limit          = "all"
  end
#  config.vm.provision "shell", inline: <<-SHELL
#    #yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
#    yum -y install ansible libselinux-python
#    cd /vagrant/provision; ansible-playbook -c local vagrant.yml
#  SHELL
end
