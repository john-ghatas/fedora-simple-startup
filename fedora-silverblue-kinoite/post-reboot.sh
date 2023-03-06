#!/bin/bash
echo "Setting up packages" 
sudo rpm-ostree install distrobox docker ffmpeg gnome-tweaks gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi mesa-va-drivers-freeworld neovim piper tilix zsh 
sudo rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld

echo "Adding permissions for docker" 
sudo runuser -l root -c "grep -E '^docker:' /usr/lib/group >> /etc/group"
sudo runuser -l root -c "usermod -aG docker $USER"

echo "Install the hardware codecs for your system"
echo "AMD: rpm-ostree override remove mesa-vdpau-drivers --install mesa-vdpau-drivers-freeworld"
echo "Intel: sudo rpm-ostree install intel-media-driver"

echo "Please reboot again to make the changes final" 
