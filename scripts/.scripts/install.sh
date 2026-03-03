#!/bin/bash


sudo pacman -Syuu --noconfirm
sudo pacman -S --noconfirm ly i3 i3lock yay fprintd libfprint alacritty picom polybar obsidian brightnessctl python-pipx docker wireguard-tools rofi rofi-emoji rofi-calc xclip maim zsh
sudo systemctl enable --now ly@tty1.service
sudo systemctl enable --now docker
sudo systemctl enable --now systemd-resolved.service
yay -S --noconfirm ttf-meslo-nerd google-chrome
pipx install exegol
pipx ensurepath
sudo usermod -aG docker $(id -u -n)
sudo fprintd-enroll yannis
