#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 18.04.2020
#                        Last Modified : Sa 18 Apr 2020 18:14:59 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                          # Install PHP 7.4 + Modules


################################################################################

                             ##### VARIABLES ######

PHP_MODULES=( \
  composer
  php7.4
  php7.4-curl \
  php7.4-mbstring \
  php7.4-PDO \
  php7.4-tokenizer \
  php7.4-zip \
)

################################################################################

# Install PHP 7.4
installPackages "${PHP_MODULES[@]}"
