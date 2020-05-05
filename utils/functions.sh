#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 18.04.2020
#                        Last Modified : Di 05 Mai 2020 19:19:41 CEST
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
  echo -e " \e[1;31m[error]\e[0m ${1}"
}

info() {
  echo -e " \e[1;33m[info]\e[0m ${1}"
}

installPackage() {
  info "Installing ${1}"
  apt install -y "${1}" &> /dev/null || error "Could not install ${1}"
}

installPackages() {
  PACKAGE_ARRAY=("${@}")
  for PACKAGE in "${PACKAGE_ARRAY[@]}"
  do
    info "Installing ${PACKAGE}"
    apt install -y "${PACKAGE}" &> /dev/null || error "Could not install ${PACKAGE}"
  done
}

copyFileHome() {
  info "Copying file to home directory"
  cp "${1}" "$USERHOME" || error "Could not copy ${1}"
}

setupStep() {
  echo -e "\e[32m[install]\e[0m ${1}"
}

addRepository() {
  info "Adding repository ${1}"
  add-apt-repository "${1}" -y &> /dev/null || error "Could not add repository ${1}"
}

updateRepositories() {
  info "Updating repositories"
  apt update &> /dev/null || error "Could not update repositories"
}

reinitializeShell() {
  su - "{USERNAME}" -c ". ~/.profile"
  su - "{USERNAME}" -c ". ~/.zshrc"
}
