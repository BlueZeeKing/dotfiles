export PATH="$HOME/mongosh/bin:/opt/homebrew/bin:/opt/homebrew/Cellar/postgresql@15/15.2_3/bin:$HOME/.gradle/toolchains/frc/2023/roborio/bin:$HOME/gn/out/bin:$PATH"

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

alias cd='z'
alias ls='exa'
alias tree='exa -T'
alias cdi='z $(fd -d 4 -t d | fzf)'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

eval "$(zoxide init zsh)"

source $(brew --prefix)/opt/spaceship/spaceship.zsh
source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

# fpath+="${HOME}/zsh-plugins"
# fpath+="${HOME}/zsh-plugins/zsh-completions/src"

# autoload -U compinit
# compinit -i

fortune -s -n 40
echo
