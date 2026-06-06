#!/bin/sh

# Verify arguments

if [ $# -ne 2 ]; then
echo "Error: Two arguments required."
exit 1
fi

writefile="$1"
writestr="$2"

# Create directory path if it doesn't exist

dirpath=$(dirname "$writefile")

if ! mkdir -p "$dirpath"; then
echo "Error: Failed to create directory path."
exit 1
fi

# Create/overwrite file with content

if ! echo "$writestr" > "$writefile"; then
echo "Error: Failed to create file."
exit 1
fi

exit 0
