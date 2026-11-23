# Lab 17 - String Manipulation in Bash

## 1. Introduction

Bash provides several built-in methods to manipulate strings. String manipulation is useful for processing text, handling user input, and automating tasks.

In this lab, I practiced string input, finding string length, extracting substrings, and replacing text.

## 2. Lab Objectives

- Read a string from user input.
- Find the length of a string.
- Extract a substring using an offset and length.
- Replace matching text in a string.
- Understand the difference between replacing the first match and all matches.

## 3. Environment

- Operating System: Ubuntu Linux
- Shell: Bash
- Bash Version: 5.2
- Script: `s.sh`

## 4. Task 1 - Take String as Input

The script accepts a string through the first command-line argument.

If no argument is provided, it asks the user to enter a string interactively.

### Code

```bash
user_input="$1"

if [ -z "$user_input" ]; then
    echo "Enter a string:"
    read -r user_input
fi

echo "You entered: $user_input"
```

### Test

```bash
./s.sh abcdefgh
```

### Output

```text
You entered: abcdefgh
```

## 5. Task 2 - Find String Length

Bash uses `${#variable}` to calculate the number of characters in a string.

### Code

```bash
string_length=${#user_input}
echo "The length of the string is: $string_length"
```

### Output

```text
The length of the string is: 8
```

## 6. Task 3 - Extract a Substring

Bash uses the following syntax:

```bash
${variable:offset:length}
```

- Offset: Starting position (zero-based).
- Length: Number of characters to extract.

### Code

```bash
substring=${user_input:2:4}
echo "Substring from position 2 to 5 is: $substring"
```

### Output

```text
Substring from position 2 to 5 is: cdef
```

## 7. Task 4 - Replace a Substring

Bash parameter expansion can replace matching text.

### Code

```bash
modified_string=${user_input//abc/xyz}
echo "Modified string: $modified_string"
```

### Output 1

```text
Modified string: xyzdefgh
```

### Output 2

```text
Modified string: txyzdbc
```

## 8. Replace All Matches vs First Match

Replace all occurrences:

```bash
s=abcabc
echo "${s//abc/xyz}"
```

Output:

```text
xyzxyz
```

Replace only the first occurrence:

```bash
echo "${s/abc/xyz}"
```

Output:

```text
xyzabc
```

## 9. Important Bash Concepts

| Syntax | Purpose |
|---|---|
| `$1` | First command-line argument |
| `read -r` | Read input safely |
| `-z` | Check whether a string is empty |
| `${#variable}` | Find string length |
| `${variable:2:4}` | Extract a substring |
| `${variable/abc/xyz}` | Replace first match |
| `${variable//abc/xyz}` | Replace all matches |

## 10. Complete Script

The complete practical script is available in `s.sh`.

Run it using:

```bash
chmod +x s.sh
./s.sh abcdefgh
```

## 11. Conclusion

In this lab, I practiced Bash string manipulation using parameter expansion.

I learned how to read user input, calculate string length, extract substrings, and replace matching text. These techniques are useful in Bash scripting, text processing, and automation.
