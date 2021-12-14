# dotfiles

## Required applications
* `i3wm`/`i3-gaps`
* `rofi`
  * `rofi-power-menu`
* `gnome-keyring`
* `polkit-gnome`
* probably gnome?
* `dex`
* `zsh`
* `playerctl` (to handle media keys)

Font: `JetBrainsMonoNL Nerd Font Mono` https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular

## Set gtk theme
* `lxappearance`
* `gtk-chtheme`


## Set default application
Find out the mime type:
```
$ xdg-mime query filetype [file]
```

Then set appropriate ".desktop" file:
```
$ xdg-mime default [.desktop] [mime type]
```
