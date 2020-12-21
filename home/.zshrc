export ZSH="/home/carlbernal/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( \
    git \
    colored-man-pages \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
)

source $ZSH/oh-my-zsh.sh

# aliases
source ~/.aliases

# python3 user bin
export PATH=$HOME/.local/bin:$PATH

# golang
export PATH=/usr/local/go/bin:$PATH

# personal bin
export PATH=$HOME/bin:$PATH
export PATH=$HOME/scripts:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
