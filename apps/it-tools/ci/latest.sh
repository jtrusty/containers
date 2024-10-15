#!/usr/bin/env bash
version=$(curl -sX GET "https://github.com/CorentinTh/it-tools/releases" | grep -oP '(v(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)-(?<revision>.*)).*(?=</h2>)' | sort -V | tail -n 1 2>/dev/null)
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
