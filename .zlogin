#!/usr/bin/env zsh

alias vim="nvim"
export TERMINAL=/usr/bin/footclient
# export VISUAL=nvim
# export EDITOR="$VISUAL"

# Execute code in the background to not affect the current session
(
    autoload -U zrecompile
    zrecompile -p \
        -R "$HOME/.zshrc" -- \
        -M "$HOME/.zcompdump"
) &!
