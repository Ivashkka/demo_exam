#!/bin/bash
echo "starting backup script at $(date +"%d.%m.%y")"
src="/etc"
dest="/opt/backup"

mkdir -p $dest
tar -czf $dest/$(hostname -s)-$(date +"%d.%m.%y").tgz $src
echo "done!"
