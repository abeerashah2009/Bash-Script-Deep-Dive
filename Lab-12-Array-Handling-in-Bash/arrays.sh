#!/usr/bin/env bash

# Task 1: create the array
fruits=("apple" "banana" "cherry")

echo "Fruits array has ${#fruits[@]} elements:"
printf '%s\n' "${fruits[@]}"

# Task 2: loop
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done

# Task 3: append
fruits+=("mango")

echo "Updated Fruits array has ${#fruits[@]} elements:"
printf '%s\n' "${fruits[@]}"

# Task 3.3: array manipulation
echo "First: ${fruits[0]}  Last: ${fruits[-1]}"

echo "Slice (2 elements from index 1):"
printf '%s\n' "${fruits[@]:1:2}"

unset 'fruits[1]'
echo "After deleting index 1 there are ${#fruits[@]} elements:"
printf '%s\n' "${fruits[@]}"

echo "Remaining indexes:"
printf '%s ' "${!fruits[@]}"
echo

unset fruits
echo "After unset fruits: ${#fruits[@]} elements"
