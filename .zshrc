export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( \
    git \
    colored-man-pages \
    zsh-syntax-highlighting \
    zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.bin"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
    export PATH="$PATH:$(brew --prefix)/opt/libpq/bin/"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
fi

unalias -m "*"
source ~/.aliases
