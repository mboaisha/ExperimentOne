#!/usr/bin/env bash
set -euo pipefail

# Copy system files into the image
cp -r /ctx/files/* /



# services
systemctl enable podman.socket


# aaaand we are done
dnf clean all