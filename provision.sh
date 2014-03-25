#!/usr/bin/env bash

# check stamp to minimize updates, but allow new deployments to full reprovision on updates.
STAMP=2014032109
if [ ! -e ~/installed_$STAMP ]; then 
  # make sure we're always updating to catch update related breakage.
  apt-get update
   
  # set stamp
  touch ~/installed_$STAMP
fi 

# copy ansible away from vagrant share to work around issue with
# permissions on virtualbox shares. 
sudo -i -u vagrant cp -rp /vagrant/ansible /home/vagrant/
sudo -i -u vagrant chmod 644 /home/vagrant/ansible/inventory/vagrant

# run bootstrap playbook.
sudo -i -u vagrant ansible-playbook  -i /home/vagrant/ansible/inventory/vagrant /home/vagrant/ansible/provision.yml
