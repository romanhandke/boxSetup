#!/bin/bash

################################################################################
                         
#                        File Name     : setup.sh
#                        Creation Date : 13.04.2020
#                        Last Modified : Fr 08 Mai 2020 16:34:25 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

            # Setup a new box by executing the installation scripts

################################################################################

                             ##### VARIABLES #####

USERNAME=$(grep 1000 /etc/passwd | awk 'BEGIN { FS = ":" } { print $1 }')
export USERHOME="/home/${USERNAME}/"
ACTIVE_SCRIPTS_DIRECTORY="./scripts/active/"

###############################################################################

                             ##### FUNCTIONS #####

# shellcheck source=/dev/null
source ./utils/functions.sh

###############################################################################

                               ##### SCRIPT #####

# Sudo privileges required
if [[ "${EUID}" -ne 0 ]]
then
  usage
  exit 1
fi

clear

echo "---"
echo -e "\e[1;32mBoxSetup Script\e[0m"
echo " Get a new box up to speed"
echo

# Update Repos
updateRepositories
echo

# Execute installation scripts
for SCRIPT in ${ACTIVE_SCRIPTS_DIRECTORY}*
do
  setupStep "Executing ${SCRIPT}"
  # shellcheck source=/dev/null
  source "${SCRIPT}"
  echo
done

# Exit gracefully
exit 0
