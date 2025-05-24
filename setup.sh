#!/usr/bin/env sh

set -eux

doas pacman -Suy

# work-in-progress list of packages and applications
doas pacman -S --needed \
  stow \
  git \
  htop \
  zsh \
  neovim \
  sheldon \
  sway \
  pipewire pipewire-pulse pipewire-alsa wireplumber xdg-desktop-portal xdg-desktop-portal-wlr \
  xorg-xwayland \
  wl-clipboard \
  handlr-regex \
  waybar \
  mako \
  rofi-wayland \
  gnome-keyring \
  keepassxc \
  polkit-kde-agent \
  playerctl \
  gammastep \
  foot \
  eza \
  bat \
  git-delta \
  tealdeer

doas pacman -S --needed \
  spotify-launcher \
  obs-studio \
  ffmpeg \
  mpv \
  nemo \
  engrampa \
  steam-native-runtime \
  qalculate-gtk \
  helvum \
  meld \
  dust
