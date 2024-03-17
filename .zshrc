export PATH="$HOME/mongosh/bin:/opt/homebrew/bin:/opt/homebrew/Cellar/postgresql@15/15.2_3/bin:$HOME/gn/out/bin:$PATH"

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export RIOSDK_PATH="$HOME/roborio-academic"
export PATH="$RIOSDK_PATH/bin:$HOME/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"

source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

alias cd='z'
alias ls='exa'
alias tree='exa -T'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias clear='clear; tmux clear-history'

function cdi {
    if [ -z "$1" ]
    then
        z "$(fd -d 4 -t d -H | fzf)"
    else
        z "$(fd -d 4 -t d -H | fzf -q $1)"
    fi
}

export PATH="$HOME/scripts:$PATH"

source $(brew --prefix)/opt/spaceship/spaceship.zsh

# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

export EDITOR="nvim"

# fpath+="${HOME}/zsh-plugins"
# fpath+="${HOME}/zsh-plugins/zsh-completions/src"

# autoload -U compinit
# compinit -i

fortune -s -n 40

# pnpm
export PNPM_HOME="/Users/braydenzee/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
