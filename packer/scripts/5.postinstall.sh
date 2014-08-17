# install php code sniffer
  pear install PHP_CodeSniffer-1.5.1

#install jslint
  if [ ! -d /opt/jslint ]; then
    mkdir /opt/jslint
    wget https://raw2.github.com/douglascrockford/JSLint/master/jslint.js -O /opt/jslint/jslint.js
  fi

# phantomjs for headless local selenium testing.
  if [ ! -d /opt/phantomjs-1.9.7-linux-x86_64 ]; then
    wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 -O /tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2
    bzip2 -d /tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2
    tar -xf /tmp/phantomjs-1.9.7-linux-x86_64.tar -C /opt/
    rm /tmp/phantomjs-1.9.7-linux-x86_64.tar
  fi


  wget http://releases.ansible.com/ansible/ansible-1.6.2.tar.gz -O /usr/local/src/ansible-1.6.2.tar.gz
  tar  -xzf /usr/local/src/ansible-1.6.2.tar.gz -C /usr/local/src/
  cd /usr/local/src/ansible-1.6.2
  make
  make install
 