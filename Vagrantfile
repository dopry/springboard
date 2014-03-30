# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "wheezy" do |app|
    build_number = ENV["BUILD_NUMBER"]
    app.vm.box = "springboard/debian64-wheezy-0.0.#{build_number}"
    app.vm.box_url = "file://./packer/springboard-wheezy-virtualbox-0.0.#{build_number}.box"
    app.ssh.forward_agent = true
    app.vm.provision "shell", path: "provision.sh"
    app.vm.hostname = "wheezy"
    app.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.customize ["modifyvm", :id, "--cpus", 2]
    end
  end
  #config.vm.define "ubuntu64-saucy" do |app|
  #  app.vm.box = "springboard/ubuntu64-wheezy"
  #  app.vm.box_url = "https://vagrantcloud.com/springboard/ubuntu64-wheezy/version/1/provider/#virtualbox.box"
  #  app.ssh.forward_agent = true
  #  app.vm.provision "shell", path: "provision.sh"
  #  app.vm.hostname = "ubuntu64-saucy"
  #  app.vm.provider "virtualbox" do |v|
  #    v.memory = 512
  #    v.customize ["modifyvm", :id, "--cpus", 2]
  #  end
  #end
end
