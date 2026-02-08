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
export PATH="$PATH:$HOME/.local/bin"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    # Neovim
    export PATH="$PATH:/opt/nvim-linux-arm64/bin"

    # Go
    export GOROOT="/usr/lib/go"
    export GOPATH="$HOME/go"
    export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

    # Node
    export PNPM_HOME="$HOME/.local/share/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac

    # GCloud
    if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
        . "$HOME/google-cloud-sdk/path.zsh.inc";
    fi
    if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
        . "$HOME/google-cloud-sdk/completion.zsh.inc";
    fi
fi

unalias -m "*"
source ~/.aliases
