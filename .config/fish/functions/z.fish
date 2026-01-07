function z
    # Use `fzf` to `cd` into a directory
    set DIR $(fd --type=directory --absolute-path --exclude='node_modules' --exclude='node_modules.asar.unpacked' --exclude='dist' --exclude='vendor' --exclude='target' . ~/Documents/ | fzf-tmux --scheme=path)

    if test -d "$DIR"
        cd "$DIR" || exit 1
    end
end
