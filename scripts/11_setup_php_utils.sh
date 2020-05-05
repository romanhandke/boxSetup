#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 18.04.2020
#                        Last Modified : Di 05 Mai 2020 19:52:03 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                              # Install php utils

################################################################################

                               ##### SCRIPT #####

installPackage "composer"

info "Installing PsyShell"
composer g require psy/psysh:@stable &> /dev/null || error "Could not install PsyShell"
