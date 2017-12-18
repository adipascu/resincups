#!/bin/bash
if [ -f "/data/cups.tgz" ]
then
  echo "Updating cups config."
  tar zxvpf /data/cups.tgz
fi
echo "Starting CUPS in background..."
/etc/init.d/dbus start
#/etc/init.d/cups start
/usr/sbin/cupsd -f
