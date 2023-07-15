#!/bin/bash

input_dir="/home/sksystem/Downloads/all_phonemes_audio_data_Libri/126/125084"

# Check if the input directory exists
if [ ! -d "$input_dir" ]; then
  echo "Input directory does not exist: $input_dir"
  exit 1
fi

# Change to the input directory
cd "$input_dir" || exit 1

# Convert .flac files to .wav
for file in *.flac; do
  if [ -f "$file" ]; then
    echo "Converting $file to WAV..."
    ffmpeg -i "$file" "${file%.flac}.wav"
    rm "$file"
  fi
done

echo "Conversion complete!"
