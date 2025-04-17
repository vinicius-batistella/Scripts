#!/bin/bash

search_string="$1"
directory="$2"

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Two string parameters required."
  echo "Usage: $0 <domain_to_search> <directory>"
  echo "Example: $0 @domain.com ../"
  exit 1
fi

echo -e "[!] Performing the first part... Wait!\n"

grep -nr "URL: https://login.microsoftonline" $directory -A 2 | grep $search_string -A 1 | sed 's/^.* //g' | sed 's/--//g'

echo -e "[!] First part done. Starting the second one...\n"

grep -nr $search_string $directory | sed -E 's/.*:(.*):([^:]*$)/\1:\2/'

echo -e "[!] Second part done\n"