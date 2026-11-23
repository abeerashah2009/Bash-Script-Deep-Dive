#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>" >&2
    exit 1
fi

DIRECTORY="$1"

if [ -d "$DIRECTORY" ]; then
    echo "Directory exists."
else
    echo "Error: Directory '$DIRECTORY' does not exist." >&2
    echo "Please create it (mkdir -p '$DIRECTORY') before proceeding." >&2
    exit 2
fi
