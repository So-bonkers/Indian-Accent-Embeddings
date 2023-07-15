#!/bin/bash

directory="/home/sksystem/Downloads/all_phonemes_audio_data_Libri/embeddings_MUCS_hindi_codemixed"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory not found."
    exit 1
fi

# Change to the specified directory
cd "$directory" || exit 1

# Rename the files
for file in *; do
    if [ -f "$file" ]; then
        new_name=$(echo "$file" | cut -d "_" -f 1-1)
        mv "$file" "$new_name"
        echo "Renamed $file to $new_name"
    fi
done

echo "File renaming completed."
