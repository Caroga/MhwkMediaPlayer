#!/bin/sh

# This file is to provision the development environment where the host OS is
# windows.

apt-get -q update
apt-get -qy install python-pip
pip -q install ansible

cp -f /vagrant/provisioning/hosts /home/vagrant/hosts
chmod 666 /home/vagrant/hosts
export PYTHONUNBUFFERED=1
su vagrant -c "ansible-playbook /vagrant/provisioning/playbook.yml -i /home/vagrant/hosts --connection=local --limit 'development:&local'"
