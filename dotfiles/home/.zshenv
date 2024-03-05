export ZDOTDIR=$HOME/.config/zsh

#typeset -U PATH path

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export LESSHISTFILE=-

export EDITOR="nvim"
export TERMINAL="alacritty"
export FILEMANAGER="nemo"
export BROWSER="firefox"
export rofi_theme="~/.config/rofi/dark.rasi"
export QT_QPA_PLATFORMTHEME="qt5ct"
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/.local/share/pnpm"
export GPG_TTY=$(tty)
[ -f ~/.gnupg/gpg-agent-info ] && source ~/.gnupg/gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
    export GPG_AGENT_INFO
else
    eval $( gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf --write-env-file ~/.gnupg/gpg-agent-info )
fi

#export RUST_SRC_PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library"
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library"

# https://github.com/mozilla/sccache
export RUSTC_WRAPPER=~/.cargo/bin/sccache

path=(
    "$HOME/.deno/bin"
    "$HOME/go/bin"
    "$HOME/scripts"
    "$HOME/AppImages"
    "$HOME/jars"
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
    "$HOME/.yarn/bin"
    "$BUN_INSTALL/bin"
    "$HOME/.spicetify"
    "$PNPM_HOME"
    "/usr/sbin"

    $path
)

export PATH
. "$HOME/.cargo/env"
