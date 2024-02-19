
######### auto config Makefile ##########

hostname:=$(shell hostname)
CFGDIR:=$(shell pwd)/source_cfg/$(hostname)
APTREQ:=$(shell pwd)/source_cfg/$(hostname)-req.txt
DISTDIR:=/

all: install

install:
	#check if hostname configured right
	if [ ! -d $(CFGDIR) ]; then echo "Wrong hostname, change it using hostnamectl! exiting"; exit 1; fi
	echo Auto configuring $(hostname)...
	#install all requirements
	xargs apt -y install < $(APTREQ)
	#cp all files to /
	cp -r $(CFGDIR)/* $(DISTDIR)
	#change some special file owner info
	if [ -d /etc/bind ]; then chown -R root:bind /etc/bind /var/cache/bind; chown -R bind:bind /etc/bind/zones; chown bind:bind /var/cache/bind/*; fi
	if [ -d /etc/frr ]; then chown -R frr:frr /etc/frr; fi
	#reload systemd units
	systemctl daemon-reload
	#enable common systemd services
	systemctl enable nftables.service
	systemctl enable ssh.service
	#reboot host
	reboot
clean:
	echo No auto config purge functional. Do it by yourself
