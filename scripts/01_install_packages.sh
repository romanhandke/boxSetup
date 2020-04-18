#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Sa 18 Apr 2020 18:50:24 CEST
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
  software-properties-common \
)

################################################################################

                               ##### SCRIPT #####

installPackages "${STANDARD_PACKAGES[@]}"
