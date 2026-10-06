#!/usr/bin/bash
set -ouex pipefail

### Install packages (Fedora repos)
# dnf5 install -y tmux htop

### Remove packages you don't want
# dnf5 remove -y firefox

### Enable / disable services
# systemctl enable podman.socket

### OS identity (shown in "About" and fastfetch)
# sed -i 's/^NAME=.*/NAME="Gaming OS"/' /usr/lib/os-release
