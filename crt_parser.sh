#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: The domain parameters required."
  echo "Usage: ./parser.sh <domain_to_search>"
  echo "Example: ./parser.sh @domain.com"
  exit 1
fi

domain="$1"

curl -s https://crt.sh/?q=$domain | grep $domain | grep '<TD>' | sort -u | sed 's/<BR>/\n/g' | sed 's/<TD>//g' | sed 's/<\/TD>//g' | sed 's/ //g' | sort -u