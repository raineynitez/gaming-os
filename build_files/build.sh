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

### Disable repos whose GPG keys aren't available to bootc-image-builder
### (otherwise the installer ISO build fails at dependency resolution)
for f in $(grep -l '^\[terra-mesa\]' /etc/yum.repos.d/*.repo 2>/dev/null || true); do
  sed -i '/^\[terra-mesa\]/,/^\[/ s/^enabled=1/enabled=0/' "$f"
done
