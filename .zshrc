export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( \
    git \
    colored-man-pages \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    vi-mode \
    httpie \
)

source "$ZSH/oh-my-zsh.sh"

export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export GOPATH="$HOME/.go"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

unalias -m "*"
source ~/.aliases
