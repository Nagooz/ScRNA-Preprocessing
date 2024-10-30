#!/bin/bash

# Use the first argument as the directory path
path="$1"

# Check if the path was provided
if [ -z "$path" ]; then
    echo "Usage: ./rename_fastq.sh /path/to/your/files"
    exit 1
fi

# Loop through each .fq file
for file in "$path"/*.fq.gz; do
    filename=$(basename "$file")
    # Extract relevant parts, including lane and read direction
    if [[ $filename =~ ^(ASC|F|FAP)_([0-9]+h|CTL|Ctrl)_L([0-9]+)_([0-9])\.fq\.gz$ ]]; then
        timepoint="${BASH_REMATCH[2]}"
        lane=$(printf "%03d" ${BASH_REMATCH[3]})
        read_direction="${BASH_REMATCH[4]}"
        read="R${read_direction}"
        new_filename="${BASH_REMATCH[1]}_${timepoint}_S1_L${lane}_${read}_001.fastq.gz"
        mv "$file" "$path/$new_filename"
        echo "Renamed '$filename' to '$new_filename'"
    fi
done
