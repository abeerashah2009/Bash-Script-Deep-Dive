#!/bin/bash

user_input="$1"

if [ -z "$user_input" ]; then
    echo "Enter a string:"
    read -r user_input
fi

echo "You entered: $user_input"

string_length=${#user_input}
echo "The length of the string is: $string_length"

substring=${user_input:2:4}
echo "Substring from position 2 to 5 is: $substring"

modified_string=${user_input//abc/xyz}
echo "Modified string: $modified_string"
