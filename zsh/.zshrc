export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/go/bin:$HOME/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

export RIOSDK_PATH="$HOME/roborio-academic"
export PATH="$RIOSDK_PATH/bin:$PATH"

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

export PATH="$HOME/neovim/bin:$PATH"

alias java8="export PATH=\"$HOME/java/amazon-corretto-8.jdk/Contents/Home/bin:$PATH\" && export JAVA_HOME=\"$HOME/java/amazon-corretto-8.jdk/Contents/Home/\""
alias java11="export PATH=\"$HOME/java/amazon-corretto-11.jdk/Contents/Home/bin:$PATH\" && export JAVA_HOME=\"$HOME/java/amazon-corretto-11.jdk/Contents/Home/\""
alias java17="export PATH=\"$HOME/java/amazon-corretto-17.jdk/Contents/Home/bin:$PATH\" && export JAVA_HOME=\"$HOME/java/amazon-corretto-17.jdk/Contents/Home/\""
alias java21="export PATH=\"$HOME/java/amazon-corretto-21.jdk/Contents/Home/bin:$PATH\" && export JAVA_HOME=\"$HOME/java/amazon-corretto-21.jdk/Contents/Home/\""

java21

source ~/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-plugins/spaceship/spaceship.zsh

eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

alias cd='z'
alias ls='exa'
alias tree='exa -T'

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

fortune -s -n 40

