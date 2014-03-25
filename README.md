# Springboard

Springboard is a collection of web developer focused vagrant baseboxes. Springboard base boxes provide python, nodejs, and php languages. The boxes use ansible for configuration, are regularly updates, and provide a number of other small conveniences. Springboard Boxes are designed to minimize the amount of time between a vagrant destroy and a vagrant up.  

This repository contains:

* /packer - packer definitions for boxes. 
* /ansible - ansible playbooks and roles for setting up an environment.
* /bootstrap.sh
* /Vagrantfile - Example vagrant file for all boxes

You can use packer to build the VM's yourself or you can use the images hosted on [Vagrant Cloud](http://vagrantcloud.com).

## Installed Packages

* PHP 5.4, distribution version
  * Pear, distribution version
  * PHP Codesniffer, 1.5.1
  * PHP5 GD2, distribution version
  * PHP5 imap, distribution version
  * PHP5 mysql, distribution version
  * PHP5 xdebug, distribution version
  * PHP5 xsl, distribution version
  * PHPUnit, distribution version
  * PHPUnit Selenium, distribution version
* NodeJS, distribution version
  * NPM, distribution version
  * JSLint, https://raw2.github.com/douglascrockford/JSLint/master/jslint.js
* Python, distribution version
  * Python Jinja2, distribution version
  * Python YAML, distribution version
* Selenium Server, 2.35.0
  * PhantomJS, 1.9.7
  * iceweasel, distribution version
* Ansible, 1.4.5
* Mysql Server, distribution version
* Git, distribution version
* Postfix, distribution version
* Apache2, distribution version 
  * Mod PHP, distribution version

## Contributing

Springboard needs you! We want your feedback and pull requests. Springboard is driven by a few core concepts.

* Use distribution packages for features where possible.
* Remove unnecessary packages where it doesn't hamper the development experience.
* Add features that reduce the work and time necessary for development.
* Vagrants should be re-usable both for CI and production.
