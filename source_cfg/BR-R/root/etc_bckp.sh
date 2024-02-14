#!/bin/bash

src="/etc"
dest="/opt/backup"

mkdir -p $dest
tar -czf $dest/$(hostname -s)-$(date +"%d.%m.%y").tgz $src
