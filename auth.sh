#!/bin/bash

# Check if an SSH key already exists
if [[ -f ~/.ssh/id_ed25519 || -f ~/.ssh/id_rsa ]]; then
    echo "SSH key already exists. Aborting."
    exit 1
fi

# 1. Generate a new SSH key
echo "Generating a new SSH key..."
ssh-keygen -t ed25519 -C "$1" # $1 is the email address you provide as an argument to the script

# 2. Add the SSH Key to the ssh-agent
echo "Starting ssh-agent and adding the key to it..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 3. Display the SSH key content
echo "Here's your public SSH key. Please add this to your GitHub account:"
echo "------------------------------------------------------------------"
cat ~/.ssh/id_ed25519.pub
echo "------------------------------------------------------------------"
echo "Once added to GitHub, press any key to continue..."
read -n 1 -s -r

# 4. Set the remote URL to use SSH (assuming you're in the git directory)
git remote set-url origin git@github.com:$2/HARDY.git

# 5. Test the SSH connection
echo "Testing the SSH connection to GitHub..."
ssh -T git@github.com

echo "Setup complete!"

