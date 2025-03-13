#!/bin/bash

# This script copies all pattern directories from the repository to the Fabric patterns directory
# Usage: copy-patterns.sh [source_directory] [destination_directory]

# Get the source and destination directories
if [ -z "$1" ]; then
  # If no source directory is provided, use the git repository root
  source_dir=$(git rev-parse --show-toplevel)
else
  source_dir="$1"
fi

if [ -z "$2" ]; then
  # If no destination directory is provided, use the default Fabric patterns directory
  dest_dir="$HOME/.config/fabric/patterns"
else
  dest_dir="$2"
fi

# Create the destination directory if it doesn't exist
mkdir -p "$dest_dir"

echo "Copying patterns from $source_dir to $dest_dir"

# Find all directories in the repository (excluding .git and .hooks)
for dir in $(find "$source_dir" -maxdepth 1 -type d | grep -v "^$source_dir$" | grep -v "^$source_dir/.git$" | grep -v "^$source_dir/.hooks$" | grep -v "^$source_dir/pattern_template$"); do
  dir_name=$(basename "$dir")
  echo "Copying directory: $dir_name"
  
  # Use rsync to copy the directory to the destination
  rsync -a "$dir/" "$dest_dir/$dir_name/"
done

echo "Successfully copied patterns to $dest_dir"
