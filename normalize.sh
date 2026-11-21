#!/bin/bash
# Osama Qasem
# Normalize copied visible text from the IANA HTTP status code webpage.
# Usage: ./normalize.sh raw_data.txt > normalized.csv
# Read each line, ignore headings and code ranges, and print CSV records.

if [ "$#" -ne 1 ] || [ ! -f "$1" ]; then
    echo "Usage: $0 input.txt" >&2
    exit 1
fi

printf 'Code,Description,Reference\n'

while IFS='|' read -r code description reference; do
    # Keep only lines starting with an individual three-digit HTTP code.
    code=$(echo "$code" | xargs)
    [[ "$code" =~ ^[0-9]{3}$ ]] || continue

    # Remove extra spaces from the remaining fields.
    description=$(echo "$description" | xargs)
    reference=$(echo "$reference" | xargs)

    # Quote CSV text fields because some descriptions contain commas.
    printf '%s,"%s","%s"\n' "$code" "$description" "$reference"
done < "$1"
