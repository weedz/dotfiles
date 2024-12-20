function c() {
  # Use `fzf` to `cd` into a directory
  #DIR=$(fd --hidden --no-ignore --type=directory | fzf)

  if DIR=$(fd --type=directory --exclude='node_modules' --exclude='vendor' . ~/Documents/ | fzf); then
    cd "$DIR" || exit 1
  fi
}

function y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd" || true
  fi
  rm -f -- "$tmp"
}
