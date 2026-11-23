# Lab 19: Parsing Command Output (cut/grep/awk)

## 1. Introduction

This lab demonstrates how to inspect Linux processes and extract useful information using common command-line text-processing tools.

The tools covered are:

- `ps`
- `grep`
- `awk`
- `cut`
- `pgrep`

## 2. Objectives

- Display running processes using `ps aux`.
- Filter process output using `grep`.
- Extract PID and command fields using `awk`.
- Extract columns and fields using `cut`.
- Understand command pipelines.
- Safely clean up a background process.

## 3. Environment

- Operating System: Ubuntu 24.04.5 LTS
- Shell: Bash 5.2.21
- Terminal: Ubuntu lab VM

## 4. Task 1: Listing Processes Using ps aux

The `ps aux` command displays detailed information about running processes.

```bash
ps aux
```

Display only the first five lines:

```bash
ps aux | head -n 5
```

Start a background process:

```bash
sleep 300 &
```

Check the process count:

```bash
pgrep -c sleep
```

Verify a specific process using its PID:

```bash
ps -p 4725 -o pid,comm,args
```

## 5. Task 2: Filtering Output Using grep

The `grep` command searches text for matching patterns.

Find processes containing bash:

```bash
ps aux | grep 'bash'
```

Avoid matching the grep command itself:

```bash
ps aux | grep '[b]ash'
```

Find sleep processes:

```bash
pgrep -a sleep
```

### Understanding the pipe operator

The pipe operator `|` sends the output of one command to another command.

Example:

```bash
ps aux | grep '[b]ash'
```

Here, `ps aux` provides process information and `grep` filters the output.

## 6. Task 3: Extracting Columns Using awk

The `awk` command processes text fields and extracts selected columns.

Display PID and COMMAND:

```bash
ps aux | awk '{print $2, $11}' | head
```

Display only processes whose command is exactly sleep:

```bash
ps aux | awk '$11=="sleep" {print $2, $11}'
```

### Understanding awk fields

- `$1` represents the first field.
- `$2` represents the second field.
- `$11` represents the eleventh field.
- `print` displays the selected fields.

## 7. Extracting Columns Using cut

The `cut` command extracts characters or delimiter-separated fields.

Display process PIDs:

```bash
ps -eo pid,comm | grep '[s]leep' | cut -c1-7
```

Display process command names:

```bash
ps -eo pid,comm | grep '[s]leep' | cut -c9-
```

Extract usernames from `/etc/passwd`:

```bash
cut -d: -f1 /etc/passwd | head -n 3
```

### Understanding cut options

- `-d` specifies the delimiter.
- `-f` selects a field.
- `-c` selects character positions.

## 8. Process Cleanup

Stop only the background process created for this lab:

```bash
kill 4725
```

Verify that it stopped:

```bash
ps -p 4725 -o pid,comm
```

Check cleanup:

```bash
if pgrep -x sleep | grep -q '^4725$'; then
    echo "Cleanup FAILED"
else
    echo "Lab sleep process cleanup PASS"
fi
```

## 9. Final Verification

```bash
ps aux | head -n 3

ps aux | grep '[b]ash' | head -n 3

ps -eo pid,comm | awk '$2=="sleep" {print $1, $2}' | head

cut -d: -f1 /etc/passwd | head -n 3
```

## 10. Case Study

In server administration, administrators regularly monitor processes to identify resource usage and investigate unexpected processes.

Using `ps`, `grep`, `awk`, and `cut` makes it easier to filter process information and extract useful details without manually reading large outputs.

## 11. Conclusion

In this lab, I learned how to:

- Display running processes.
- Filter command output using grep.
- Extract specific columns using awk.
- Select characters and fields using cut.
- Connect commands using pipelines.
- Safely stop a background process.

These commands are useful for Linux administration, troubleshooting, log analysis, and DevOps automation.

## 12. Practical Script

This lab uses direct Linux commands rather than a separate script.

All practical commands and their verification are documented in this README and the accompanying evidence file.
