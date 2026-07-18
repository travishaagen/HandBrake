#!/usr/bin/env bash
# Installs HandBrake's Linux build dependencies (mirrors .github/workflows/linux.yml).
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get install -y \
    autoconf automake build-essential libass-dev libbz2-dev libfontconfig1-dev \
    libfreetype6-dev libfribidi-dev libharfbuzz-dev libjansson-dev liblzma-dev \
    libmp3lame-dev libnuma-dev libturbojpeg0-dev libssl-dev \
    libogg-dev libopus-dev libsamplerate0-dev libspeex-dev libtheora-dev \
    libtool libtool-bin libvorbis-dev libx264-dev libxml2-dev libvpx-dev \
    make nasm ninja-build meson patch tar zlib1g-dev appstream \
    gettext libglib2.0-dev libgtk-4-dev \
    libva-dev libdrm-dev llvm clang

# cargo-c is required to build the rav1e contrib library
if ! command -v cargo-cbuild >/dev/null 2>&1; then
    cargo install cargo-c
fi
