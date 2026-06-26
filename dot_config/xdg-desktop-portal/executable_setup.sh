#!/bin/sh

# This is to get screenshare on discord working
sudo pacman -S --needed xdg-desktop-portal-gnome xdg-desktop-portal-gtk slurp
systemctl --user daemon-reload
systemctl --user restart xdg-desktop-portal
