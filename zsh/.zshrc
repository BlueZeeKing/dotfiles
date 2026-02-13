alias fortune=misfortune

fpath=($fpath /usr/share/zsh/site-functions/)
autoload -U compinit; compinit

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

export PATH="$HOME/neovim/bin:$PATH"

source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

alias cd='z'
alias ls='eza'
alias tree='eza -T'
alias open='xdg-open'

alias clear='clear; tmux clear-history'

function cdi {
    if [ -z "$1" ]
    then
        z "$(fd -d 4 -t d -H | fzf)"
    else
        z "$(fd -d 4 -t d -H | fzf -q $1)"
    fi
}

export EDITOR="nvim"
export TERMINAL="alacritty"
export MANPAGER='nvim +Man!'

fortune -s -n 40
