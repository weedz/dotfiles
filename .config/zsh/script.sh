function c() {
  # Use `fzf` to `cd` into a directory
  #DIR=$(fd --hidden --no-ignore --type=directory | fzf)

  if DIR=$(fd --type=directory --absolute-path --exclude='node_modules' --exclude='node_modules.asar.unpacked' --exclude='dist' --exclude='vendor' --exclude='target' . ~/Documents/ | fzf); then
    cd "$DIR" || exit 1
  fi
}
