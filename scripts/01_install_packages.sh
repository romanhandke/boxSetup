#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 16:46:53 CEST
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
  fzf \
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

if [ "${#ERRORS[@]}" -eq 0 ]
then
  echo "[info] No Errors"
else
  for ERROR in "${ERRORS[@]}"
  do
    echo "[error] ${ERROR} could not be installed"
  done
fi
