#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 19:29:36 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                            # Setup fzf Fuzzy Finder


################################################################################

USERNAME=$(grep 1000 /etc/passwd | awk 'BEGIN { FS = ":" } { print $1 }')
su - "${USERNAME}" -c "git clone --depth 1 https://github.com/junegunn/fzf.git /home/${USERNAME}/.fzf"  &> /dev/null || echo "[error] Could not download fzf"
su - "${USERNAME}" -c "/home/${USERNAME}/.fzf/install" &> /dev/null || echo "[error] Could not install fzf"
