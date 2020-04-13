#!/bin/bash

################################################################################
                         
#                        File Name     :  
#                        Creation Date : 13.04.2020
#                        Last Modified : Mo 13 Apr 2020 20:35:26 CEST
#                        Created By    : roman handke
                        
################################################################################

                              ##### PURPOSE #####

                              # Setup OhMyZsh
                              # 1. Install zsh
                              # 2. Make zsh default shell
                              # 3. Install OhMyZsh

################################################################################

# Install zsh
apt install -y zsh &> /dev/null || echo -e "\e[1;31m[error]\e[0m Could not install zsh"

# Set zsh as default shell for the user with UID 1000
USERNAME=$(grep 1000 /etc/passwd | awk 'BEGIN { FS = ":" } { print $1 }')
chsh --shell /bin/zsh "${USERNAME}" || exit 1

# Install OhMyZsh
su - "${USERNAME}" -c "sh -c $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" &> /dev/null || echo -e "\e[1;31m[error]\e[0m Could not install OhMyZsh"

# Install recommended fonts
FONT_URLS=( \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf \
)

for FONT in "${FONT_URLS[@]}"
do
  su - "${USERNAME}" -c "wget '${FONT}' -P /home/${USERNAME}/.local/share/fonts/" &> /dev/null || echo -e "\e[1;31m[error]\e[0m Could not install ${FONT}"
done

# Install PowerLevel10k theme
su - "${USERNAME}" -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/${USERNAME}/.oh-my-zsh/themes/powerlevel10k" &> /dev/null || echo -e "\e[1;31m[error]\e[0m Could not install p10k theme"

# Copy config
cp ./configs/.zshrc /home/"${USERNAME}"/ &> /dev/null || echo -e "\e[1;31m[error]\e[0m Could not copy .zshrc"
