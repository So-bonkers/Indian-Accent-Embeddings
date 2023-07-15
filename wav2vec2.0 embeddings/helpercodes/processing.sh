#!/bin/bash

# Prompt for the file name (without extension)
read -p "Enter the file name (without extension): " file_name

# Specify the input file directory
input_directory="/home/sksystem/Downloads/all_phonemes_audio_data_Libri/embeddings_MUCS_hindi_codemixed"

# Find the input file
input_file=$(find "$input_directory" -type f -name "${file_name}*" | head -n 1)

# Check if the input file exists
if [ -z "$input_file" ]; then
    echo "Input file not found."
    exit 1
fi

# Prompt for the sequences
echo "Enter the sequences (start_line<tab>end_line) separated by new lines, and type 'end' to finish:"
sequences=()
while true; do
    read -r seq
    if [[ "$seq" == "end" ]]; then
        break
    fi
    sequences+=("$seq")
done

# Specify the output file path
output_file="/home/sksystem/Downloads/phoneme_wav2vec_analysis/100 samples/Libri_phoneme_wise_embeddings/z_Libri.txt"

# Loop through each sequence
for seq in "${sequences[@]}"; do
    # Extract the start and end line numbers
    start_line=$(echo "$seq" | cut -f 1)
    end_line=$(echo "$seq" | cut -f 2)

    # Copy the specified lines to the output file
    sed -n "${start_line},${end_line}p" "$input_file" >> "$output_file"
done

echo "Lines copied successfully to $output_file"
