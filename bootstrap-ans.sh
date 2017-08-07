#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  ans
10.0.15.11  lb
10.0.15.21  master1
10.0.15.22  master2
10.0.15.23  master3
10.0.15.31  worker1
10.0.15.32  worker2
10.0.15.33  worker3
10.0.15.34  worker4
10.0.15.35  worker5
EOL

# Copy ansible.cfg, inventory.ini, base playbooks
cp /vagrant/ansible.cfg /home/vagrant
cp /vagrant/inventory.ini /home/vagrant
cp /vagrant/ssh-addkey.yml /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# Collect fingerprints
su - vagrant -c "ssh-keyscan master1 worker1 >> /home/vagrant/.ssh/known_hosts"

# Generate ssh key for ansible user
su - vagrant -c "ssh-keygen -f /home/vagrant/.ssh/id_rsa -t rsa -b 2048 -N \"\""
