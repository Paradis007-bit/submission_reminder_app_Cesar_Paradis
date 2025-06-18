#!/bin/bash

# Get the directory this script is in
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Source the config and functions using full paths
source "$BASE_DIR/config/config.env"
source "$BASE_DIR/modules/functions.sh"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $REMINDER_DAYS days"
echo "--------------------------------------------"

check_submissions "$BASE_DIR/assets/submissions.txt"
