# Lab 04: Command-Line Arguments

## 1. Introduction

Command-line arguments are values passed to a Bash script when running it from the terminal.

They make scripts flexible because we can provide different inputs without changing the script.

Example:

```bash
./greet.sh Bob Alice
```

Here, Bob and Alice are command-line arguments.

## 2. Important Positional Parameters

| Parameter | Meaning |
|---|---|
| `$0` | Script name |
| `$1` | First argument |
| `$2` | Second argument |
| `$#` | Total number of arguments |
| `"$@"` | All arguments separately |

## 3. Create Working Directory

```bash
mkdir -p ~/args-lab
cd ~/args-lab
```

## 4. Create Basic Greeting Script

```bash
cat > greet.sh <<'EOF'
#!/bin/bash
# Greet the user by name

if [ -z "$1" ]; then
    echo "Usage: ./greet.sh <name>"
    exit 1
fi

name=$1
echo "Hello, $name!"
EOF
```

## 5. Make Script Executable

```bash
chmod +x greet.sh
ls -l greet.sh
```

`chmod +x` gives permission to execute the script.

## 6. Test with One Argument

```bash
./greet.sh Bob
```

Output:

```text
Hello, Bob!
```

Another example:

```bash
./greet.sh Alice
```

Output:

```text
Hello, Alice!
```

## 7. Handle Multiple Arguments

We can use `"$@"` to accept multiple names.

The `for` loop processes each name separately.

```bash
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: ./greet.sh <name1> <name2> ..."
    exit 1
fi

for name in "$@"
do
    echo "Hello, $name!"
done
```

## 8. Test Multiple Names

```bash
./greet.sh Bob Alice Eve
```

Output:

```text
Hello, Bob!
Hello, Alice!
Hello, Eve!
```

## 9. Test Names with Spaces

```bash
./greet.sh "Mary Ann" Bob
```

Output:

```text
Hello, Mary Ann!
Hello, Bob!
```

The quotes preserve Mary Ann as one argument.

## 10. Error Handling

We use an `if` condition to check whether the user supplied any arguments.

```bash
if [ $# -eq 0 ]; then
    echo "Error: No arguments supplied"
    echo "Usage: ./greet.sh <name1> <name2> ..."
    exit 1
fi
```

Explanation:

- `$# -eq 0` checks whether no arguments were supplied.
- `echo` displays an error message.
- `exit 1` stops the script with an error status.

## 11. Final Script

The final version of `greet.sh`:

```bash
#!/bin/bash
# Greet multiple users

if [ $# -eq 0 ]; then
    echo "Error: No arguments supplied"
    echo "Usage: ./greet.sh <name1> <name2> ..."
    exit 1
fi

for name in "$@"
do
    echo "Hello, $name!"
done
```

## 12. Test Error Handling

Run the script without arguments:

```bash
./greet.sh
echo "exit=$?"
```

Output:

```text
Error: No arguments supplied
Usage: ./greet.sh <name1> <name2> ...
exit=1
```

## 13. Check Successful Execution

```bash
./greet.sh Alice
echo "exit=$?"
```

Output:

```text
Hello, Alice!
exit=0
```

Exit codes:

- `0` = Successful execution.
- `1` = Error or unsuccessful execution.

## 14. Count Output Lines

```bash
./greet.sh Bob Alice | wc -l
```

Output:

```text
2
```

This confirms that two greeting lines were generated.

## 15. Bash Syntax Validation

```bash
bash -n greet.sh
```

No output means the script passed the syntax check.

## 16. Important Commands Summary

| Command | Purpose |
|---|---|
| `chmod +x` | Make script executable |
| `$1` | First argument |
| `$#` | Count arguments |
| `"$@"` | Access all arguments separately |
| `for` | Repeat commands for each argument |
| `if` | Check a condition |
| `exit 1` | Exit with error |
| `echo $?` | Display previous exit status |
| `wc -l` | Count lines |

## 17. Lab Files

```text
Lab-04-Command-Line-Arguments/
├── greet.sh
├── README.md
└── evidence.txt
```

## 18. Conclusion

In this lab, I learned how to pass command-line arguments to Bash scripts, process multiple inputs, use positional parameters, and handle missing arguments.

I also practised loops, conditional statements, exit codes, and input validation.

These skills are useful for creating flexible automation scripts.
