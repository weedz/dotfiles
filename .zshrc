zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit snippet OMZP::command-not-found

zinit for \
    light-mode  zsh-users/zsh-completions \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma-continuum/fast-syntax-highlighting \
                zdharma-continuum/history-search-multi-word
    # light-mode pick"async.zsh" src"pure.zsh" \
    #             sindresorhus/pure

# zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

setopt promptsubst

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history

autoload -U compinit; compinit
zstyle ":completion:*" menu select
# zstyle ':completion:*' special-dirs true
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# Add go and "installed" go packages to PATH
# PATH="$HOME/bin/go/bin:$HOME/go/bin:$PATH"

# `n` node version manager
export N_PREFIX="$HOME/n"
if [ -d "$N_PREFIX/bin" ] ; then
    export PATH="$N_PREFIX/bin:$PATH"
fi

# We get this from .profile
# source "$HOME/perl5/perlbrew/etc/bashrc"
# perlbrew use perl-5.36.0

export RUSTUP_TOOLCHAIN="stable"

#source "$HOME/.cargo/env"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

# alias ls="ls --color"
alias ls="exa"
alias cat="bat"
alias ssh="kitty +kitten ssh"
alias cd="z"

# Use `doas` instead of `sudo`
alias sudo="doas"
alias sudoedit="doas rnano"

alias screenkey="wshowkeys -a bottom -m 200 -t 2"

# Bind ctrl+[left/right arrow]
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# eval "$(starship init zsh)"
source <(/usr/bin/starship init zsh --print-full-init)

source /home/weedz/.config/broot/launcher/bash/br
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/home/weedz/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export DENO_INSTALL="/home/weedz/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
