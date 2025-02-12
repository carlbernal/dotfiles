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
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"

    export PNPM_HOME="$HOME/.local/share/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi

unalias -m "*"
source ~/.aliases
