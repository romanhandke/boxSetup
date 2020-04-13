#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 15:17:57 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                     # Setup TMUX the terminal multiplexer

################################################################################

# Install tmux
if [ ! "$(apt install tmux &> /dev/null)" ]
then
  echo "[error] Could not install tmux"
fi

# Configure tmux
## Get user home directory
USERNAME=$(grep 1000 /etc/passwd | awk 'BEGIN { FS = ":" } { print $1 }')
echo cp ../configs/.tmux.conf "/home/${USERNAME}/"
