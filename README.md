# dotfiles

## Required applications

* [sheldon](https://github.com/rossmacarthur/sheldon#cargo) - Shell plugin manager. Install with `cargo install sheldon`
* `mako` - notifications
* `sway`
  * `waybar`
    * [`mediaplayer`](https://github.com/Alexays/Waybar/blob/master/resources/custom_modules/mediaplayer.py) plugin from waybar repository
* `rofi` [wayland fork](https://github.com/lbonn/rofi) (`rofi-lbonn-wayland-git` on the AUR) 
* `gnome-keyring`
* `polkit-gnome`
* `zsh`
* `playerctl` - Handle media keys
* `gammastep` - Controls the monitor color temperature
* [light](https://archlinux.org/packages/community/x86_64/light/) - Change screen brightness
* `broot` (`br`) - https://github.com/Canop/broot
* [Starship](https://starship.rs/)
* [kitty](https://github.com/kovidgoyal/kitty)
* `exa` - ls "replacement"
* `bat` - cat "replacement"
* [zoxide](https://github.com/ajeetdsouza/zoxide) - better `cd` command
* `wl-clipboard` - Command-line copy/paste utilities for Wayland
* `neovim` (btw :neckbeard:)

Font: `JetBrainsMonoNL Nerd Font Mono` https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular

## GTK theme

* `lxappearance`
* `gtk-chtheme`
* `gsettings set org.gnome.desktop.interface gtk-theme <theme>`

## Qt theme

* `kvantum` (https://github.com/tsujan/Kvantum)
* `qt5ct`
* `qt6ct`

## JAVA

Java applications might need `env GDK_BACKEND=x11`

## Set default application

Install `handlr-bin` and `xdg-utils-handlr` (to replace `xdg-open`). Should just work.

Make sure to handle `inode/directory`. Example for the nemo file manager: `handlr set inode/directory nemo.desktop`
