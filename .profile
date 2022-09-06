# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# `n` node version manager
export N_PREFIX="$HOME/n"
if [ -d "$N_PREFIX/bin" ] ; then
    export PATH="$N_PREFIX/bin:$PATH"
fi

export VDPAU_DRIVER="radeonsi"

export RUA_SUDO_COMMAND="doas"

source "$HOME/perl5/perlbrew/etc/bashrc"
perlbrew use perl-5.36.0

# source "$HOME/.cargo/env"

alias sudo="doas"
alias sudoedit="doas rnano"
