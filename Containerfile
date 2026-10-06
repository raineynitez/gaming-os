# Base image: Bazzite (Fedora Atomic + gaming stack).
# Variants (swap the tag name to change hardware target):
#   bazzite              - AMD/Intel desktop (KDE)
#   bazzite-nvidia       - NVIDIA (older GTX cards)
#   bazzite-nvidia-open  - NVIDIA open kernel modules (RTX 20-series and newer; required for RTX 50 / Blackwell)
#   bazzite-deck         - boots into the Steam gaming-mode session (handheld / living-room PC)
# See https://github.com/ublue-os/bazzite#image-variants
ARG BASE_IMAGE="ghcr.io/ublue-os/bazzite-nvidia-open"
ARG BASE_TAG="stable"

# Files copied into the image as-is (branding, configs, systemd units, ...)
FROM scratch AS ctx
COPY build_files /build_files
COPY system_files /system_files

FROM ${BASE_IMAGE}:${BASE_TAG}

# Overlay static files onto the root filesystem
COPY system_files/ /

# Run the customization script
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build.sh

# Validate the image is a proper bootc image
RUN bootc container lint
