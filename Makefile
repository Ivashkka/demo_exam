
######### auto config Makefile ##########

all: install

install:
	#check if hostname configured right
	if [ ! -d "source_cfg/$(hostname)" ]; then echo "Wrong hostname, change it using hostnamectl! exiting"; exit 1; fi
	echo Auto configuring $(hostname)...
	#install all requirements
	apt install < source_cfg/$(hostname)-req.txt
	#cp all files to /
	cp -r source_cfg/$(hostname) /
	#reload systemd units
	systemctl daemon-reload
	#reboot host
	reboot
clean:
	echo No auto config purge functional. Do it by yourself
