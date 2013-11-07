# Spring Board

Spring Board is a devops friendly starting point for our development projects. It incorporates:

* [veewee](https://github.com/jedi4ever/veewee) - Build and bootstap development virtual machines for vagrant.
* [vagrant](http://vagrantup.com) - conveniently manage virtual machines on development workstations.
* [docker](https://www.docker.io/) - manage linux containers to isolate applications on hosts.
* [ansible](http://www.ansibleworks.com/) - manage hosts and servers post deployment.

These tools allow developers to create production like environments on their own desktops and it allows 
systems administrators to seed configuration changes into the continuous integration pipeline for testing
before deployment. 

## Overview

### Setting up a new Spring Board Project

When setting up a new project you need to.

1. Design application architecture
1. Create host templates for veewee.
1. Model a local environment using VagrantFile to specify hosts and networking options.
1. Define environment configuration using Ansible. 
1. Define application containers for Docker.

### Developing on a Spring Board Project

1. Checkout Project.
1. Build veewee host templates
1. Vagrant Up
1. Code and Commit.


### Continuous Integration and Deployment

1. Check out latest release.
1. Run Unit Tests against code.
1. Build veewee vagrant boxes if /veewee/* changes.
1. Vagrant Up a UAT/E2E testing environment.
1. Package boxes, containers, and apps for release.




## User Stories

1. Developers need to make configuration changes but want to have them vetted before releasing to production.
   
   With Spring Board developers update the veewee definitions, ansible 
