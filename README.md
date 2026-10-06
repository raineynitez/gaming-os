# Gaming OS

A custom Fedora Atomic gaming OS built on [Bazzite](https://bazzite.gg) / Universal Blue.
The OS is a container image defined by `Containerfile` and built by GitHub Actions.

## Layout
- `Containerfile`: base image + build steps
- `build_files/build.sh`: packages, services, OS identity
- `system_files/`: files copied into `/` (branding, configs)
- `.github/workflows/build.yml`: builds and publishes to `ghcr.io/<you>/gaming-os`

## Using a build
On an existing Bazzite/Fedora Atomic machine:

    sudo bootc switch ghcr.io/<your-github-user>/gaming-os:latest

## Roadmap
1. Living-room PC target (desktop + optional gamescope session)
2. Branding: name, wallpaper, boot splash, theme
3. ISO generation (bootc-image-builder)
4. Handheld target (ROG Xbox Ally X)
