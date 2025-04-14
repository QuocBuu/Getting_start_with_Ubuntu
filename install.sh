#!/bin/bash

function update {
    sudo apt update
}

function upgrade {
    sudo apt upgrade
}

function install_vscode {
    # Download and install Microsoft GPG key
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    
    # Add VSCode repository
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    
    # Update package list and install VSCode
    sudo apt update
    sudo apt install -y code
    
    # Clean up
    rm packages.microsoft.gpg
}

function install_git {
    # Install Git
    sudo apt update
    sudo apt install -y git
}

function install_makefile {
    # Install make (part of build-essential)
    sudo apt update
    sudo apt install -y build-essential
}

# Example usage:
update
upgrade
install_vscode
install_git
install_makefile