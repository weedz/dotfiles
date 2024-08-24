#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

_set_my_PS1() {
    PS1='[\u@\h \W]\$ '
}
_set_my_PS1
unset -f _set_my_PS1

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..' # show long listing of all except ".."
alias l='ls -lav --ignore=.?*' # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
