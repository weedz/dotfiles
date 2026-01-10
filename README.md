# dotfiles

Setup with `stow`. Clone this repo into `$HOME/dotfiles`, cd into `dotfiles` and then run `stow .`. To sync changes into this repo you can run `stow --adopt .`.

## Required applications

- [pary](https://github.com/Morganamilo/paru) - AUR build tool/helper
- `mako` - notifications
- `sway`
  - `waybar`
    - [`mediaplayer`](https://github.com/Alexays/Waybar/blob/master/resources/custom_modules/mediaplayer.py) plugin from waybar repository
- `rofi-wayland` [wayland fork](https://github.com/lbonn/rofi)
- `gnome-keyring`
  - TODO: Replace "secret service" with keepassxc.
- [keepassxc](https://github.com/keepassxreboot/keepassxc)
- `polkit-kde-agent`
- `fish`
- `playerctl` - Handle media keys
- `gammastep` - Controls the monitor color temperature
- [light](https://archlinux.org/packages/community/x86_64/light/) - Change screen brightness
- [foot](https://codeberg.org/dnkl/foot) - Terminal
- [eza](https://github.com/eza-community/eza) - ls replacement
- `bat` - cat replacement
- `wl-clipboard` - Command-line copy/paste utilities for Wayland
- `neovim` (btw :neckbeard:)
- [delta](https://github.com/dandavison/delta) - git pager
- [tealdeer](https://github.com/tealdeer-rs/tealdeer) - TLDR man pages

Font: `JetBrainsMonoNL Nerd Font Mono` <https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular>

## GTK theme

- `lxappearance`
- `gtk-chtheme`
- `gsettings set org.gnome.desktop.interface gtk-theme <theme>`

## Qt theme

- `kvantum` (<https://github.com/tsujan/Kvantum>)
- `qt5ct`
- `qt6ct`

## JAVA

Java applications might need `env GDK_BACKEND=x11`

## Set default application

Install `handlr-bin` and `xdg-utils-handlr` (to replace `xdg-open`). Should just work.

Make sure to handle `inode/directory`. Example for the nemo file manager: `handlr set inode/directory nemo.desktop`.

Set default browser:

```console
xdg-mime default firefox x-scheme-handler/https x-scheme-handler/http
```

## Checkout subset of files

```console
git clone --sparse -n --depth=1 --filter=tree:0 https://github.com/weedz/dotfiles ./dotfiles
cd dotfiles
# For example only neovim configs:
git sparse-checkout set --no-cone .config/nvim
git checkout
```
