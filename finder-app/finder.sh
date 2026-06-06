#!/bin/sh

# Check number of arguments

if [ $# -ne 2 ]; then
echo "Error: Two arguments required."
exit 1
fi

filesdir="$1"
searchstr="$2"

# Verify filesdir exists and is a directory

if [ ! -d "$filesdir" ]; then
echo "Error: $filesdir is not a directory."
exit 1
fi

# Count files recursively

file_count=$(find "$filesdir" -type f | wc -l)

# Count matching lines recursively

match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match_count"
