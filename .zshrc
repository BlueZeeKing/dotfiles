export PATH="$HOME/mongosh/bin:/opt/homebrew/bin:/opt/homebrew/Cellar/postgresql@15/15.2_3/bin:$HOME/gn/out/bin:$PATH"

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export RIOSDK_PATH="$HOME/roborio-academic"
export PATH="$RIOSDK_PATH/bin:$PATH"

eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

alias cd='z'
alias ls='exa'
alias tree='exa -T'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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
source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

export EDITOR="nvim"

# fpath+="${HOME}/zsh-plugins"
# fpath+="${HOME}/zsh-plugins/zsh-completions/src"

# autoload -U compinit
# compinit -i

fortune -s -n 40
echo


# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export VOLTA_FEATURE_PNPM=1

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"