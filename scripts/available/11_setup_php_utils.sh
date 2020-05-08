#!/bin/bash

################################################################################
                         
#                        File Name     : 11_setup_php_utils.sh
#                        Creation Date : 18.04.2020
#                        Last Modified : Fr 08 Mai 2020 17:21:49 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                              # Install php utils

################################################################################

                             ##### FUNCTIONS #####

installGlobalComposerModules() {
  info "Installing ${2}" || info "Installing composer module"
  su - ${USERNAME} -c "composer global require ${1}" &> /dev/null || error "Could not install ${1}"
}

################################################################################

                               ##### SCRIPT #####

installPackage "composer"
installGlobalComposerModules "psy/psysh:@stable" "PsySh"
