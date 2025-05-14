#!/bin/bash

set -e

# Actualizar sistema
sudo pacman -Syu --noconfirm

# Instalar yay desde AUR
cd /tmp
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si --noconfirm
cd ..
rm -rf yay-git

# Instalar paquetes desde AUR
yay -S --noconfirm \
  hyprland \
  kitty \
  wl-clip-persist \
  swaylock-effects \
  sddm-theme-sugar-candy-git \
  megatools

# Instalar paquetes desde repos oficial
sudo pacman -S --noconfirm \
  rofi \
  sddm \
  zsh \
  lsd \
  bat \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  swayidle \
  hyprpaper \
  waybar \
  polkit \
  polkit-gnome \
  nemo \
  pavucontrol \
  slurp \
  grim \
  swappy \
  neofetch \
  wget \
  unzip \
  pamixer \
  wl-clipboard

echo "✅ Instalación completada correctamente."
