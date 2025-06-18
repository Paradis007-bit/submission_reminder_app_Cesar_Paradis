#!/bin/bash

# Set path to the config file
CONFIG_FILE="$(dirname "$0")/../config/config.env"

# Prompt for the new assignment name
read -p "Enter the new assignment name: " new_assignment

# Validate input
if [[ -z "$new_assignment" ]]; then
  echo "Error: Assignment name cannot be empty."
  exit 1
fi

# Escape any double quotes from user input
escaped_assignment=$(printf '%s' "$new_assignment" | sed 's/"/\\"/g')

# Replace the ASSIGNMENT value on line 2 using sed, and wrap it in quotes
sed -i '' "2s|^.*$|ASSIGNMENT=\"$escaped_assignment\"|" "$CONFIG_FILE"

echo "Updated assignment name to '$new_assignment' in config.env."

# Run the startup script
echo "Running the reminder app..."
bash "$(dirname "$0")/startup.sh"
