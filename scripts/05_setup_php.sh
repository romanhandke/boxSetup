#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 18.04.2020
#                        Last Modified : Sa 18 Apr 2020 17:53:17 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                          # Install PHP 7.4 + Modules


################################################################################

                             ##### VARIABLES ######

PHP_MODULES=( \
  curl \
  mbstring \
  PDO \
  tokenizer \
  zip \
)

################################################################################

# Add Repository
add-apt-repository ppa:ondrej/php -y || error "Could not add PHP 7.4 repository"

# Update Repositories
apt update

# Install PHP 7.4
installPackage php7.4

installPackages "${PHP_MODULES[@]}"
