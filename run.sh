#!/bin/sh

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
