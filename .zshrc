# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# zmodload zsh/zprof

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Add cargo "installed" packages to PATH
PATH="$HOME/.cargo/bin:$PATH"

# Add go and "installed" go packages to PATH
# PATH="$HOME/bin/go/bin:$HOME/go/bin:$PATH"

# `n` node version manager
export N_PREFIX="$HOME/n"
if [ -d "$N_PREFIX/bin" ] ; then
    PATH="$N_PREFIX/bin:$PATH"
fi

export RUSTUP_TOOLCHAIN="stable"

#source "$HOME/.cargo/env"

# alias ls="ls --color"
alias ls="eza"
alias cat="bat"
#alias ssh="kitty +kitten ssh"
alias cd="z"

alias hist='print -z $(tac ~/.zsh_history | fzf)'

# Use `doas` instead of `sudo`
alias sudo="doas"
alias sudoedit="doas rnano"

#alias screenkey="wshowkeys -a bottom -m 200 -t 2"

# Bind ctrl+[left/right arrow]
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# pnpm
export PNPM_HOME="/home/weedz/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

eval "$(sheldon source)"

setopt promptsubst

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history

fpath=(
    $fpath
    ~/autoloaded
    ~/.config/zsh/completions
)

autoload -Uz compinit;
if [[ $(date +'%j') != $(zstat +mtime -F '%j' ~/.zcompdump) ]]; then
  compinit
  autoload -U zrecompile
    zrecompile -p \
        -R ~/.zshrc -- \
        -M ~/.zcompdump
  touch ~/.zcompdump
fi
compinit -C

zstyle ":completion:*" menu select
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

eval "$(zoxide init zsh)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.config/zsh/script.sh

