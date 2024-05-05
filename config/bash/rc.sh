# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PATH=${HOME}/opt:${PATH}

source ${HOME}/.config/bash/conf.d/micromamba.sh
source ${HOME}/.config/bash/conf.d/nvm.sh
source ${HOME}/.config/bash/conf.d/rust.sh

export STARSHIP_CONFIG=${HOME}/.config/starship.toml
eval "$(starship init bash)"

eval "$(zoxide init bash)"

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
