#!/usr/bin/env bash
version=$(curl -sX GET "https://registry.hub.docker.com/v2/repositories/library/alpine/tags" | jq -r '.results[].name' | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -n 1 2>/dev/null)
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"


