#!/usr/bin/env bash
set -euo pipefail

# Copy system files into the image
cp -r /ctx/files/* /

# Can I do something like this?
dnf install -y mangowm \
               foot    \
               rofi

# services
systemctl enable podman.socket


# aaaand we are done
dnf clean all