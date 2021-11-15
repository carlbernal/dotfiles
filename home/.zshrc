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

# personal bin
export PATH=$HOME/bin:$PATH
export PATH=$HOME/scripts:$PATH

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
