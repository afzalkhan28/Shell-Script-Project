# Linux User Creation Bash Script

A simple Bash script that automates the creation of Linux users, including setting a temporary password and forcing the user to change the password on their first login.

## What This Script Does

The script:

- Checks whether it is being executed with root/sudo privileges
- Accepts a username as a command-line argument
- Accepts an optional comment for the user
- Creates the user with a home directory
- Generates a temporary password
- Sets the password for the newly created user
- Forces the user to change the password on first login
- Displays the username, temporary password, and hostname

## Requirements

- Linux operating system
- Bash
- Root or sudo privileges

The script uses standard Linux commands such as:

- `useradd`
- `chpasswd`
- `passwd`
- `hostname`

## Usage

Make the script executable:

```bash
chmod +x create_user.sh