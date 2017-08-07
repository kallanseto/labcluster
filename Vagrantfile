# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create load balancer
#  config.vm.define :lb do |lb_config|
#      lb_config.vm.box = "ubuntu/trusty64"
#      lb_config.vm.hostname = "lb"
#      lb_config.vm.network :private_network, ip: "10.0.15.11"
#      lb_config.vm.network "forwarded_port", guest: 80, host: 8080
#      lb_config.vm.provider "virtualbox" do |vb|
#        vb.memory = "256"
#      end
#  end

  # Create masters
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..1).each do |i|
    config.vm.define "master#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "master#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
    end
  end

  # Create workers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..1).each do |i|
    config.vm.define "worker#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "worker#{i}"
        node.vm.network :private_network, ip: "10.0.15.3#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
    end
  end

  # create ans node
  config.vm.define :ans do |ans_config|
      ans_config.vm.box = "ubuntu/trusty64"
      ans_config.vm.hostname = "ans"
      ans_config.vm.network :private_network, ip: "10.0.15.10"
      ans_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      ans_config.vm.provision :shell, path: "bootstrap-ans.sh"
  end

end
