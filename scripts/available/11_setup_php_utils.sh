#!/bin/bash

################################################################################
                         
#                        File Name     : 11_setup_php_utils.sh
#                        Creation Date : 18.04.2020
#                        Last Modified : Fr 08 Mai 2020 16:03:31 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                              # Install php utils

################################################################################

                             ##### FUNCTIONS #####

installGlobalComposerModules() {
  su - ${USERNAME} -c "composer global require ${1}" &> /dev/null || error "Could not install ${1}"
}

################################################################################

                             ##### VARIABLES #####

COMPOSER_MODULES=( \
  "phpmd/phpmd" \
  "squizlabs/php_codesniffer" \
  "phpstan/phpstan" \
  "psy/psysh:@stable" \
)

################################################################################

                               ##### SCRIPT #####

installPackage "composer"

info "Installing global composer modules"

for MODULE in "${COMPOSER_MODULES[@]}"
do
  installGlobalComposerModules "${MODULE}"
done
