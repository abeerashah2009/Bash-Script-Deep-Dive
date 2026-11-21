# Lab 06: Else and Elif Usage

## 1. Introduction

In this lab, I learned how to use `if`, `elif`, and `else` conditional statements in Bash scripting.

I created a script named `numbercheck.sh` that checks whether a given number is above, below, or exactly 10.

## 2. Lab Objectives

- Understand `if`, `elif`, and `else`.
- Learn decision-making in Bash.
- Accept command-line arguments.
- Validate integer input.
- Compare numbers using conditional operators.

## 3. Understanding Conditional Statements

### if

The `if` statement checks whether a condition is true.

### elif

The `elif` statement checks another condition if the previous condition is false.

### else

The `else` statement runs when all previous conditions are false.

## 4. Bash Comparison Operators

| Operator | Meaning |
|---|---|
| `-gt` | Greater than |
| `-eq` | Equal to |
| `-lt` | Less than |

## 5. Create the Lab Workspace

```bash
mkdir -p ~/elif-lab
cd ~/elif-lab
```

## 6. Create the Bash Script

File name: `numbercheck.sh`

```bash
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
```

## 7. Understand Input Validation

The script checks whether the user provided an argument:

```bash
if [ -z "$1" ]; then
    echo "No number provided."
    exit 1
fi
```

It also checks whether the input is an integer:

```bash
if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
    echo "Invalid input"
    exit 1
fi
```

This prevents errors when someone enters text instead of a number.

## 8. Make the Script Executable

```bash
chmod +x numbercheck.sh
ls -l numbercheck.sh
```

The executable permission allows us to run the script directly.

## 9. Execute the Script

### Test 1: Number Greater Than 10

Command:

```bash
./numbercheck.sh 15
```

Output:

```text
Above 10
```

### Test 2: Number Equal to 10

Command:

```bash
./numbercheck.sh 10
```

Output:

```text
Exactly 10
```

### Test 3: Number Below 10

Command:

```bash
./numbercheck.sh 5
```

Output:

```text
Below 10
```

### Test 4: No Argument

Command:

```bash
./numbercheck.sh
```

Output:

```text
No number provided. Usage: ./numbercheck.sh <number>
```

### Test 5: Invalid Input

Command:

```bash
./numbercheck.sh abc
```

Output:

```text
Invalid input: 'abc' is not an integer.
```

## 10. Verify All Conditional Branches

Commands:

```bash
./numbercheck.sh 15 | grep -x 'Above 10'
./numbercheck.sh 10 | grep -x 'Exactly 10'
./numbercheck.sh 5 | grep -x 'Below 10'
```

All three conditional branches were verified successfully.

## 11. Syntax Validation

Command:

```bash
bash -n numbercheck.sh
```

Result:

Bash syntax validation passed.

## 12. Key Learning Points

- `if` checks the first condition.
- `elif` checks another condition.
- `else` handles the remaining cases.
- `-gt` means greater than.
- `-eq` means equal to.
- Input validation helps prevent invalid input errors.
- Testing different inputs helps confirm script behaviour.

## 13. Conclusion

In this lab, I created and tested a Bash script using `if`, `elif`, and `else`.

The script successfully identifies numbers above, below, and equal to 10. It also handles missing arguments and invalid input.

This practical improved my understanding of conditional statements and decision-making in Bash scripting.
