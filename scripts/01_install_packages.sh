#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 20:21:51 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                   # Install packages that are always needed

################################################################################

# List of packages
STANDARD_PACKAGES=( \
  curl \
  wget \
  tree \
  bat \
  fd-find \
  ripgrep \
)
ERRORS=()

for PACKAGE in "${STANDARD_PACKAGES[@]}"
do
  if ! apt install -y "${PACKAGE}" &> /dev/null
  then
    ERRORS+=("${PACKAGE}")
  fi
done

if [ "${#ERRORS[@]}" -ne 0 ]
then
  for ERROR in "${ERRORS[@]}"
  do
    echo -e "\e[1;31m[error]\e[0m ${ERROR} could not be installed"
  done
fi
