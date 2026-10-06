#!/usr/bin/bash
set -ouex pipefail

### Install packages (Fedora repos)
# dnf5 install -y tmux htop

### Remove packages you don't want
# dnf5 remove -y firefox

### Enable / disable services
# systemctl enable podman.socket

### OS identity (shown in "About" and fastfetch)
OS_NAME="Nocturne"
sed -i "s/^NAME=.*/NAME=\"${OS_NAME}\"/" /usr/lib/os-release
sed -i "s/^PRETTY_NAME=.*/PRETTY_NAME=\"${OS_NAME} (based on Bazzite)\"/" /usr/lib/os-release
