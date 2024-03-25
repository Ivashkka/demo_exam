#!/bin/bash

rm -rf /etc/NetworkManager/system-connections/Пр*
chown root:root /etc/NetworkManager/system-connections/*.nmconnection
chmod 600 /etc/NetworkManager/system-connections/*.nmconnection
