#!/bin/sh

# Download the root hints
wget https://www.internic.net/domain/named.root -qO- | tee /var/lib/unbound/root.hints