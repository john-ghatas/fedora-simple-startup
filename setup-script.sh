#!/bin/bash
echo "Updating the system before installing anything..."
sudo dnf update -y

echo "Installing pacakges..."
sudo dnf install thunderbird wget rstudio okular zsh gnome-tweaks gnome-shell-extension-dash-to-dock gnome-extensions-app -y

# Install packages required for R development
echo  "Installing development package for R..."
sudo dnf install r-devel -y

# Install RPMFusion
echo "Installing multimedia libraries......"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

# Install VSCodium
echo "Installing VSCode......"
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium -y

# Enable fractional scaling
echo "Enable fractional scaling......"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Init flatpak
echo "Enabling non-free Flatpak repository for extra software compatiblity......"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
