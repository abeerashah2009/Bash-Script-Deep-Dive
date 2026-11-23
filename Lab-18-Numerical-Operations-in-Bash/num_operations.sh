#!/bin/bash

num1=$1
num2=$2

# Prompt when arguments are missing
if [ -z "$num1" ] || [ -z "$num2" ]; then
    read -r -p "Enter two numbers: " num1 num2
fi

# Validate numeric input
re='^-?[0-9]+([.][0-9]+)?$'

if ! [[ $num1 =~ $re && $num2 =~ $re ]]; then
    echo "Error: both inputs must be numeric." >&2
    exit 1
fi

# Check integer inputs
re_int='^-?[0-9]+$'

if [[ $num1 =~ $re_int && $num2 =~ $re_int ]]; then
    is_int=1
else
    is_int=0
fi

# Addition
if [ "$is_int" -eq 1 ]; then
    sum=$((num1 + num2))
else
    sum=$(echo "$num1 + $num2" | bc)
fi
echo "The sum is: $sum"

# Subtraction
if [ "$is_int" -eq 1 ]; then
    difference=$((num1 - num2))
else
    difference=$(echo "$num1 - $num2" | bc)
fi
echo "The difference is: $difference"

# Multiplication
if [ "$is_int" -eq 1 ]; then
    product=$((num1 * num2))
else
    product=$(echo "scale=2; $num1 * $num2" | bc)
fi
echo "The product is: $product"

# Division
if [ "$(echo "$num2 == 0" | bc)" -eq 1 ]; then
    echo "Division by zero is not allowed."
else
    quotient=$(echo "scale=2; $num1 / $num2" | bc)
    echo "The quotient is: $quotient"
fi
