#!/bin/bash
sudo rpm-ostree update
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Init flatpak
echo "Enabling non-free Flatpak repository for extra software compatiblity......"
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak override --user --filesystem=~/.themes --filesystem=~/.config/gtk-4.0

echo "Please reboot to continue" 
