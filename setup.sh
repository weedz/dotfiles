#!/usr/bin/env sh

set -eux

sudo pacman -Suy

# work-in-progress list of packages and applications
sudo pacman -S --needed \
  stow \
  git \
  htop \
  zsh \
  fish \
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

sudo pacman -S --needed \
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
