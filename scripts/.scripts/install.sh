#!/bin/bash

# Packages update and installation
sudo pacman -Syuu --noconfirm
sudo pacman -S --noconfirm ly i3 i3lock yay fprintd libfprint alacritty picom polybar obsidian brightnessctl python-pipx docker wireguard-tools rofi rofi-emoji rofi-calc xclip maim zsh stow

# Enabling services
sudo systemctl enable --now ly@tty1.service
sudo systemctl enable --now docker
sudo systemctl enable --now systemd-resolved.service

# Chrome and Font installation 
yay -S --noconfirm ttf-meslo-nerd google-chrome

# Exegol installation
pipx install exegol
pipx ensurepath
sudo usermod -aG docker $(id -u -n)

# Setup finger-print authentication
sudo fprintd-enroll yannis

# Adding the finger print as authentication (keeping the original files with the ~ option)
sed -i "1iauth sufficient pam_unix.so try_first_pass likeauth nullok\nauth sufficient pam_fprintd.so" /etc/pam.d/ly
sed -i "1iauth sufficient pam_unix.so try_first_pass likeauth nullok\nauth sufficient pam_fprintd.so" /etc/pam.d/i3lock
sed -i "1iauth sufficient pam_unix.so try_first_pass likeauth nullok\nauth sufficient pam_fprintd.so" /etc/pam.d/sudo

# Modifying scroll orientation
sed -i '/MatchIsTouchpad "on"/a\\tOption "NaturalScrolling" "True"' /usr/share/X11/xorg.conf.d/40-libinput.conf
