#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Sa 18 Apr 2020 18:43:20 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                            # Setup fzf Fuzzy Finder


################################################################################

# Clone FZF
info "Downloading fzf"
su - "${USERNAME}" -c "git clone --depth 1 https://github.com/junegunn/fzf.git ${USERHOME}.fzf"  &> /dev/null || error "Could not download fzf"

# Run installation
info "Installing fzf"
su - "${USERNAME}" -c "${USERHOME}.fzf/install --key-bindings --completion --update-rc" &> /dev/null || error "Could not install fzf"
