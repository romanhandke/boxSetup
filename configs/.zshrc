if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${HOME}/.oh-my-zsh"
export BAT_CONFIG_PATH="${HOME}/boxSetup/configs/.bat.conf"
export BAT_THEME="${HOME}/boxSetup/configs/assets/Nord.tmTheme"
export VISUAL=vim
export EDITOR="${VISUAL}"
export TERM=screen-256color
export COLORTERM=truecolor

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"

plugins=(git composer vi-mode zsh-autosuggestions zsh-syntax-highlighting tmux)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9e9e9e"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

source $ZSH/oh-my-zsh.sh
source "${HOME}/boxSetup/configs/.fzf.conf"

alias gb="git branch | fzf"

ssh-add .ssh/id_ed25519

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
