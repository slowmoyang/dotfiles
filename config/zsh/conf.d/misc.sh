#!/usr/bin/env zsh

# https://docs.gitignore.io/install/command-line#linux-zsh
function gi() {
    curl -sLw \"\\\n\" https://www.toptal.com/developers/gitignore/api/\$@ ;
}
