#!/bin/bash
source /etc/os-release

read -p "What version of Fedora are you upgrading to? (37, 38 etc): " NEXT_VERSION
echo "Upgrading to Fedora $NEXT_VERSION from Fedora $VERSION_ID"
read -p "Press any key to continue...." 

sudo rpm-ostree rebase fedora:fedora/$NEXT_VERSION/x86_64/kinoite \
  --uninstall=rpmfusion-free-release-$VERSION_ID-1.noarch \
  --uninstall=rpmfusion-nonfree-release-$VERSION_ID-1.noarch \
  --install=https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$NEW_VERSION.noarch.rpm \
  --install=https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$NEW_VERSION.noarch.rpm
