#!/bin/bash

# Prompt user for name
read -p "Enter your name: " username

# Main directory
main_dir="submission_reminder_${username}"

# Create structure
mkdir -p "$main_dir/config" "$main_dir/scripts" "$main_dir/data"

# Copy the provided file contents
cat <<EOF > "$main_dir/config/config.env"
# Configuration File
ASSIGNMENT=Assignment_1
REMINDER_DAYS=2
EOF

cat <<EOF > "$main_dir/scripts/functions.sh"
# Your provided functions.sh content goes here
EOF

cat <<EOF > "$main_dir/scripts/reminder.sh"
# Your provided reminder.sh content goes here
EOF

# You will create this manually
cat <<'EOF' > "$main_dir/scripts/startup.sh"
#!/bin/bash
source ../config/config.env
source ./functions.sh
./reminder.sh
EOF

# Populate submissions.txt with sample + 5 more entries
cat <<EOF > "$main_dir/data/submissions.txt"
# Name,Assignment,Submitted
Alice,Assignment_1,Yes
Bob,Assignment_1,No
Charlie,Assignment_1,Yes
Diana,Assignment_1,No
Eve,Assignment_1,Yes
Frank,Assignment_1,No
Grace,Assignment_1,Yes
Heidi,Assignment_1,No
EOF

# Make all .sh scripts executable
find "$main_dir" -type f -name "*.sh" -exec chmod +x {} \;

echo "✅ Environment created in $main_dir"
