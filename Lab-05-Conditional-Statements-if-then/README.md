# Lab 05: Conditional Statements (if-then)

## 1. Introduction

Conditional statements allow Bash scripts to make decisions based on conditions.

They help scripts perform different actions depending on whether a condition is true or false.

## 2. Objectives

- Understand conditional statements in Bash.
- Use `if`, `then`, `else`, `elif`, and `fi`.
- Check whether a file exists.
- Check whether a directory exists.
- Handle paths that do not exist.

## 3. Bash Conditional Structure

```bash
if [ condition ]; then
    commands
else
    commands
fi
```

Explanation:

- `if` starts a condition.
- `[ condition ]` checks the condition.
- `then` runs commands when the condition is true.
- `else` runs commands when the condition is false.
- `fi` ends the conditional statement.

## 4. Important File Test Operators

| Operator | Purpose |
|---|---|
| `-f` | Checks whether a regular file exists |
| `-d` | Checks whether a directory exists |
| `-e` | Checks whether a path exists |

## 5. Create the Workspace

```bash
mkdir -p ~/if_then_lab
cd ~/if_then_lab
```

## 6. Script 1: Check File Existence

File: `check_file.sh`

```bash
#!/bin/bash

FILENAME="example.txt"

if [ -f "$FILENAME" ]; then
  echo "File exists."
else
  echo "File not found."
fi
```

Explanation:

- `FILENAME` stores the file name.
- `-f` checks whether it is a regular file.
- If the file exists, the script prints `File exists.`
- Otherwise, it prints `File not found.`

## 7. Make the Script Executable

```bash
chmod +x check_file.sh
ls -l check_file.sh
```

The `chmod +x` command gives the script execute permission.

## 8. Test File Existence

Test when the file does not exist:

```bash
./check_file.sh
```

Output:

```text
File not found.
```

Create the file and test again:

```bash
touch example.txt
./check_file.sh
```

Output:

```text
File exists.
```

Remove the file and test again:

```bash
rm example.txt
./check_file.sh
```

Output:

```text
File not found.
```

## 9. Using elif

`elif` means else if. It allows us to check another condition when the previous condition is false.

## 10. Script 2: Check File or Directory

File: `check_path.sh`

```bash
#!/bin/bash

TARGET="example.txt"

if [ -f "$TARGET" ]; then
  echo "$TARGET is a file."
elif [ -d "$TARGET" ]; then
  echo "$TARGET is a directory."
else
  echo "$TARGET not found."
fi
```

Explanation:

- `-f` checks for a regular file.
- `-d` checks for a directory.
- `elif` checks the second condition.
- `else` handles a path that does not exist.

## 11. Test the elif Condition

Test a missing path:

```bash
./check_path.sh
```

Output:

```text
example.txt not found.
```

Test a regular file:

```bash
touch example.txt
./check_path.sh
```

Output:

```text
example.txt is a file.
```

Test a directory:

```bash
rm example.txt
mkdir example.txt
./check_path.sh
```

Output:

```text
example.txt is a directory.
```

Clean up:

```bash
rmdir example.txt
```

## 12. Bash Syntax Validation

Check both scripts:

```bash
bash -n check_file.sh
bash -n check_path.sh
```

No output means there are no syntax errors.

## 13. Important Commands Summary

| Command | Purpose |
|---|---|
| `if` | Starts a condition |
| `then` | Runs commands when true |
| `else` | Runs commands when false |
| `elif` | Checks another condition |
| `fi` | Ends the conditional statement |
| `[ -f "$FILE" ]` | Checks for a regular file |
| `[ -d "$TARGET" ]` | Checks for a directory |
| `touch` | Creates an empty file |
| `mkdir` | Creates a directory |
| `rm` | Removes a file |
| `rmdir` | Removes an empty directory |
| `chmod +x` | Makes a script executable |
| `bash -n` | Checks Bash syntax |

## 14. Lab Files

```text
Lab-05-Conditional-Statements-if-then/
├── check_file.sh
├── check_path.sh
├── README.md
└── evidence.txt
```

## 15. Conclusion

In this lab, I practised Bash conditional statements using `if`, `then`, `else`, and `elif`.

I learned how to check for regular files and directories using `-f` and `-d`, handle missing paths, and validate Bash script syntax.

These concepts are useful for writing decision-based shell scripts and automating system administration tasks.
