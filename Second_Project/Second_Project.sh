#!/bin/bash

# Script should be executed with sudo/root access
if [[ "${UID}" -ne 0 ]]
then
        echo "Please run with sudo or root user."
        exit 1
fi

# User should provide at least one argument as username
if [[ "${#}" -lt 1 ]]
then
        echo "Usage: ${0} USER_NAME [COMMENT]..."
        echo "Create a user with name USER_NAME and comment field of comment"
        exit 1
fi

# Use first argument as User Name
USER_NAME="${1}"

# In case of more than one argument
shift
COMMENT="${@}"

# Create Password
PASSWORD=$(date +%s%N)

# Create User
useradd -c "$COMMENT" -m "$USER_NAME"

# Check if user successfully created
if [[ $? -ne 0 ]]
then
        echo "The user is not created"
        exit 1
fi

# Set password for user
echo "$USER_NAME:$PASSWORD" | chpasswd

# Check if password successfully created
if [[ $? -ne 0 ]]
then
        echo "The password is not created"
        exit 1
fi

# Force password change on first login
passwd -e "$USER_NAME"

# Display user details
echo
echo "Username: $USER_NAME"
echo
echo "Password: $PASSWORD"
echo
echo "Hostname: $(hostname)"