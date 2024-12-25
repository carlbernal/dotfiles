export ZSH="/Users/carlbernal/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( \
    git \
    colored-man-pages \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    vi-mode \
    httpie \
)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/.scripts

export GOPATH=$HOME/.go
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

unalias -m "*"
source ~/.aliases
