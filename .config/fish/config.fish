fish_add_path "$HOME/bin"
fish_add_path "$HOME/.cargo/bin"

set -gx PNPM_HOME "/home/weedz/.local/share/pnpm"
fish_add_path "$PNPM_HOME"

set -gx N_PREFIX "$HOME/n"
if test -d "$N_PREFIX/bin"
    fish_add_path "$N_PREFIX/bin"
end

# alias ls="ls --color"
alias ls="eza"
alias cat="bat"
#alias ssh="kitty +kitten ssh"
alias ll="ls -la"
alias rg='rg --no-follow --glob "!{/proc,/dev,/sys,**/.git/*}"'
alias fd='fd --exclude /proc --exclude /sys --exclude /dev --exclude .git'

# Use `doas` instead of `sudo`
alias sudo="doas"
alias sudoedit="doas rnano"

set MANPAGER 'nvim +Man!'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
