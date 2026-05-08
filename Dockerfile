FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    live-build \
    debootstrap \
    grub-efi-amd64-bin \
    grub-pc-bin \
    isolinux \
    xorriso \
    squashfs-tools \
    git \
    mtools \
    ca-certificates \
    systemd-sysv \
    && apt clean

