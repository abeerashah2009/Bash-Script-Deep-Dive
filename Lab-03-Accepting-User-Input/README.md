# Lab 03: Accepting User Input

## 1. Objective

Learn how to accept user input in a Bash script using the `read` command and display a personalized greeting.

## 2. Lab Environment

- Operating System: Ubuntu 24.04
- Shell: Bash
- Script: `greet_user.sh`

## 3. Create the Working Directory

```bash
mkdir -p ~/bash-input-lab
cd ~/bash-input-lab
```

## 4. Create the Bash Script

```bash
cat > greet_user.sh <<'EOF'
#!/bin/bash

echo "What is your name?"
read -r user_name
echo "Nice to meet you, $user_name!"
EOF
```

## 5. Understand the Script

| Command | Explanation |
|---|---|
| `#!/bin/bash` | Specifies Bash as the script interpreter. |
| `echo` | Displays a message in the terminal. |
| `read -r user_name` | Accepts user input and stores it in a variable. |
| `$user_name` | Retrieves the value stored in the variable. |

**Important:** The `-r` option prevents backslashes from being treated as escape characters.

## 6. Make the Script Executable

```bash
chmod +x greet_user.sh
ls -l greet_user.sh
```

The executable permission allows the script to run using `./greet_user.sh`.

## 7. Test 1: Interactive Input

```bash
./greet_user.sh
```

Example input:

```text
abeera
```

Output:

```text
What is your name?
Nice to meet you, abeera!
```

## 8. Test 2: Piped Input

```bash
echo "Abeera" | ./greet_user.sh
```

Output:

```text
What is your name?
Nice to meet you, Abeera!
```

The `echo` command sends input through a pipe to the script.

## 9. Validate Script Syntax

```bash
bash -n greet_user.sh
```

The syntax validation completed successfully.

## 10. Key Learning Outcomes

- Created and executed a Bash script.
- Learned how to use the `read` command.
- Stored user input in a variable.
- Used variable expansion with `$user_name`.
- Tested interactive and piped input.
- Understood the purpose of the shebang and executable permissions.

## 11. Files in This Lab

```text
Lab-03-Accepting-User-Input/
├── greet_user.sh
├── README.md
└── evidence.txt
```

## 12. Conclusion

This lab demonstrated how Bash scripts can interact with users, capture input, store information in variables, and generate personalized output. These concepts are useful when developing interactive configuration scripts and command-line applications.
