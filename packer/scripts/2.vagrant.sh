# Set up Vagrant.
date > /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant
adduser sudo vagrant
adduser adm vagrant

# Install vagrant keys for vagrant
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
curl -Lo /home/vagrant/.ssh/id_rsa 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant'
curl -Lo /home/vagrant/.ssh/id_rsa.pub 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant'
ssh-keyscan -t rsa,dsa 127.0.0.1  2>&1 > /home/vagrant/.ssh/known_hosts

chmod 0600 /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/id_rsa
chmod 0644 /home/vagrant/.ssh/id_rsa.pub
chmod 0644 /home/vagrant/.ssh/known_hosts

chown -R vagrant:vagrant /home/vagrant/.ssh

# Install vagrant keys for root
mkdir -pm 700 /root/.ssh
curl -Lo /root/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
curl -Lo /root/.ssh/id_rsa 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant'
curl -Lo /root/.ssh/id_rsa.pub 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant'
ssh-keyscan -t rsa,dsa 127.0.0.1  2>&1 > /root/.ssh/known_hosts

chmod 0600 /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/id_rsa
chmod 0644 /root/.ssh/id_rsa.pub
chmod 0644 /root/.ssh/known_hosts
chown -R root:root /root/.ssh

# Customize the message of the day
echo 'Springboard! Jump in!' > /var/run/motd
