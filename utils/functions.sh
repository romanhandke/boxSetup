#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 18.04.2020
#                        Last Modified : Sa 18 Apr 2020 18:10:13 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                              # Utility functions

################################################################################

usage() {
  echo "Usage sudo ${0}"
  echo
  echo "Since this script will install packages root privileges are required."
}

error() {
  echo -e "\e[1;31m[error]\e[0m ${1}"
}

info() {
  echo -e "\e[1;33m[info]\e[0m ${1}"
}

installPackage() {
  apt install -y "${1}" &> /dev/null || error "Could not install ${1}"
}

installPackages() {
  PACKAGE_ARRAY=("${@}")
  for PACKAGE in "${PACKAGE_ARRAY[@]}"
  do
    info "Installing ${PACKAGE} ..."
    apt install -y "${PACKAGE}" &> /dev/null || error "Could not install ${PACKAGE}"
  done
}

copyFileHome() {
  cp "${1}" "$USERHOME" || error "Could not copy ${1}"
}