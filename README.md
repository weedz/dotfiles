# dotfiles

## Required applications

* `mako` - notifications
* `sway`
  * `waybar`
    * [`mediaplayer`](https://github.com/Alexays/Waybar/blob/master/resources/custom_modules/mediaplayer.py) plugin from waybar repository
* `rofi` [wayland fork](https://github.com/lbonn/rofi) (rofi-lbonn-wayland-git` on the AUR) 
* `gnome-keyring`
* `polkit-gnome`
* `zsh`
* `playerctl` - Handle media keys
* `gammastep` - Controls the monitor color temperature
* `broot` (`br`) - https://github.com/Canop/broot
* [Starship](https://starship.rs/)
* [kitty](https://github.com/kovidgoyal/kitty)
* `exa` - ls "replacement"
* `bat` - cat "replacement"
* [zoxide](https://github.com/ajeetdsouza/zoxide) - better `cd` command

Font: `JetBrainsMonoNL Nerd Font Mono` https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular

## Set gtk theme

* `lxappearance`
* `gtk-chtheme`
* `gsettings set org.gnome.desktop.interface gtk-theme <theme>`

## JAVA

Java applications might need `env GDK_BACKEND=x11`

## Set default application

Install `handlr-bin` and `xdg-utils-handlr` (to replace `xdg-open`). Should just work.

Make sure to handle `inode/directory`. Example for the nemo file manager: `handlr set inode/directory nemo.desktop`
