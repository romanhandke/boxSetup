#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Di 05 Mai 2020 19:47:04 CEST
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

# Install zsh-syntax-highlighting
info "Installing zsh-syntax-highlighting"
su - "${USERNAME}" -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${USERHOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" &> /dev/null || error "Could not install zsh-syntax-highlighting"

# Install zsh-autosuggestions
info "Installing zsh-autosuggestions"
su - "${USERNAME}" -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${USERHOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" &> /dev/null || error "Could not install zsh-autosuggestions"

# Install recommended fonts
info "Installing fonts"
for FONT in "${FONT_URLS[@]}"
do
  su - "${USERNAME}" -c "wget '${FONT}' -P /home/${USERNAME}/.local/share/fonts/" &> /dev/null || error "Could not install ${FONT}"
done

reinitializeShell

# Install PowerLevel10k theme
info "Installing PowerLevel10k theme"
su - "${USERNAME}" -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/${USERNAME}/.oh-my-zsh/themes/powerlevel10k" &> /dev/null \
  || error "Could not install PowerLevel10k theme"

# Copy config
copyFileHome "./configs/.zshrc"
