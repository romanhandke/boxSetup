#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 16:59:05 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                     # Setup TMUX the terminal multiplexer

################################################################################

# Install tmux
apt install -y tmux &> /dev/null || echo "[error] Could not install tmux"

# Configure tmux
## Get user home directory
USERNAME=$(grep 1000 /etc/passwd | awk 'BEGIN { FS = ":" } { print $1 }')
cp ../configs/.tmux.conf "/home/${USERNAME}/"
