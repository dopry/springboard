#!/bin/bash -eux

echo "==> Testing Install VMWARE TOOLS: $PACKER_BUILDER_TYPE"
env 
if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then 
    echo "==> Installing VMware Tools"
    apt-get install -y linux-headers-$(uname -r) build-essential perl

    cd /tmp
    mkdir -p /mnt/cdrom
    mount -o loop /home/vagrant/linux.iso /mnt/cdrom
    tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
    /tmp/vmware-tools-distrib/vmware-install.pl -d
    rm /home/vagrant/linux.iso
    umount /mnt/cdrom
    rmdir /mnt/cdrom

    apt-get -y remove linux-headers-$(uname -r) build-essential perl
    apt-get -y autoremove
fi