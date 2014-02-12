# Clean up
apt-get -y remove \
	build-essential \
	apt-listchanges \
	at \
	bc \
	bind9-host \
	bsd-mailx \
	curl \
	db5.1-util \
	dc \
	debconf-utils \
	debian-faq \
	dictionaries-common \
	dnsutils \
	doc-debian \
	dmsetup \
	dselect \
	eject \
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
	libalgorithm-diff-perl \
	libalgorithm-diff-xs-perl \
	libalgorithm-merge-perl \
	libasprintf0c2 \
	libbind9-80 \
	libc-dev-bin \
	libc6-dev:amd64 \
	libcap2:amd64 \
	libclass-isa-perl \
	libcurl3:amd64 \
	libdevmapper1.02.1 \
	libdevmapper-event1.02.1:amd64 \
	libdns88 \
	libdpkg-perl \
	libevent-2.0-5:amd64 \
	libfile-fcntllock-perl \
	libfreetype6 \
	libfuse2 \
	libgc1c2 \
	libgeoip1 \
	libgssglue1:amd64 \
	libisc84 \
	libisccc80 \
	libisccfg82 \
	libldap-2.4-2:amd64 \
	liblocale-gettext-perl \
	liblockfile-bin \
	liblockfile1:amd64 \
	liblwres80 \
	libnfsidmap2:amd64 \
	libopts25 \
	libpcre3:amd64 \
	libreadline-gplv2-dev:amd64 \
	libreadline5:amd64 \
	librtmp0:amd64 \
	libsasl2-2:amd64 \
	libsasl2-modules:amd64 \
	libssh2-1:amd64 \
	libssl-dev \
	libssl-doc \
	libswitch-perl \
	libtimedate-perl \
	libtinfo-dev:amd64 \
	libtirpc1:amd64 \
	libxml2:amd64 \
	linux-libc-dev:amd64 \
	lsb-release \
	lsof \
	lvm2 \
	m4 \
	make \
	manpages-dev \
	mlocate \
	nano \
	ncurses-term \
	nfs-common \
	ntp \
	openssh-blacklist \
	openssh-blacklist-extra \
	os-prober \
	patch \
	perl \
	perl-modules \
	psmisc \
	python-apt \
	python-apt-common \
	python-chardet \
	python-debian \
	python-debianbts \
	python-fpconst \
	python-reportbug \
	python-soappy \
	python2.6 \
	python2.6-minimal \
	reportbug \
	rpcbind \
	rsync \
	sgml-base \
	tasksel \
	telnet \
	texinfo \
	time \
	unzip \
	util-linux-locales \
	w3m \
	wamerican \
	whois \
	xml-core \
	zlib1g-dev:amd64

apt-get -y autoremove
apt-get -y clean

# remove non-english man pages
#rm -r /usr/share/man/??
#rm -r /usr/share/man/??_*

# remove locales
#rm -r /usr/share/locale/*

# remove docs.
rm -r /usr/share/doc/*

# remove apt lists
rm -r /var/cache/apt /var/lib/apt/lists

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

