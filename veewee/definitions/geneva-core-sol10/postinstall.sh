#!/bin/sh

## Tag version
date > /etc/vagrant_box_build_time



## Add the opencsw package site
PATH=/usr/bin:/usr/sbin:$PATH
export PATH

yes|/usr/sbin/pkgadd -d http://mirror.opencsw.org/opencsw/pkgutil-`uname -p`.pkg all
/opt/csw/bin/pkgutil -U

# get 'sudo'
/opt/csw/bin/pkgutil -y -i CSWsudo
chgrp 0 /etc/opt/csw/sudoers
ln -s /etc/opt/csw/sudoers /etc/sudoers
# get 'wget', 'GNU tar' and 'GNU sed' (also needed for Ruby)
/opt/csw/bin/pkgutil -y -i CSWwget CSWgtar CSWgsed CSWvim

# Add 'vagrant' to sudoers as well
test -f /etc/sudoers && grep -v "vagrant" "/etc/sudoers" 1>/dev/null 2>&1 && echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers



# Installing vagrant keys
mkdir ${HOME}/.ssh
chmod 700 ${HOME}/.ssh
cd ${HOME}/.ssh
/opt/csw/bin/wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chown -R vagrant:other ${HOME}/.ssh

# Speed up SSH by disabling DNS checks for clients
echo "LookupClientHostnames=no" >> /etc/ssh/sshd_config

/opt/csw/bin/pkgutil -y -i CSWgsed

## Fix the shells to include the /opt/csw and /usr/ucb directories
/opt/csw/bin/gsed -i -e 's#^\#PATH=.*$#PATH=/opt/csw/bin:/usr/sbin:/usr/bin:/usr/ucb#g' \
    -e 's#^\#SUPATH=.*$#SUPATH=/opt/csw/bin:/usr/sbin:/usr/bin:/usr/ucb#g' /etc/default/login
/opt/csw/bin/gsed -i -e 's#^\#PATH=.*$#PATH=/opt/csw/bin:/usr/sbin:/usr/bin:/usr/ucb#g' \
    -e 's#^\#SUPATH=.*$#SUPATH=/opt/csw/bin:/usr/sbin:/usr/bin:/usr/ucb#g' /etc/default/su



## Add the CSW libraries to the LD path
/usr/bin/crle -u -l /opt/csw/lib



## Installing the virtualbox guest additions (from the ISO)
#
VBOX_VERSION=`cat $HOME/.vbox_version`
cd /tmp
mkdir vboxguestmnt
mount -F hsfs -o ro `lofiadm -a $HOME/VBoxGuestAdditions_${VBOX_VERSION}.iso` /tmp/vboxguestmnt
cp /tmp/vboxguestmnt/VBoxSolarisAdditions.pkg /tmp/.
/usr/bin/pkgtrans VBoxSolarisAdditions.pkg . all
yes|/usr/sbin/pkgadd -d . SUNWvboxguest

umount /tmp/vboxguestmnt
lofiadm -d /dev/lofi/1



## Add loghost to /etc/hosts
/opt/csw/bin/gsed -i -e 's/localhost/localhost loghost/g' /etc/hosts


# setup geneva specific items..

# setup shm limits for geneva.
/usr/sbin/projmod -s -K "project.max-shm-ids=(priv,4096,deny)" default

## GB should be set to the amount of ram on the server.
/usr/sbin/projmod -s -K "project.max-shm-memory=(priv,4GB,deny)" default

## TODO: set based on memory
## look into erb support for postinstall files.
### 8-16GB 2147483648
### 17-32GB 4294967296
### 33-64GB 8589934592
### 65-128GB 17179869184
### 129-256GB 34359738368
### 257GB-1TB 68719476736
echo  "set zfs:zfs_arc_max=2147483648" > /etc/system

## TODO: Set swap space.
### MAX(16GB, .33*RAM)

# install geneva in $HOME/advent since the VM allocates most space to home by default.
mkdir /export/home/vagrant/advent
# link to geneva from /usr/advent to meet spec.
mkdir /usr/advent
# for example: 
# ln -s /export/home/vagrant/advent/geneva-{version} /usr/advent
# echo GVHOME=/usr/advent/geneva-{version} > $HOME/.profile

## install developer tools. 
pkgutil -y -i CSWgit

exit