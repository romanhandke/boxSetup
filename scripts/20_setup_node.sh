#!/bin/bash

################################################################################
                         
#                        File Name     : 20_setup_node.sh
#                        Creation Date : 05.05.2020
#                        Last Modified : Di 05 Mai 2020 19:48:48 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                # Install some specific node versions using nvm

################################################################################

                             ##### FUNCTIONS #####

installNvm() {
  su - "${USERNAME}" -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash " &> /dev/null || error "Could not install nvm"
}

installNode() {
  su - "${USERNAME}" -c "nvm install ${1}" &> /dev/null || error "Could not install ${1}"
}

################################################################################

                             ##### VARIABLES #####

NODE_VERSIONS=( \
  "8.17.0" \
  "10.20.1" \
  "12.16.3" \
)

################################################################################

##### SCRIPT #####

installNvm
reinitializeShell

for NODE in "${NODE_VERSIONS[@]}" do
  installNode "${NODE}"
done
