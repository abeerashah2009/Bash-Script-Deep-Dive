# Lab 09 — Using Case Statements

## 1. Introduction

In this lab, I learned how to use the `case` statement in Bash scripting.

A case statement is used to make decisions based on different input values. It helps execute different commands depending on the argument provided by the user.

## 2. Lab Objectives

- Understand the syntax and structure of a Bash case statement.
- Use input arguments for decision-making.
- Handle valid and invalid commands.
- Check script exit codes.
- Make a Bash script executable.

## 3. Tools and Environment

- Operating System: Ubuntu 24.04
- Shell: Bash 5.2.21
- Terminal: Linux CLI
- Script Language: Bash

## 4. Understanding the Case Statement

The `case` statement checks a value and matches it against available patterns.

Basic syntax:

```bash
case "$variable" in
    option1)
        commands
        ;;
    option2)
        commands
        ;;
    *)
        default_commands
        ;;
esac
```

Important terms:

- `case`: Starts the case statement.
- `in`: Begins the matching patterns.
- `;;`: Ends a case branch.
- `*)`: Handles unmatched values.
- `esac`: Ends the case statement.

## 5. Bash Script

File: `command_script.sh`

```bash
#!/bin/bash

# Check if an argument is passed
if [ -z "$1" ]; then
    echo "Usage: $0 {start|stop|status}"
    exit 1
fi

# Use case statement to handle different arguments
case "$1" in
    start)
        echo "Starting the service..."
        ;;
    stop)
        echo "Stopping the service..."
        ;;
    status)
        echo "Checking the service status..."
        ;;
    *)
        echo "Invalid command"
        exit 2
        ;;
esac
```

## 6. Script Explanation

- `#!/bin/bash` specifies Bash as the interpreter.
- `$1` represents the first command-line argument.
- `-z "$1"` checks whether the argument is empty.
- `start` displays the service starting message.
- `stop` displays the service stopping message.
- `status` displays the service status message.
- `*)` handles invalid commands.
- `exit 1` indicates a missing argument.
- `exit 2` indicates an invalid command.

## 7. File Permissions

Make the script executable:

```bash
chmod +x command_script.sh
```

Check permissions:

```bash
ls -l command_script.sh
```

## 8. Running the Script

Valid commands:

```bash
./command_script.sh start
./command_script.sh stop
./command_script.sh status
```

Expected output:

```text
Starting the service...
Stopping the service...
Checking the service status...
```

Invalid command:

```bash
./command_script.sh invalid
```

Output:

```text
Invalid command
```

Missing argument:

```bash
./command_script.sh
```

Output:

```text
Usage: ./command_script.sh {start|stop|status}
```

## 9. Exit Code Verification

| Input | Expected Exit Code |
|---|---:|
| start | 0 |
| stop | 0 |
| status | 0 |
| Invalid command | 2 |
| Missing argument | 1 |

Exit code `0` means success. Non-zero exit codes indicate an error or unsuccessful operation.

## 10. Syntax Verification

Check Bash syntax:

```bash
bash -n command_script.sh
```

A successful syntax check produces no error messages.

## 11. Key Learning Points

- A case statement supports multiple decision branches.
- Command-line arguments can control script behavior.
- The wildcard pattern `*)` handles unmatched input.
- Exit codes help identify success and errors.
- Executable permissions allow a script to run directly.

## 12. Conclusion

In this lab, I practiced using Bash case statements to handle multiple commands. I learned how to process arguments, handle invalid input, verify exit codes, and check Bash script syntax.

This knowledge is useful for Linux administration and automation tasks.
