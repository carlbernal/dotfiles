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

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
    export PATH="$PATH:$(brew --prefix)/opt/libpq/bin/"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    # Neovim
    export PATH="$PATH:/opt/nvim-linux-arm64/bin"

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

    # Android
    export CHROME_EXECUTABLE="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
    export ANDROID_SDK_ROOT="$HOME/android"
    export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools"
fi

unalias -m "*"
source ~/.aliases
