#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Sa 18 Apr 2020 17:45:36 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                     # Setup TMUX the terminal multiplexer

################################################################################

# Install tmux
# apt install -y tmux &> /dev/null || error "Could not install tmux"
installPacke tmux

# Configure tmux
copyFileHome "./configs/.tmux.conf"
