export PATH="$HOME/mongosh/bin:/opt/homebrew/bin:/opt/homebrew/Cellar/postgresql@15/15.2_3/bin:$HOME/.gradle/toolchains/frc/2023/roborio/bin:$HOME/gn/out/bin:$PATH"

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

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

source $(brew --prefix)/opt/spaceship/spaceship.zsh
source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

export EDITOR="nvim"

# fpath+="${HOME}/zsh-plugins"
# fpath+="${HOME}/zsh-plugins/zsh-completions/src"

# autoload -U compinit
# compinit -i

fortune -s -n 40
echo

