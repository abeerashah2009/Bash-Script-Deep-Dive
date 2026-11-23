# Lab 15 - Basic Error Handling

## 1. Introduction

This lab explains basic error handling in Bash scripting.

Error handling helps scripts identify problems, display useful messages, and exit with appropriate status codes.

## 2. Objectives

- Understand the importance of error handling.
- Check whether a directory exists.
- Validate command-line arguments.
- Display error messages.
- Use exit codes.
- Redirect error messages to standard error (stderr).

## 3. Environment

- Operating System: Ubuntu 24.04
- Shell: Bash 5.2
- Script: `check_dir.sh`

Check Bash version:

```bash
bash --version | head -n 1
```

## 4. Create Test Directories

Create an existing directory:

```bash
mkdir -p ~/lab/data
```

Check the directories:

```bash
ls -d ~/lab/data ~/lab/missing
```

The missing directory produces an expected error because it does not exist.

## 5. Check Directory Existence

Bash uses the `-d` condition to check whether a directory exists.

Example:

```bash
if [ -d "$DIRECTORY" ]; then
    echo "Directory exists."
else
    echo "Directory does not exist."
    exit 1
fi
```

The `$1` variable represents the first command-line argument.

## 6. Improved Error Handling Script

The final script is:

```bash
#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>" >&2
    exit 1
fi

DIRECTORY="$1"

if [ -d "$DIRECTORY" ]; then
    echo "Directory exists."
else
    echo "Error: Directory '$DIRECTORY' does not exist." >&2
    echo "Please create it (mkdir -p '$DIRECTORY') before proceeding." >&2
    exit 2
fi
```

## 7. Understanding Important Commands

- `set -e`: Exit when a command fails.
- `set -u`: Treat unset variables as errors.
- `set -o pipefail`: Detect failures in pipelines.
- `$#`: Returns the number of arguments.
- `$1`: Stores the first argument.
- `-d`: Checks whether a directory exists.
- `>&2`: Sends a message to standard error.
- `exit 0`: Successful execution.
- `exit 1`: Invalid or missing argument.
- `exit 2`: Directory does not exist.

## 8. Make Script Executable

```bash
chmod +x check_dir.sh
```

## 9. Test the Script

### Test 1: Existing Directory

```bash
./check_dir.sh ~/lab/data
echo $?
```

Expected output:

```text
Directory exists.
0
```

### Test 2: Missing Directory

```bash
./check_dir.sh /nope
echo $?
```

Expected output:

```text
Error: Directory '/nope' does not exist.
Please create it (mkdir -p '/nope') before proceeding.
2
```

### Test 3: Missing Argument

```bash
./check_dir.sh
echo $?
```

Expected output:

```text
Usage: ./check_dir.sh <directory>
1
```

## 10. Verify Standard Error Redirection

```bash
./check_dir.sh /nope 2>/dev/null
echo $?
```

Expected output:

```text
2
```

The error messages are hidden because stderr is redirected to `/dev/null`.

## 11. Syntax Verification

```bash
bash -n check_dir.sh
```

No output means the script passed the syntax check.

## 12. Conclusion

In this lab, I learned how to handle errors in Bash scripts.

I practised checking directories, validating arguments, displaying error messages, redirecting stderr, and using exit codes.

These techniques help make Bash scripts more reliable and easier to troubleshoot.
