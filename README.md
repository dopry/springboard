# Springboard

Springboard is a collection of web developer focused vagrant baseboxes. Springboard base boxes provide python, nodejs, and php languages. The boxes use ansible for configuration, are regularly updates, and provide a number of other small conveniences. Springboard Boxes are designed to minimize the amount of time between a vagrant destroy and a vagrant up.  

This repository contains:

* /packer - packer definitions for boxes. 
* /ansible - ansible playbooks and roles for setting up an environment.
* /bootstrap.sh
* /Vagrantfile - Example vagrant file for all boxes

You can use packer to build the VM's yourself or you can use the images hosted on [Vagrant Cloud](http://vagrantcloud.com).

## Installed Packages

* PHP, distribution version
  * Pear, distribution version
  * PHP Codesniffer, 1.5.1
* NodeJS, distribution version
  * NPM, distribution version
  * JSLint, https://raw2.github.com/douglascrockford/JSLint/master/jslint.js
* Python, distribution version
* Java, distribution version
* Selenium Server, 
* PhantomJS, 1.9.7
* Ansible, 1.4.5

