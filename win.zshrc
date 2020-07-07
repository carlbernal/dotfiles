# Path to oh-my-zsh installation.
export ZSH="/home/carlb-wsl/.oh-my-zsh"

# Fix wsl 2 slow loading by removing all /mnt/c paths
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:"

# zsh theme
ZSH_THEME="robbyrussell"

# oh-my-zsh plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Personal aliases
source ~/.aliases

# Windows path
export PATH="$PATH:/mnt/c/Windows/System32"

# Personal bin
export PATH=$HOME/bin:$PATH

# Python bin
export PATH=$HOME/.local/bin:$PATH

# Go bin
export PATH=$HOME/go/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND='ag --ignore node_modules --ignore .git --ignore __pycache__ --ignore .venv -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
