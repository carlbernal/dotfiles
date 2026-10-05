export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

plugins=( \
    git \
    colored-man-pages \
    zsh-syntax-highlighting \
    zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.bin"

unalias -m "*"
source ~/.aliases
