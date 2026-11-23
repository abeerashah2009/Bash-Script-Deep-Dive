# Lab 18: Numerical Operations in Bash

## 1. Introduction

This lab demonstrates how to perform numerical calculations using a Bash script.

The script accepts two numbers and performs addition, subtraction, multiplication, and division.

## 2. Objectives

- Accept two numbers as command-line arguments.
- Prompt the user when arguments are missing.
- Validate numeric input.
- Perform four arithmetic operations.
- Handle decimal numbers.
- Prevent division by zero.

## 3. Environment

- Operating System: Ubuntu 24.04 LTS
- Shell: Bash 5.2.21
- Calculator: bc 1.07.1

## 4. Installing bc

The `bc` utility performs decimal calculations in Bash.

```bash
sudo apt update
sudo apt install bc -y
bc --version
```

## 5. Input Handling

The script accepts two numbers as arguments:

```bash
./num_operations.sh 10 4
```

It can also prompt for input when arguments are missing:

```bash
./num_operations.sh
```

The script uses `read -r` to receive user input.

Piped input is also supported:

```bash
echo '10 3' | ./num_operations.sh
```

## 6. Numeric Validation

Regular expressions validate the input:

```bash
re='^-?[0-9]+([.][0-9]+)?$'
```

This allows positive numbers, negative numbers, and decimal numbers.

Invalid input displays an error message.

## 7. Integer and Decimal Detection

The script checks whether both numbers are integers.

```bash
re_int='^-?[0-9]+$'
```

- Integer calculations use Bash arithmetic.
- Decimal calculations use `bc`.

## 8. Addition

Addition calculates the sum of two numbers.

```bash
sum=$((num1 + num2))
```

For decimal values, `bc` is used.

## 9. Subtraction

Subtraction calculates the difference between two numbers.

```bash
difference=$((num1 - num2))
```

For decimal values, `bc` is used.

## 10. Multiplication

Multiplication calculates the product.

```bash
product=$((num1 * num2))
```

For decimal values:

```bash
product=$(echo "scale=2; $num1 * $num2" | bc)
```

## 11. Division

Division calculates the quotient.

```bash
quotient=$(echo "scale=2; $num1 / $num2" | bc)
```

The script checks whether the second number is zero before performing division.

```bash
if [ "$(echo "$num2 == 0" | bc)" -eq 1 ]; then
    echo "Division by zero is not allowed."
fi
```

## 12. Testing

### Test 1: Integer calculations

```bash
./num_operations.sh 10 4
```

Expected results:

- Sum: 14
- Difference: 6
- Product: 40
- Quotient: 2.50

### Test 2: Decimal calculations

```bash
./num_operations.sh 2.5 1.5
```

Expected results:

- Sum: 4.0
- Difference: 1.0
- Product: 3.75
- Quotient: 1.66

### Test 3: Piped input

```bash
echo '10 3' | ./num_operations.sh
```

### Test 4: Division by zero

```bash
./num_operations.sh 10 0
```

Expected message:

```text
Division by zero is not allowed.
```

### Test 5: Invalid input

```bash
./num_operations.sh abc 4
```

Expected message:

```text
Error: both inputs must be numeric.
```

### Test 6: Bash integer division

```bash
echo $((10 / 4))
```

Output:

```text
2
```

## 13. Script Verification

```bash
bash -n num_operations.sh
test -x num_operations.sh
```

Both checks passed during practical verification.

## 14. Conclusion

In this lab, I learned how to perform arithmetic operations using Bash, validate numeric input, handle decimal calculations with `bc`, accept interactive and piped input, and prevent division by zero.

The completed script is available in `num_operations.sh`.
