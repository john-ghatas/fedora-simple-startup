#!/bin/bash
CURRENT_VERSION=$(grep VERSION_ID /etc/os-release | grep -o -E "[0-9]{1,4}")

read -p "What version of Fedora are you upgrading to? (37, 38 etc): " NEXT_VERSION
echo "Upgrading to Fedora $NEXT_VERSION from Fedora $CURRENT_VERSION"
read -p "Press any key to continue...." 

sudo rpm-ostree rebase fedora:fedora/$NEXT_VERSION/x86_64/silverblue \
  --uninstall=rpmfusion-free-release-$CURRENT_VERSION-1.noarch \
  --uninstall=rpmfusion-nonfree-release-$CURRENT_VERSION-1.noarch \
  --install=https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$NEW_VERSION.noarch.rpm \
  --install=https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$NEW_VERSION.noarch.rpm
