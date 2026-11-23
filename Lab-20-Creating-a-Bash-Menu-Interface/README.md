# Lab 20: Creating a Bash Menu Interface

## 1. Objective

Create an interactive command-line menu using Bash scripting.

Learn how to use:
- Bash functions
- `echo` command
- `while` loop
- `read` command
- `case` statement
- Linux commands

## 2. Environment

- Operating System: Ubuntu 24.04
- Bash Version: 5.2.21
- Script Name: `bash_menu.sh`

## 3. Working Directory

```bash
mkdir -p ~/menu-lab
cd ~/menu-lab
```

## 4. Bash Functions

Three functions were created:

1. `show_date()` – Displays the current date and time.
2. `list_files()` – Lists files in the current directory.
3. `exit_script()` – Exits the menu.

## 5. Menu Interface

The script displays three options:

1. Show date
2. List files
3. Exit

## 6. Loop Implementation

The `while true` loop continuously displays the menu until the user selects the exit option.

## 7. User Input

The `read -rp` command captures the user's selection.

```bash
read -rp "Enter your choice: " choice
```

## 8. Case Statement

The `case` statement handles the user's selection.

- Choice 1 calls `show_date`.
- Choice 2 calls `list_files`.
- Choice 3 calls `exit_script`.
- Any other choice displays an invalid-option message.

## 9. Script Validation

Check Bash syntax:

```bash
bash -n bash_menu.sh
```

Expected result:

```text
syntax OK
```

Make the script executable:

```bash
chmod +x bash_menu.sh
```

## 10. Testing

Run the script:

```bash
./bash_menu.sh
```

Test all menu options:

```bash
printf '1\n2\n9\n3\n' | ./bash_menu.sh
```

Verified results:

- Option 1 displayed the current date and time.
- Option 2 listed `bash_menu.sh`.
- Option 9 displayed an invalid-option message.
- Option 3 exited the script successfully.

## 11. Important Commands

| Command | Purpose |
|---|---|
| `echo` | Display menu text |
| `read` | Capture user input |
| `case` | Handle menu choices |
| `while` | Repeat the menu |
| `date` | Display date and time |
| `ls` | List directory files |
| `chmod +x` | Make script executable |
| `bash -n` | Check script syntax |

## 12. Conclusion

Successfully created and tested an interactive Bash menu interface using functions, loops, user input, and case statements.

All menu options and invalid-input handling were verified successfully.
