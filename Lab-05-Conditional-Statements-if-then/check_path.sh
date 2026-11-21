#!/bin/bash

TARGET="example.txt"

if [ -f "$TARGET" ]; then
  echo "$TARGET is a file."
elif [ -d "$TARGET" ]; then
  echo "$TARGET is a directory."
else
  echo "$TARGET not found."
fi
