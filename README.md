# dotfiles

## Required applications

* `mako` - notifications
* `sway`
  * `waybar`
    * [`mediaplayer`](https://github.com/Alexays/Waybar/blob/master/resources/custom_modules/mediaplayer.py) plugin from waybar repository
* `rofi`
  * `rofi-power-menu`
* `gnome-keyring`
* `polkit-gnome`
* probably gnome?
* `zsh`
* `playerctl` - Handle media keys
* `Clipman` - Handle clipboard. Does not always work flawlessly between sway/wayland/xwayland
* `gammastep` - Controls the monitor color temperature

Font: `JetBrainsMonoNL Nerd Font Mono` https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular

## Set gtk theme

* `lxappearance`
* `gtk-chtheme`

## JAVA

Java applications might need `env GDK_BACKEND=x11`

## Set default application

Install `handlr-bin` and `xdg-utils-handlr` (to replace `xdg-open`). Should just work.

Make sure to handle `inode/directory`.
