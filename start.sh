#!/bin/bash
echo "Starting CUPS in background..."
/etc/init.d/dbus start
#/etc/init.d/cups start
/usr/sbin/cupsd -f
