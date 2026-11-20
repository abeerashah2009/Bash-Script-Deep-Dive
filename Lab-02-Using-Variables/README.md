# Lab 02 – Using Variables in Bash

## 1. Lab Overview

This lab introduces variables in Bash scripting. It demonstrates how to assign values, access variables, change variable values, and print them using the echo command.

## 2. Learning Objectives

- Understand Bash variables.
- Assign values to variables.
- Print variable values using echo.
- Change variable values.
- Understand variable expansion.
- Understand single and double quotes.
- Execute a Bash script.

## 3. Environment

| Component | Details |
|---|---|
| Operating System | Ubuntu 24.04 |
| Shell | Bash |
| Bash Version | 5.2.21 |
| Script Name | using_variables.sh |
| Programming Language | Bash |

## 4. Create a Bash Script

Command:

```bash
cat > using_variables.sh <<'EOF'
#!/usr/bin/env bash
NAME="Alice"
EOF
```

The command creates a script and assigns the value Alice to the variable NAME.

## 5. Understand Variable Assignment

Syntax:

```bash
VARIABLE_NAME="value"
```

Example:

```bash
NAME="Alice"
```

Important: Bash variable assignments must not contain spaces around the equals sign.

Correct:

```bash
NAME="Alice"
```

Incorrect:

```bash
NAME = "Alice"
```

## 6. Print a Variable

Command:

```bash
echo "Hello $NAME!"
```

The `$NAME` expression accesses the value stored in the variable.

Output:

```text
Hello Alice!
```

## 7. Change a Variable Value

Commands:

```bash
NAME="Bob"
echo "Hello $NAME!"
```

The variable's value changes from Alice to Bob.

Output:

```text
Hello Bob!
```

## 8. Complete Script

File: `using_variables.sh`

```bash
#!/usr/bin/env bash
NAME="Alice"
echo "Hello $NAME!"
NAME="Bob"
echo "Hello $NAME!"
```

## 9. Make the Script Executable

Command:

```bash
chmod +x using_variables.sh
```

Verify permissions:

```bash
ls -l using_variables.sh
```

The executable permission allows the script to run directly.

## 10. Execute the Script

Command:

```bash
./using_variables.sh
```

Expected output:

```text
Hello Alice!
Hello Bob!
```

## 11. Single Quotes vs Double Quotes

Double quotes allow variable expansion:

```bash
NAME="Alice"
echo "Hello $NAME!"
```

Output:

```text
Hello Alice!
```

Single quotes prevent variable expansion:

```bash
echo 'Hello $NAME!'
```

Output:

```text
Hello $NAME!
```

Key difference:

- Double quotes expand variables.
- Single quotes preserve literal text.

## 12. Final Verification

Commands:

```bash
test -f using_variables.sh && echo "File: PASS"

test -x using_variables.sh && echo "Executable: PASS"

head -1 using_variables.sh

grep '^NAME=' using_variables.sh

./using_variables.sh
```

Verified results:

- Script file created successfully.
- Variable NAME assigned Alice.
- Variable changed to Bob.
- Both variable values printed correctly.
- Single and double quoting tested.
- Script executed successfully.

## 13. Conclusion

Successfully learned how to create and use variables in Bash scripting.

This lab demonstrates variable assignment, variable expansion, modifying values, and quoting behaviour.

These concepts are important foundations for writing more advanced Bash scripts and automating Linux administration tasks.

## 14. Repository Structure

```text
Lab-02-Using-Variables/
├── using_variables.sh
├── README.md
└── evidence/
    └── lab-output.txt
```

## 15. Practical Completion

- Bash script creation: Completed
- Variable assignment: Completed
- Variable printing: Completed
- Variable modification: Completed
- Single quotes testing: Completed
- Double quotes testing: Completed
- Script execution: Completed
- GitHub documentation: Completed
