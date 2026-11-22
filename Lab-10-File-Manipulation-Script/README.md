# Lab 10 — File Manipulation Script

## 1. Introduction

In this lab, I created a Bash script to copy files from a source location to a destination.

The script accepts command-line arguments and handles errors during file operations.

## 2. Lab Objectives

- Understand basic file manipulation using Bash.
- Accept source and destination arguments.
- Check whether the source file exists.
- Copy files using the `cp` command.
- Handle errors and verify exit codes.

## 3. Tools and Environment

- Operating System: Ubuntu 24.04
- Shell: Bash 5.2.21
- Scripting Language: Bash
- Terminal: Linux CLI

## 4. Understanding Command-Line Arguments

The script uses two arguments:

- `$1`: Source file
- `$2`: Destination file

The expressions `${1:-}` and `${2:-}` provide empty values when arguments are missing.

## 5. Complete Bash Script

File: `file_copy_script.sh`

```bash
#!/bin/bash
# This script copies a file from the source to the destination and checks for success or failure.

SOURCE="${1:-}"
DESTINATION="${2:-}"

if [ -z "$SOURCE" ] || [ -z "$DESTINATION" ]; then
    echo "Usage: $0 <source_file> <destination_file>"
    exit 1
fi

if [ ! -f "$SOURCE" ]; then
    echo "Error: Source file '$SOURCE' does not exist."
    exit 1
fi

if ! cp "$SOURCE" "$DESTINATION"; then
    echo "Error in copying file."
    exit 1
fi

echo "File copied successfully to '$DESTINATION'."
```

## 6. Script Explanation

- `#!/bin/bash` specifies the Bash interpreter.
- `SOURCE` stores the first argument.
- `DESTINATION` stores the second argument.
- `-z` checks whether an argument is empty.
- `-f` checks whether the source is a regular file.
- `cp` copies the source file to the destination.
- `if ! cp` handles copy failures.
- `exit 1` indicates an unsuccessful operation.

## 7. Making the Script Executable

```bash
chmod +x file_copy_script.sh
```

Check permissions:

```bash
ls -l file_copy_script.sh
```

## 8. Successful File Copy Test

Create a sample file:

```bash
echo "Sample Text" > testfile.txt
```

Run the script:

```bash
./file_copy_script.sh testfile.txt new.txt
```

Expected output:

```text
File copied successfully to 'new.txt'.
```

Compare the original and copied files:

```bash
cmp testfile.txt new.txt && echo "Files are identical"
```

Expected output:

```text
Files are identical
```

## 9. Error Handling Tests

### Missing arguments

```bash
./file_copy_script.sh
```

Expected exit code: `1`.

### Missing destination

```bash
./file_copy_script.sh testfile.txt
```

Expected exit code: `1`.

### Missing source file

```bash
./file_copy_script.sh nofile x
```

Expected output:

```text
Error: Source file 'nofile' does not exist.
```

Expected exit code: `1`.

### Invalid destination directory

```bash
./file_copy_script.sh testfile.txt /nonexistent/dir/x
```

Expected output includes:

```text
Error in copying file.
```

Expected exit code: `1`.

## 10. Bash Syntax Verification

```bash
bash -n file_copy_script.sh
```

A successful syntax check produces no error messages.

## 11. Strict Mode Test

```bash
bash -c 'set -euo pipefail; echo "before"; false; echo "never printed"'
```

Expected output:

```text
before
```

The command exits with status `1`.

## 12. Key Learning Points

- Bash scripts can accept command-line arguments.
- Variables can store source and destination filenames.
- Quoting variables supports filenames containing spaces.
- File existence checks prevent invalid copy operations.
- The `cp` command performs file copying.
- Exit codes help identify successful and failed operations.

## 13. Conclusion

In this lab, I created a file manipulation script using Bash. I practiced accepting arguments, validating source files, copying files, handling errors, and checking exit codes.

These skills are useful for Linux administration and automation tasks.
