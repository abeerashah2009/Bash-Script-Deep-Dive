# Lab 13 - Command Substitution

## 1. Introduction

Command substitution is a feature in Bash that allows us to execute a command and use its output inside another command or store it in a variable.

The syntax is:

```bash
$(command)
```

It makes shell scripts dynamic because command output can be captured and reused.

## 2. Learning Objectives

- Understand command substitution.
- Store command output in variables.
- Capture the current date and time.
- Use nested command substitution.
- Capture username and current directory.
- Get kernel version using `uname`.
- Count files using `ls` and `wc`.

## 3. Environment

- Operating System: Ubuntu 24.04
- Shell: Bash 5.2.21
- Script: `cmd_sub.sh`

## 4. Basic Command Substitution

Example:

```bash
echo "Hello from $(hostname)"
```

Explanation:

- `hostname` displays the system hostname.
- `$(hostname)` executes the command and captures its output.
- `echo` displays the complete message.

Example output:

```text
Hello from ip-172-31-10-210
```

## 5. Store Current Date in a Variable

Use the `date` command inside command substitution.

```bash
CURRENT_DATE="$(date)"
echo "Today is $CURRENT_DATE"
```

Explanation:

- `date` displays the current date and time.
- `$(date)` captures the output.
- `CURRENT_DATE` stores the captured value.
- `echo` displays the variable.

## 6. Formatted Date

Use `date +%F` to display the date in YYYY-MM-DD format.

```bash
echo "ISO date: $(date +%F)"
```

Example output:

```text
ISO date: 2026-11-23
```

## 7. Nested Command Substitution

Nested command substitution means using one command substitution inside another.

```bash
echo "Length of that date string: $(echo -n "$(date +%F)" | wc -c)"
```

Explanation:

1. `date +%F` generates the formatted date.
2. The inner `$(...)` captures the date.
3. `echo -n` prints it without a newline.
4. `wc -c` counts the characters.
5. The outer `$(...)` captures the count.

Expected output:

```text
Length of that date string: 10
```

## 8. Command Substitution with Other Commands

### 8.1 Get the Current Username

```bash
USER_NAME="$(whoami)"
echo "Current user: $USER_NAME"
```

The `whoami` command displays the current logged-in username.

### 8.2 Get the Current Directory

```bash
CURRENT_DIR="$(pwd)"
echo "Current directory: $CURRENT_DIR"
```

The `pwd` command displays the present working directory.

### 8.3 Get the Kernel Version

```bash
KERNEL_VERSION="$(uname -r)"
echo "Kernel Version: $KERNEL_VERSION"
```

The `uname -r` command displays the Linux kernel version.

### 8.4 Count Files in the Current Directory

```bash
FILE_COUNT="$(ls | wc -l)"
echo "Files in this directory: $FILE_COUNT"
```

Explanation:

- `ls` lists directory entries.
- `|` sends the output to the next command.
- `wc -l` counts the output lines.
- `FILE_COUNT` stores the result.

## 9. Verify Kernel Output

Use `grep -c` to count matching lines:

```bash
bash cmd_sub.sh | grep -c 'Kernel Version: '
```

Expected output:

```text
1
```

This confirms that the kernel version line appears exactly once.

## 10. Complete Bash Script

File: `cmd_sub.sh`

```bash
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
```

## 11. Verification Commands

Check Bash syntax:

```bash
bash -n cmd_sub.sh
```

Run the script:

```bash
./cmd_sub.sh
```

Verify the kernel line:

```bash
bash cmd_sub.sh | grep -c 'Kernel Version: '
```

Check executable permission:

```bash
ls -l cmd_sub.sh
```

## 12. Important Notes

- Command substitution uses `$(command)`.
- Double quotes around `"$(command)"` help preserve spaces in captured output.
- Command substitution removes trailing newline characters from command output.
- Nested command substitution allows commands to be combined.
- Variables make it easier to reuse command output in scripts.

## 13. Conclusion

In this lab, I learned how to use command substitution in Bash scripting.

I practiced capturing command output, storing values in variables, using nested command substitution, formatting dates, retrieving system information, and counting directory entries.

These techniques are useful for creating dynamic shell scripts and automating Linux administration tasks.
