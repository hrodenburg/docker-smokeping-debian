#!/bin/sh

# stupid wrapper to run smokeping in daemon-mode (which is needed for a pid
# file, which is needed to succesfully reload when master sends a new config).
# Docker however (and S6 also) expects processes not to fork to background.
# This wrapper will loop forever en exit if smokeping died for some reason.

/usr/sbin/smokeping \
	--master-url=$MASTER_URL \
	--cache-dir=/tmp \
	--shared-secret=/etc/smokeping/slave_secret \
	--pid-dir=/var/run/smokeping

sleep 3

while true; do
	read pid < /var/run/smokeping/smokeping.pid

	[ -d /proc/$pid ] && sleep 30 || exit 1
done

