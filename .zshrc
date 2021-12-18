# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Add go and "installed" go packages to PATH
PATH="$HOME/bin/go/bin:$HOME/go/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
# # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source "$HOME/perl5/perlbrew/etc/bashrc"
perlbrew use perl-5.34.0

#source "$HOME/.cargo/env"

# zmodload zsh/zprof

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

export DOTNET_CLI_TELEMETRY_OPTOUT=1

alias ls="ls --color"

# alias node="unalias node; unalias npm; nvm use default ; node $@"
# alias npm="unalias node; unalias npm; nvm use default ; npm $@"
# alias nvm="unalias node; unalias nvm; nvm $@"

# Bind ctrl+[left/right arrow]
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

setopt promptsubst

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history

zstyle ":completion:*" menu select

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
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit snippet OMZP::command-not-found

zinit for \
    light-mode  zsh-users/zsh-completions \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma-continuum/fast-syntax-highlighting \
                zdharma-continuum/history-search-multi-word
    # light-mode pick"async.zsh" src"pure.zsh" \
    #             sindresorhus/pure

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# tabtab source for packages
# uninstall by removing these lines
#[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true


# Configuration for `nnn` file manager
export NNN_OPTS="dHn" # if you prefer to have all the options at the same place
export LC_COLLATE="C" # hidden files on top
export NNN_FIFO="/tmp/nnn.fifo" # temporary buffer for the previews
export NNN_FCOLORS="AAAAE631BBBBCCCCDDDD9999" # feel free to change the colors
export NNN_PLUG='p:preview-tui' # many other plugins are available here: https://github.com/jarun/nnn/tree/master/plugins
export SPLIT='v' # to split Kitty vertically
#-----
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi
alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"
