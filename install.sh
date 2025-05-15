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
# git config --global user.name "Name"
# git config --global user.email "email" 
}

function install_make {
    # Install make 
    sudo apt update -y
    sudo apt install make -y 
    sudo apt install cmake -y
    sudo apt install tree -y
    sudo apt-get install pkg-config -y
    sudo apt-get install autoconf libtool automake -y
    sudo apt install minicom -y
    sudo apt install curl -y
    sudo apt install net-tools -y
}

function install_nfs {
    sudo apt update -y
    sudo apt install nfs-kernel-server -y
    mkdir -p ~/NFS
    echo "~/NFS 192.168.1.0/24(rw,sync,no_subtree_check)" >>/etc/exports
}

function install_library {
    sudo apt update
    sudo apt install gcc g++ -y
    sudo apt install libssl-dev -y
    sudo apt install libmosquittopp-dev -y
    sudo apt install libcurl4-openssl-dev -y
}

# Example usage:
update
upgrade
install_vscode
install_git
install_makefile
install_library
