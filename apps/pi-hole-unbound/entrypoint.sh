#!/bin/sh

# Start crond
crond

# Start unbound
/usr/local/bin/unbound-run &

# Start Pi-hole
/start.sh