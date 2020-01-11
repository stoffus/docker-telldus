#!/bin/sh
# Mostly borrowed from https://github.com/home-assistant/hassio-addons/tree/master/tellstick

set -e

if [ -e /tmp/TelldusClient ]; then
    rm /tmp/TelldusClient
fi

if [ -e /tmp/TelldusEvents ]; then
    rm /tmp/TelldusEvents
fi

socat TCP-LISTEN:50800,reuseaddr,fork UNIX-CONNECT:/tmp/TelldusClient &
socat TCP-LISTEN:50801,reuseaddr,fork UNIX-CONNECT:/tmp/TelldusEvents &

/usr/sbin/telldusd --nodaemon
