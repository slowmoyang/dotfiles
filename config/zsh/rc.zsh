export PATH=${HOME}/.local/bin:${PATH}
export PATH=${HOME}/opt/bin:${PATH}

ZSH_CONFD=${HOME}/.config/zsh/conf.d
source ${ZSH_CONFD}/micromamba.zsh
source ${ZSH_CONFD}/misc.zsh

export STARSHIP_CONFIG=${HOME}/.config/starship.toml
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

alias c="clear"
alias g="git"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias j="just"

alias ls="exa --group-directories-first"
alias ll="exa --long --group-directories-first"
alias la="exa --long -all --header --group-directories-first"
alias l="ls"

alias rm="rm -i"
