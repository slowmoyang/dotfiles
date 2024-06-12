if status is-interactive
    # Commands to run in interactive sessions can go here
end

###############################################################################
# add paths
###############################################################################
fish_add_path $HOME/opt/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/opt/pass-py
fish_add_path $HOME/.local/bin

switch (uname)
case Linux
    #
case Darwin
    fish_add_path /opt/homebrew/bin
case '*'
    #
end

###############################################################################
# setup mamba
###############################################################################
switch (uname)
case Linux
    set -gx MAMBA_EXE "$HOME/.local/bin/micromamba"
case Darwin
    set -gx MAMBA_EXE "/opt/homebrew/bin/micromamba"
case '*'
    echo ""
end
set -gx MAMBA_ROOT_PREFIX "$HOME/opt/micromamba"
micromamba shell hook --shell fish | source
abbr mamba micromamba

###############################################################################
#
###############################################################################
set -U EDITOR nvim
set -U fish_greeting
set -U nvm_default_version v21.7.3

starship init fish | source

set -U XAUTHORITY {$HOME}/.Xauthority
