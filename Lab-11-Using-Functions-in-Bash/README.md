# Lab 11 — Using Functions in Bash

## 1. Introduction

In this lab, I learned how to define and use functions in Bash scripting.

I created a reusable function named `print_greeting` that accepts arguments and displays different greeting messages.

## 2. Lab Objectives

- Understand Bash functions.
- Define and call functions.
- Pass arguments to functions.
- Use default arguments.
- Add conditional logic inside functions.
- Improve code reusability and organization.

## 3. Tools and Environment

- Operating System: Ubuntu 24.04
- Shell: Bash 5.2.21
- Script: `greet.sh`

## 4. Understanding Bash Functions

A function is a named group of commands that can be called whenever required.

Basic syntax:

```bash
function_name() {
    commands
}
```

In this lab, the function was named `print_greeting`.

## 5. Task 1 — Define a Simple Function

```bash
#!/bin/bash

# Define function
print_greeting() {
    echo "Hello, $1!"
}
```

The function accepts one argument through `$1` and prints a greeting.

## 6. Task 2 — Call the Function

```bash
#!/bin/bash

print_greeting() {
    echo "Hello, $1!"
}

# Call the function with an argument
print_greeting "Alice"
```

Output:

```text
Hello, Alice!
```

The function is executed by writing its name followed by an argument.

## 7. Task 3 — Use Dynamic Arguments

```bash
#!/bin/bash

print_greeting() {
    echo "Hello, $1!"
}

# Call with a user-specified argument, defaulting to World
print_greeting "${1:-World}"
```

Test commands:

```bash
./greet.sh Bob
./greet.sh
```

Output:

```text
Hello, Bob!
Hello, World!
```

The expression `${1:-World}` uses `World` when the first argument is empty or missing.

## 8. Task 4 — Add Conditional Logic

Final script:

```bash
#!/bin/bash

print_greeting() {
    if [[ "$2" = "morning" ]]; then
        echo "Good morning, $1!"
    else
        echo "Hello, $1!"
    fi
}

print_greeting "${1:-World}" "$2"
```

Test commands:

```bash
./greet.sh Alice morning
./greet.sh Bob
```

Output:

```text
Good morning, Alice!
Hello, Bob!
```

The function uses:
- `$1` for the name.
- `$2` for the greeting type.
- `if` and `else` to select the message.

## 9. Additional Verification

Test a name containing a space:

```bash
./greet.sh "Abeera Shah"
```

Output:

```text
Hello, Abeera Shah!
```

Verify the morning greeting:

```bash
./greet.sh Alice morning | grep -q 'Good morning, Alice!' && echo PASS
```

## 10. Bash Syntax and Permissions

Check Bash syntax:

```bash
bash -n greet.sh
```

Make the script executable:

```bash
chmod +x greet.sh
```

Verify executable permission:

```bash
test -x greet.sh && echo "Permission PASS"
```

## 11. Key Concepts Learned

- Function Definition: Creating a reusable group of commands.
- Function Call: Executing a function by its name.
- Function Arguments: Passing values to a function.
- `$1` and `$2`: Accessing function arguments.
- Default Argument: Providing a fallback value using `${1:-World}`.
- Conditional Logic: Using `if`, `else`, and `[[ ]]`.
- Code Reusability: Avoiding repeated commands by using functions.

## 12. Conclusion

In this lab, I learned how to define, call, and use Bash functions with arguments.

I also implemented conditional logic to display different greeting messages.

Bash functions help make scripts more organized, reusable, and easier to maintain.
