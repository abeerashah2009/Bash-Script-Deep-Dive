# Lab 16 - Scheduling Scripts with Cron

## 1. Introduction

Cron is a Linux job scheduler used to automate repetitive tasks.

It allows scripts and commands to run automatically at scheduled times without manual execution.

## 2. Objectives

- Understand Cron job scheduling.
- Install and start the Cron service.
- Create a simple Bash script.
- Schedule a script to run every minute.
- Verify automatic execution.
- Clean up the scheduled job.

## 3. Environment

- Operating System: Ubuntu 24.04.5 LTS
- Shell: Bash 5.2.21
- User: ubuntu
- Scheduler: Cron

## 4. Install and Start Cron

Update package information:

```bash
sudo apt-get update
```

Install Cron:

```bash
sudo apt-get install -y cron
```

Enable and start the service:

```bash
sudo systemctl enable --now cron
```

Check service status:

```bash
systemctl is-active cron
```

Expected output:

```text
active
```

## 5. Create Working Directory

```bash
mkdir -p ~/cron_lab
```

Check the home directory:

```bash
echo "$HOME"
```

Example output:

```text
/home/ubuntu
```

## 6. Create the Cron Test Script

Create the script:

```bash
cat > ~/cron_lab/cron_test.sh <<EOF
#!/bin/bash
echo "Cron test" >> $HOME/cron_output.txt
EOF
```

Make it executable:

```bash
chmod +x ~/cron_lab/cron_test.sh
```

## 7. Understand the Script

- `#!/bin/bash`: Runs the script using Bash.
- `echo`: Displays or writes text.
- `>>`: Appends output to a file.
- `$HOME`: Represents the user's home directory.
- `chmod +x`: Makes the script executable.

## 8. Test the Script Manually

View the script:

```bash
cat ~/cron_lab/cron_test.sh
```

Execute it:

```bash
~/cron_lab/cron_test.sh
```

Check the output:

```bash
cat ~/cron_output.txt
```

Expected output:

```text
Cron test
```

## 9. Schedule the Script Using Cron

Add the job:

```bash
(crontab -l 2>/dev/null; echo "* * * * * $HOME/cron_lab/cron_test.sh") | crontab -
```

Verify the scheduled job:

```bash
crontab -l
```

Expected entry:

```text
* * * * * /home/ubuntu/cron_lab/cron_test.sh
```

## 10. Understand Cron Syntax

Cron uses five scheduling fields:

```text
* * * * * command
```

| Field | Meaning |
|---|---|
| First `*` | Minute |
| Second `*` | Hour |
| Third `*` | Day of month |
| Fourth `*` | Month |
| Fifth `*` | Day of week |

Five asterisks mean the command runs every minute.

## 11. Verify Automatic Execution

Count existing output lines:

```bash
BEFORE=$(wc -l < ~/cron_output.txt)
```

Wait for a scheduled execution:

```bash
for i in $(seq 1 35); do
    [ "$(wc -l < ~/cron_output.txt)" -gt "$BEFORE" ] && break
    sleep 2
done
```

Check the output:

```bash
tail -n 3 ~/cron_output.txt
cat ~/cron_output.txt
grep -c 'Cron test' ~/cron_output.txt
```

The output count increased from 2 to 3, confirming automatic execution.

## 12. Clean Up the Cron Job

Remove only the Lab 16 job:

```bash
crontab -l | grep -v 'cron_test.sh' | crontab -
```

Verify removal:

```bash
crontab -l | grep -c 'cron_test.sh'
```

Expected output:

```text
0
```

Check the Cron service:

```bash
systemctl is-active cron
```

Expected output:

```text
active
```

## 13. Conclusion

In this lab, I learned how to automate tasks using Cron.

I installed and started the Cron service, created a Bash script, scheduled it to run every minute, and verified its automatic execution.

I also learned how to remove a specific Cron job without deleting other scheduled jobs.

Cron is an important Linux tool for automating repetitive system administration tasks.
