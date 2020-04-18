#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Sa 18 Apr 2020 18:53:56 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                              # Setup OhMyZsh
                              # 1. Install zsh
                              # 2. Make zsh default shell
                              # 3. Install OhMyZsh

################################################################################

                             ##### VARIABLES #####

FONT_URLS=( \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf \
)

################################################################################

                               ##### SCRIPT #####

################################################################################
# Install zsh
installPackage zsh

# Set zsh as default shell for the user with UID 1000
info "Changing shell"
chsh --shell /bin/zsh "${USERNAME}" || error "Could not change shell"

# Install OhMyZsh
info "Installing OhMyZsh"
su - "${USERNAME}" -c "sh -c $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" &> /dev/null \
  || error "Could not install OhMyZsh"

# Install recommended fonts
info "Installing fonts"
for FONT in "${FONT_URLS[@]}"
do
  su - "${USERNAME}" -c "wget '${FONT}' -P /home/${USERNAME}/.local/share/fonts/" &> /dev/null || error "Could not install ${FONT}"
done

# Install PowerLevel10k theme
info "Installing PowerLevel10k theme"
su - "${USERNAME}" -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/${USERNAME}/.oh-my-zsh/themes/powerlevel10k" &> /dev/null \
  || error "Could not install PowerLevel10k theme"

# Copy config
copyFileHome "./configs/.zshrc"
