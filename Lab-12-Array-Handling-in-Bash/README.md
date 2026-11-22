# Lab 12 - Array Handling in Bash

## 1. Introduction

This lab demonstrates how to create, access, loop through, update, and manipulate arrays in Bash scripting.

An array is a variable that can store multiple values under one name.

## 2. Learning Objectives

- Create an indexed array.
- Display the number of array elements.
- Access individual array elements.
- Loop through array elements.
- Add new elements to an array.
- Extract a portion of an array.
- Delete an array element.
- Remove an entire array.

## 3. Environment

- Operating System: Ubuntu 24.04.5 LTS
- Shell: Bash 5.2.21
- Script: `arrays.sh`

## 4. Create an Array

We can create an array by placing values inside parentheses.

```bash
fruits=("apple" "banana" "cherry")
```

Display the array length:

```bash
echo "${#fruits[@]}"
```

Display all elements:

```bash
printf '%s\n' "${fruits[@]}"
```

Expected output:

```text
3
apple
banana
cherry
```

## 5. Loop Through an Array

A `for` loop can access each element of an array.

```bash
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done
```

Expected output:

```text
Fruit: apple
Fruit: banana
Fruit: cherry
```

## 6. Add a New Element

Use `+=` to append a new element.

```bash
fruits+=("mango")
```

Check the updated array:

```bash
echo "${#fruits[@]}"
printf '%s\n' "${fruits[@]}"
```

Expected output:

```text
4
apple
banana
cherry
mango
```

## 7. Access Array Elements

Array indexes start at zero.

```bash
echo "${fruits[0]}"
```

Output:

```text
apple
```

Access the last element using a negative index:

```bash
echo "${fruits[-1]}"
```

Output:

```text
mango
```

## 8. Extract an Array Slice

Use array slicing to extract selected elements.

```bash
printf '%s\n' "${fruits[@]:1:2}"
```

This starts at index 1 and extracts 2 elements.

Expected output:

```text
banana
cherry
```

## 9. Delete an Array Element

Use `unset` to remove an element at a specific index.

```bash
unset 'fruits[1]'
```

Display the remaining elements:

```bash
printf '%s\n' "${fruits[@]}"
```

Expected output:

```text
apple
cherry
mango
```

Display the remaining indexes:

```bash
printf '%s ' "${!fruits[@]}"
```

Output:

```text
0 2 3
```

**Important:** Deleting an element does not automatically renumber the remaining indexes.

## 10. Remove the Entire Array

Use `unset` without an index to remove the complete array.

```bash
unset fruits
echo "${#fruits[@]}"
```

Output:

```text
0
```

## 11. Complete Bash Script

File: `arrays.sh`

```bash
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
```

## 12. Verification Commands

Check Bash syntax:

```bash
bash -n arrays.sh
```

Run the script:

```bash
bash arrays.sh
```

Check executable permission:

```bash
ls -l arrays.sh
```

## 13. Conclusion

In this lab, I learned how to work with indexed arrays in Bash. I practiced array creation, element access, looping, appending, slicing, deleting individual elements, and removing a complete array.

These concepts are useful when writing automation scripts that manage multiple values.
