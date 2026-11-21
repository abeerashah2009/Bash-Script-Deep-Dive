#!/bin/bash
# This script checks if a number is above, below, or exactly 10.

if [ -z "$1" ]; then
    echo "No number provided. Usage: ./numbercheck.sh <number>"
    exit 1
fi

number=$1

if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
    echo "Invalid input: '$number' is not an integer."
    exit 1
fi

if [ "$number" -gt 10 ]; then
    echo "Above 10"
elif [ "$number" -eq 10 ]; then
    echo "Exactly 10"
else
    echo "Below 10"
fi
