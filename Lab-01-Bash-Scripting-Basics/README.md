# Lab 01 – Bash Scripting Basics

## 1. Lab Overview

This lab introduces the fundamentals of Bash scripting on Ubuntu Linux.

The objective is to create a simple Bash script, understand the shebang line, use the echo command, change file permissions, and execute a script.

## 2. Learning Objectives

- Understand basic Bash scripting.
- Create a Bash script file.
- Understand the shebang (`#!/bin/bash`).
- Use the echo command.
- Understand Linux file permissions.
- Make a script executable using chmod.
- Execute a script using its path and the Bash interpreter.

## 3. Environment

| Component | Details |
|---|---|
| Operating System | Ubuntu 24.04 |
| Shell | Bash |
| Bash Version | 5.2.21 |
| Script Name | hello.sh |
| Programming Language | Bash |

## 4. Create the Script Directory

Command:

```bash
mkdir -p ~/scripts
cd ~/scripts
```

For this GitHub lab, the script was created inside the repository's Lab-01 directory.

## 5. Create a Bash Script

Command:

```bash
touch hello.sh
```

The `touch` command creates an empty file.

## 6. Add the Shebang

Command:

```bash
echo '#!/bin/bash' > hello.sh
```

The shebang identifies the interpreter used to execute the script.

## 7. Add the Echo Command

Command:

```bash
echo 'echo "Hello World!"' >> hello.sh
```

The `echo` command displays text in the terminal.

Script contents:

```bash
#!/bin/bash
echo "Hello World!"
```

## 8. Understand File Permissions

Initially, the script did not have execute permission.

Command:

```bash
ls -l hello.sh
```

Initial permissions:

```text
-rw-rw-r--
```

Attempting to execute the script before adding execute permission resulted in:

```text
Permission denied
```

## 9. Make the Script Executable

Command:

```bash
chmod +x hello.sh
```

The `chmod +x` command adds execute permission.

Verified permissions:

```text
-rwxrwxr-x
```

## 10. Execute the Bash Script

Using the script path:

```bash
./hello.sh
```

Using the Bash interpreter:

```bash
bash hello.sh
```

Expected output:

```text
Hello World!
```

## 11. Final Verification

Commands:

```bash
test -x hello.sh && echo "Executable: PASS"

head -1 hello.sh

./hello.sh
```

Verified results:

- Script exists.
- Shebang is correct.
- Execute permission is enabled.
- Script runs successfully.
- Expected output is displayed.

## 12. Conclusion

Successfully created and executed a basic Bash script on Ubuntu Linux.

This practical demonstrates how to create shell scripts, use the Bash interpreter, manage executable permissions, and automate simple terminal tasks.

## 13. Repository Structure

```text
Lab-01-Bash-Scripting-Basics/
├── hello.sh
├── README.md
└── evidence/
    └── lab-output.txt
```

## 14. Practical Status

- Bash script creation: Completed
- Shebang configuration: Completed
- Echo command: Completed
- Execute permissions: Completed
- Script execution: Completed
- GitHub documentation: Completed
