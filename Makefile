
######### auto config Makefile ##########

hostname:=$(shell hostname)
CFGDIR:=$(shell pwd)/rootfs/$(hostname)
TMPDIR:=$(shell pwd)/$(hostname)~
REQ_FILE := $(shell pwd)/requirements.txt

PYTHON_VERSION := $(shell python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

all: install

install:
	#check if hostname configured right
	if [ ! -d $(CFGDIR) ]; then echo "Wrong hostname, change it using hostnamectl! exiting"; exit 1; fi
	#install pip
	apt-get install python3-module-pip
	pip3 install -r $(REQ_FILE)
	rm -rf $(TMPDIR)
	mkdir $(TMPDIR)
	rsync -r $(CFGDIR)/* $(TMPDIR)
	python3 autoconfigure.py
clean:
	echo No auto config purge functional. Do it by yourself
