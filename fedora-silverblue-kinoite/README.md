# How to use the script
With the nature of fedora Silverblue/Kinoite multiple scripts are needed with multiple reboot. The following order of the script is needed to make this work, **Please take note of what dedicated/primary GPU your system is using (AMD/INTEL/NVIDIA)**:

- `./init-setup.sh`
- Reboot
- `./post-reboot.sh` 
    - In case of an AMD system run the following command and then reboot
    - `sudo rpm-ostree override remove mesa-vdpau-drivers --install mesa-vdpau-drivers-freeworld`
    - In case of an Intel system run the following command and then reboot
    - `sudo rpm-ostree install intel-media-driver`
- Reboot again -> You can choose to install the NVIDIA drivers on the current cycle, please note in case of any issues this will be harder to isolate
- **Only run this step if you have an NVIDIA gpu**
    - `./nvidia-setup.sh`
    - If the NVIDIA gpu is your primary display output (in case of a desktop etc.) run the following command
    - `sudo rpm-ostree install nvidia-vaapi-backend`
    - Reboot again

You are done, I provided an upgrade script as well in case you need to upgrade Kinoite/Silverblue


The `upgrade.sh` script is provided in case of a new major version, run the script by issueing the following command `./upgrade.sh`. The output will look like this:
```
./upgrade.sh
What version of Fedora are you upgrading to? (37, 38 etc): 38
Upgrading to Fedora 38 from Fedora 37
Press any key to continue....  
```
