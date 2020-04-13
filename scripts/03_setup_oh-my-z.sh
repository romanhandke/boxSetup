#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 17:37:38 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                              # Setup OhMyZsh
                              # 1. Install zsh
                              # 2. Make zsh default shell
                              # 3. Install OhMyZsh

################################################################################

# Install zsh
apt install -y zsh || echo '[error] Could not install zsh'

# Set zsh as default shell for the user with UID 1000
USERNAME=$(grep 1000 /etc/passwd | awk 'BEGIN { FS = ":" } { print $1 }')
chsh --shell /bin/zsh "${USERNAME}" || exit 1

su - "${USERNAME}" -c "sh -c $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" || echo "[error] Could not install OhMyZsh"
