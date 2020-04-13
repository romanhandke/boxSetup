#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 20:23:45 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                     # Setup TMUX the terminal multiplexer

################################################################################

# Install tmux
apt install -y tmux &> /dev/null || echo -e "\e[1;31m[error]\e[0m Could not install tmux"

# Configure tmux
## Get user home directory
USERNAME=$(grep 1000 /etc/passwd | awk 'BEGIN { FS = ":" } { print $1 }')
cp ./configs/.tmux.conf "/home/${USERNAME}/" || echo -e "\e[1;31m[error]\e[0m Could not copy tmux config"
