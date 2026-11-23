#!/bin/bash

# Task 2: store current date
CURRENT_DATE="$(date)"
echo "Today is $CURRENT_DATE"

# Formatted date
echo "ISO date: $(date +%F)"

# Nested command substitution
echo "Length of that date string: $(echo -n "$(date +%F)" | wc -c)"

# Task 3: command substitution with other commands
USER_NAME="$(whoami)"
echo "Current user: $USER_NAME"

CURRENT_DIR="$(pwd)"
echo "Current directory: $CURRENT_DIR"

KERNEL_VERSION="$(uname -r)"
echo "Kernel Version: $KERNEL_VERSION"

FILE_COUNT="$(ls | wc -l)"
echo "Files in this directory: $FILE_COUNT"
