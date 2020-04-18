#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 18.04.2020
#                        Last Modified : Sa 18 Apr 2020 19:16:00 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                              # Install php utils

################################################################################

                               ##### SCRIPT #####

info "Installing Composer"
installPackage "composer"

info "Installing PsyShell"
composer g require psy/psysh:@stable &> /dev/null || error "Could not install PsyShell"
