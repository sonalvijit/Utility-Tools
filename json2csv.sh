#!/bin/bash

# Initialize variables
JSON_FILE=""

# Parse command-line arguments
while getopts "s:" opt; do
  case ${opt} in
    s )
      JSON_FILE=$OPTARG
      ;;
    \? )
      echo "Usage: $0 -s <source_json_file>"
      exit 1
      ;;
  esac
done

# Check if a source file (JSON file) is provided
if [[ -z "$JSON_FILE" ]]; then
  echo "Error: Source file not provided."
  echo "Usage: $0 -s <source_json_file>"
  exit 1
fi

# Check if the JSON file exists
if [[ ! -f "$JSON_FILE" ]]; then
  echo "Error: File '$JSON_FILE' not found!"
  exit 1
fi

# Extract URLs from the provided JSON file
echo "Extracting URLs from $JSON_FILE..."
jq -r '.results[].url' "$JSON_FILE" > "extracted_urls_$JSON_FILE.txt"

echo "URLs extracted and saved to extracted_urls.txt"
