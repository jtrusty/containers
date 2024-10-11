#!/usr/bin/env bash
version=$(curl -sX GET "https://github.com/CorentinTh/it-tools/releases" | grep -oP '(v(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)-(?<revision>.*)).*(?=</h2>)' | head -n 1)
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
