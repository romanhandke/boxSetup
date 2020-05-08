#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Di 05 Mai 2020 20:23:33 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                   # Install packages that are always needed

################################################################################

                             ##### VARIABLES #####

# List of packages
STANDARD_PACKAGES=( \
  curl \
  wget \
  tree \
  bat \
  fd-find \
  snapd \
  shellcheck \
  software-properties-common \
)
WORKIN_DIRECTORY=$(pwd)

################################################################################

                             ##### FUNCTIONS #####

installRipGrep() {
  info "Installing ripgrep"
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb &> /dev/null || error "Could not download ripgrep"
  dpkg -i ripgrep_11.0.2_amd64.deb &> /dev/null || error "Could not install ripgrep"
}

################################################################################

                               ##### SCRIPT #####

installPackages "${STANDARD_PACKAGES[@]}"
installRipGrep
