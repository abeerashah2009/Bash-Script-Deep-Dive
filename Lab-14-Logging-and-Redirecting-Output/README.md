# Lab 14 - Logging and Redirecting Output

## 1. Introduction

In this lab, I learned how to manage output in Linux using redirection and logging.

I practised sending output to files, capturing errors, and displaying output on the terminal while saving it in a log file.

## 2. Objectives

- Understand standard output (stdout).
- Understand standard error (stderr).
- Learn output redirection.
- Practise using the `tee` command.
- Learn how to append output to a log file.

## 3. Environment

- Operating System: Ubuntu 24.04
- Shell: Bash 5.2
- Script: multiline_output.sh

## 4. Understanding Output Streams

Linux has two main output streams:

**Standard Output (stdout)**
- File descriptor: 1
- Displays normal command output.

**Standard Error (stderr)**
- File descriptor: 2
- Displays error messages.

## 5. Output Redirection Commands

### 5.1 Overwrite Using >

```bash
bash multiline_output.sh > first.log
```

The `>` operator sends output to a file and overwrites existing content.

### 5.2 Append Using >>

```bash
bash multiline_output.sh >> first.log
```

The `>>` operator adds new output at the end of a file.

### 5.3 Redirect Errors Using 2>

```bash
ls /nonexistent > out.log 2> err.log
```

The `2>` operator redirects error messages into `err.log`.

### 5.4 Combine Output and Errors Using 2>&1

```bash
ls /nonexistent > both.log 2>&1
```

This redirects both standard output and standard error into the same file.

## 6. Understanding the tee Command

The `tee` command sends output to two destinations:

1. Terminal screen.
2. Log file.

Basic syntax:

```bash
command | tee output.log
```

To append output:

```bash
command | tee -a output.log
```

## 7. Create the Bash Script

File name:

`multiline_output.sh`

Complete script:

```bash
#!/bin/bash
{
  echo "Welcome to the Logging and Redirecting Output Lab!"
  echo "This script demonstrates output management."
  echo "Each message will be logged to a file and displayed on the console."
} | tee output.log
```

## 8. Make the Script Executable

```bash
chmod +x multiline_output.sh
```

Verify permissions:

```bash
ls -l multiline_output.sh
```

The script should have executable permissions.

## 9. Execute the Script

```bash
./multiline_output.sh
```

Expected output:

```text
Welcome to the Logging and Redirecting Output Lab!
This script demonstrates output management.
Each message will be logged to a file and displayed on the console.
```

## 10. Verify the Log File

Display the log contents:

```bash
cat output.log
```

Count the lines:

```bash
wc -l output.log
```

Expected output:

```text
3 output.log
```

## 11. Test Append Using tee -a

Run:

```bash
./multiline_output.sh | tee -a output.log > /dev/null
```

Check the line count:

```bash
wc -l output.log
```

Expected output:

```text
6 output.log
```

The log now contains six lines.

## 12. Bash Syntax Verification

Run:

```bash
bash -n multiline_output.sh
```

No error message means the script has passed the syntax check.

## 13. Important Commands Summary

| Command | Purpose |
|---|---|
| `>` | Overwrite file |
| `>>` | Append to file |
| `2>` | Redirect errors |
| `2>&1` | Combine stdout and stderr |
| `tee` | Display and save output |
| `tee -a` | Append output |
| `wc -l` | Count lines |
| `chmod +x` | Make script executable |

## 14. Conclusion

In this lab, I learned how to manage Linux command output and error messages.

I practised using `>`, `>>`, `2>`, and `2>&1` for redirection.

I also used `tee` to display output on the terminal and save it in a log file. Finally, I verified that `tee -a` correctly appends output.

These skills are useful for Linux administration, Bash scripting, troubleshooting, and system logging.
