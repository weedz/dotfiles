# zmodload zsh/zprof

export VISUAL="nvim"
export EDITOR="$VISUAL"

VI_MODE_SET_CURSOR=true
source ~/.config/zsh/vi-mode.zsh

bindkey -v
bindkey -M vicmd v edit-command-line

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# Disable telemetry, https://github.com/nikolaxhristov/dot/blob/main/.bashrc
export ADBLOCK=true
export ASTRO_TELEMETRY_DISABLED=1
export AUTOMATEDLAB_TELEMETRY_OPTOUT=1
export AZURE_CORE_COLLECT_TELEMETRY=0
export CHOOSENIM_NO_ANALYTICS=1
export DIEZ_DO_NOT_TRACK=1
export DO_NOT_TRACK=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT=1
export ET_NO_TELEMETRY=1
export GATSBY_TELEMETRY_DISABLED=1
export GATSBY_TELEMETRY_OPT_OUT=1
export GATSBY_TELEMETRY_OPTOUT=1
export HASURA_GRAPHQL_ENABLE_TELEMETRY=false
export HINT_TELEMETRY=off
export HOMEBREW_NO_ANALYTICS=1
export INFLUXD_REPORTING_DISABLED=true
export ITERATIVE_DO_NOT_TRACK=1
# export NEXT_TELEMETRY_DEBUG=0
export NEXT_TELEMETRY_DISABLED=1
export NG_CLI_ANALYTICS=false
export NUXT_TELEMETRY_DISABLED=1
export PIN_DO_NOT_TRACK=1
export POWERSHELL_TELEMETRY_OPTOUT=1
export SAM_CLI_TELEMETRY=0
export STNOUPGRADE=1
export STRIPE_CLI_TELEMETRY_OPTOUT=1

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Add cargo "installed" packages to PATH
PATH="$HOME/.cargo/bin:$PATH"

# Add go and "installed" go packages to PATH
# PATH="$HOME/bin/go/bin:$HOME/go/bin:$PATH"

# pnpm
export PNPM_HOME="/home/weedz/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# `n` node version manager
export N_PREFIX="$HOME/n"
if [ -d "$N_PREFIX/bin" ] ; then
    PATH="$N_PREFIX/bin:$PATH"
fi

# `deno`
# export DENO_INSTALL_ROOT="$HOME/.local/share/deno/bin"
# export PATH="$DENO_INSTALL_ROOT:$PATH"

#source "$HOME/.cargo/env"

# alias ls="ls --color"
alias ls="eza"
alias cat="bat"
#alias ssh="kitty +kitten ssh"
alias ll="ls -la"

alias hist='print -z $(tac "$HOME/.zsh_history" | fzf)'

# Use `doas` instead of `sudo`
alias sudo="doas"
alias sudoedit="doas rnano"

#alias screenkey="wshowkeys -a bottom -m 200 -t 2"

# Bind ctrl+[left/right arrow]
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

fpath=(
    $fpath
    "$HOME/autoloaded"
    "$HOME/.config/zsh/completions"
)

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

PURE_GIT_PULL=0

eval "$(sheldon source)"

setopt promptsubst

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

autoload -Uz compinit;
zmodload -F zsh/stat b:zstat
if [[ $(date +'%j') != $(zstat +mtime -F '%j' "$HOME/.zcompdump") ]]; then
  compinit
  autoload -U zrecompile
    zrecompile -p \
        -R "$HOME/.zshrc" -- \
        -M "$HOME/.zcompdump"
  touch "$HOME/.zcompdump"
fi
compinit -C

zstyle ":completion:*" menu select
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# NOTE: For some reason `pnpm` does not want to work with fpath, and needs to be "sourced" after `compinit`
source $HOME/.config/zsh/bad_completions/_pnpm

source "$HOME/.config/zsh/script.sh"

# Foot, shell integration
precmd() {
    print -Pn "\e]133;A\e\\"
}
function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd
