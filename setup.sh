#!/bin/bash

################################################################################
                         
#                        File Name     : setup.sh
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 19:54:53 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

            # Setup a new box by executing the installation scripts

################################################################################

                             ##### FUNCTIONS #####

usage() {
  echo "Usage sudo ${0}"
  echo
  echo "Since this script will install packages root privileges are required."
}

################################################################################

                               ##### SCRIPT #####

# Sudo privileges required
if [[ "${EUID}" -ne 0 ]]
then
  usage
fi

clear

echo "---"
echo "BoxSetup Script"
echo " A script to install everyhing that is needed on a new box."
echo

# Update Repos
echo -e "\e[1;33m[info]\e[0m Updating Repositories ..."
echo
apt update &> /dev/null

# Execute installation scripts
for SCRIPT in ./scripts/*
do
  echo -e "\e[1;33m[info]\e[0m Executing ${SCRIPT} ..."
  /bin/bash "${SCRIPT}"
  echo
done

# Exit gracefully
exit 0
