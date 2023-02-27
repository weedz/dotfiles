#!/usr/bin/env zsh

# Execute code in the background to not affect the current session
(
    autoload -U zrecompile
    zrecompile -p \
        -R ~/.zshrc -- \
        -M ~/.zcompdump
) &!
