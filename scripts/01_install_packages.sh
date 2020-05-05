#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Di 05 Mai 2020 18:26:45 CEST
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
  ripgrep \
  snapd \
  shellcheck \
  software-properties-common \
)

################################################################################

                               ##### SCRIPT #####

installPackages "${STANDARD_PACKAGES[@]}"
