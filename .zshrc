export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="afowler"

plugins=(
    git vi-mode 
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias activate="source .venv/bin/activate"

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# fun with scheme
scheme () {
    mit-scheme --quiet < "$1"
}

ssh-hostname() { 
  ssh -G "$1" 2>/dev/null | grep "^hostname " | cut -d" " -f2; 
}

export TERM=xterm-256color
export GIT_EDITOR=vim

# disable accented keys for press and hold
if [[ "$(uname)" == "Darwin" ]]; then
  defaults write -g ApplePressAndHoldEnabled -bool false
fi

# vi mode
bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

bindkey '^J' down-line-or-history  # Ctrl + J for down
bindkey '^K' up-line-or-history    # Ctrl + K for up
bindkey '^H' backward-word    # Ctrl + H for previous word
bindkey '^L' forward-word    # Ctrl + L for next word 


. "$HOME/.local/bin/env"
