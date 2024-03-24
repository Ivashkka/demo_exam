
######### auto config Makefile ##########

hostname:=$(shell hostname)
CFGDIR:=$(shell pwd)/rootfs/$(hostname)
TMPDIR:=$(hostname)~
REQ_FILE := requirements.txt

PYTHON_VERSION := $(shell python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

all: install

install:
	#check if hostname configured right
	if [ ! -d $(CFGDIR) ]; then echo "Wrong hostname, change it using hostnamectl! exiting"; exit 1; fi
	#install pip
	apt-get install python$(PYTHON_VERSION)-pip
	pip3 install -r $(REQ_FILE)
	mkdir $(TMPDIR)
	rsync $(CFGDIR)/* $(TMPDIR)
clean:
	echo No auto config purge functional. Do it by yourself
