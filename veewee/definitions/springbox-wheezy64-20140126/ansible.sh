 wget http://ansibleworks.com/releases/ansible-1.4.4.tar.gz -O /opt/ansible-1.4.4.tar.gz
 tar -C /opt -xzf /opt/ansible-1.4.4.tar.gz
 ln -s /opt/ansible-1.4.4 /opt/ansible
 echo PATH="$PATH:/opt/ansible/bin" >> /etc/profile.d/ansible.sh