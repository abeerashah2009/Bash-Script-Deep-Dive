# Lab 08 — While Loop Basics

## 1. Introduction

A `while` loop is a control flow statement that repeatedly executes a block of code as long as a given condition remains true.

In this lab, I created a counter-based while loop in Bash and implemented the same logic in Python.

## 2. Lab Objectives

- Understand the concept of a while loop.
- Create a simple while loop in Bash.
- Initialize and increment a counter.
- Implement the same loop in Python.
- Verify loop termination and output.

## 3. Tools and Environment

- Operating System: Ubuntu 24.04
- Shell: Bash 5.2.21
- Python: 3.12.3
- Terminal: Ubuntu CLI

## 4. Understanding While Loops

A while loop continues executing while its condition is true.

General Bash syntax:

```bash
while [ condition ]; do
    # Commands
done
```

## 5. Bash While Loop

File: `loop.sh`

```bash
#!/usr/bin/env bash
counter=1

while [ "$counter" -le 5 ]; do
    echo "Counter: $counter"
    counter=$((counter + 1))
done
```

### Explanation

1. `counter=1` initializes the counter.
2. `while` starts the loop.
3. `-le 5` checks whether the counter is less than or equal to 5.
4. `echo` displays the current counter.
5. `counter=$((counter + 1))` increments the counter.
6. `done` ends the loop.

## 6. Execute the Bash Script

Command:

```bash
bash loop.sh
```

Expected output:

```text
Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5
```

## 7. Python While Loop

File: `loop.py`

```python
counter = 1

while counter <= 5:
    print("Counter:", counter)
    counter += 1
```

### Explanation

- `counter = 1` initializes the variable.
- `while counter <= 5` checks the condition.
- `print()` displays the counter.
- `counter += 1` increases the counter by one.

## 8. Execute the Python Script

Command:

```bash
python3 loop.py
```

Expected output:

```text
Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5
```

## 9. Verify Loop Termination

Command:

```bash
bash loop.sh | tail -n1
```

Expected output:

```text
Counter: 5
```

The counter becomes 6 after the final iteration. The condition becomes false, so the loop stops.

## 10. Compare Output with Expected Result

Command:

```bash
diff <(bash loop.sh) <(printf 'Counter: 1\nCounter: 2\nCounter: 3\nCounter: 4\nCounter: 5\n') && echo "MATCH"
```

Expected output:

```text
MATCH
```

## 11. Syntax Validation

Bash:

```bash
bash -n loop.sh
```

Python:

```bash
python3 -m py_compile loop.py
```

Both scripts passed syntax validation.

## 12. Key Learning Points

- A while loop repeats commands while a condition is true.
- A counter tracks the number of iterations.
- The counter must be updated to avoid an infinite loop.
- Bash uses `-le` for less than or equal to.
- Python uses `<=` for less than or equal to.
- A loop terminates when its condition becomes false.

## 13. Conclusion

In this lab, I learned how to implement while loops in Bash and Python. I practiced counter initialization, condition checking, incrementing, and loop termination.

Both scripts produced the expected five counter values and passed syntax validation.
