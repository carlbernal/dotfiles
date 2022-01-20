export ZSH="/home/carlbernal/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( \
    git \
    colored-man-pages \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    vi-mode \
)

source $ZSH/oh-my-zsh.sh

# disable control + s in terminal
stty -ixon

# aliases
source ~/.aliases

# python3
export PATH=$HOME/.local/bin:$PATH

# android
export PATH=$HOME/flutter/bin:$PATH
export PATH=$HOME/Android/cmdline-tools/latest/bin:$PATH
export ANDROID_SDK_ROOT=$HOME/Android

# personal bin
export PATH=$HOME/bin:$PATH
export PATH=$HOME/scripts:$PATH

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
