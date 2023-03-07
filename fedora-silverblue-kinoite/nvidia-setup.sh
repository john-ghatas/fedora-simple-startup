#!/bin/bash
echo "Setting up the NVIDIA drivers"
sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia
sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia-cuda
sudo rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1 initcall_blacklist=simpledrm_platform_driver_init

echo "Please run the following ostree command if you're installing silverblue on an NVIDIA only system"
echo "sudo rpm-ostree install nvidia-vaapi-backend" 

echo "Please reboot again to make the changes final"