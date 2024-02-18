
######### auto config Makefile ##########

hostname:=$(shell hostname)
CFGDIR:=$(shell pwd)/source_cfg/$(hostname)/*
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
	cp -r $(CFGDIR) $(DISTDIR)
	#reload systemd units
	systemctl daemon-reload
	#reboot host
	reboot
clean:
	echo No auto config purge functional. Do it by yourself
