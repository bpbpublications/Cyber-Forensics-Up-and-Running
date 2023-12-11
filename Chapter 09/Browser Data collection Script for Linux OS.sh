#!/bin/bash

# Define the destination directory for browser data
DEST_DIR="/path/to/destination_directory"

# Define the source directory (default Chrome profile path)
SOURCE_DIR="$HOME/.config/google-chrome/Default"

# Check if the source directory exists
if [ -d "$SOURCE_DIR" ]; then
    echo "Collecting Chrome data..."
    # Consider adding error handling here, e.g., check if cp was successful
    cp -r "$SOURCE_DIR" "$DEST_DIR" && echo "Data collection complete. Data copied to $DEST_DIR." || echo "Error in copying data."
else
    echo "Chrome data directory not found."
fi