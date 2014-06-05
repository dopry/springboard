# Clean up
apt-get -y remove \
  dictionaries-common \
	exim4 \
	exim4-base \
	exim4-config \
	exim4-daemon-light \
	gettext-base \
	host \
	iamerican \
	ibritish \
	ienglish-common \
	info \
	install-info \
	iso-codes \
	ispell \
	krb5-locales \
	laptop-detect \
	manpages-dev \
	openssh-blacklist \
	openssh-blacklist-extra \
	perl \
	perl-modules \
	wamerican \

apt-get -y autoremove
apt-get -y clean

# Cleanup Virtualbox
VBOX_VERSION=$(cat .vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
rm $VBOX_ISO

rm -r /usr/share/doc/*
rm -r /var/cache/apt 


# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

