#!/usr/bin/env bash
set -euo pipefail

# Copy system files into the image
cp -r /ctx/files/* /

# TODO: figure out which things don't need to be here for everyone i.e. in a justfile / optional post-install script
dnf -y install \
  -x PackageKit* \
  NetworkManager \
  NetworkManager-adsl \
  NetworkManager-bluetooth \
  NetworkManager-config-connectivity-fedora \
  NetworkManager-libnm \
  NetworkManager-openconnect \
  NetworkManager-openvpn \
  NetworkManager-strongswan \
  NetworkManager-ssh \
  NetworkManager-ssh-selinux \
  NetworkManager-vpnc \
  NetworkManager-wifi \
  NetworkManager-wwan \
  alsa-firmware \
  alsa-sof-firmware \
  alsa-tools-firmware \
  atheros-firmware \
  audispd-plugins \
  audit \
  brcmfmac-firmware \
  cifs-utils \
  cups \
  cups-pk-helper \
  dymo-cups-drivers \
  firewalld \
  fprintd \
  fprintd-pam \
  fuse \
  fuse-common \
  fwupd \
  gum \
  gvfs-archive \
  gvfs-mtp \
  gvfs-nfs \
  gvfs-smb \
  hplip \
  hyperv-daemons \
  ibus \
  ifuse \
  intel-audio-firmware \
  iwlegacy-firmware \
  iwlwifi-dvm-firmware \
  iwlwifi-mvm-firmware \
  jmtpfs \
  kernel-modules-extra \
  libcamera{,-{v4l2,gstreamer,tools}} \
  libimobiledevice \
  libimobiledevice-utils \
  libratbag-ratbagd \
  man-db \
  man-pages \
  mobile-broadband-provider-info \
  mt7xxx-firmware \
  nxpwireless-firmware \
  open-vm-tools \
  open-vm-tools-desktop \
  openconnect \
  pam_yubico \
  pcsc-lite \
  plymouth \
  plymouth-system-theme \
  printer-driver-brlaser \
  ptouch-driver \
  qemu-guest-agent \
  realtek-firmware \
  rsync \
  spice-vdagent \
  steam-devices \
  switcheroo-control \
  system-config-printer-libs \
  system-config-printer-udev \
  systemd-container \
  systemd-oomd-defaults \
  tiwilink-firmware \
  tuned \
  tuned-ppd \
  unzip \
  usb_modeswitch \
  uxplay \
  vpnc \
  whois \
  wireguard-tools \
  zram-generator-defaults \
  python3-pip \
  git


# i3 stuff
dnf -y install \
  i3 \
  i3status \
  lightdm \
  lightdm-gtk \
  lightdm-gobject \
  lightdm-gtk-greeter-settings \
  xorg-x11-server-Xorg \
  xorg-x11-server-common \
  xorg-x11-xinit \
  xorg-x11-xauth \
  xorg-x11-drv-amdgpu \
  xorg-x11-drv-ati \
  xorg-x11-drv-intel \
  xorg-x11-drv-libinput \
  xorg-x11-drv-nouveau \
  xorg-x11-drv-qxl \
  xorg-x11-drv-vmware \
  xorg-x11-drv-wacom \
  mesa-dri-drivers \
  mesa-vulkan-drivers \
  mesa-libGL \
  mesa-libEGL \
  mesa-libgbm \
  vulkan-loader \
  dbus-x11 \
  xdg-desktop-portal \
  xdg-desktop-portal-gtk \
  xdg-user-dirs \
  xdg-utils \
  xrandr \
  xmodmap \
  xhost \
  xrdb \
  xprop \
  setxkbmap \
  polkit \
  xfce-polkit \
  rtkit \
  gnome-keyring \
  gnome-keyring-pam

# Audio
dnf -y install \
  pipewire \
  pipewire-alsa \
  pipewire-pulseaudio \
  pipewire-jack-audio-connection-kit \
  pipewire-libs \
  wireplumber \
  wireplumber-libs \
  pavucontrol

# what it says on the tin
dnf -y install \
  network-manager-applet \
  nm-connection-editor

# appearance stuff
dnf -y install \
  gtk3 \
  gtk4 \
  adwaita-icon-theme \
  adwaita-cursor-theme \
  gsettings-desktop-schemas \
  gnome-themes-extra \
  shared-mime-info \
  hicolor-icon-theme \
  desktop-file-utils \
  dejavu-sans-fonts \
  dejavu-sans-mono-fonts \
  google-noto-sans-vf-fonts \
  google-noto-color-emoji-fonts

# deps for rice
dnf -y install \
  alacritty \
  picom \
  polybar \
  rofi \
  dunst \
  feh \
  sxiv \
  brightnessctl

# picom build deps (if i want to build picom manually)
# . . . good to have these packages to build anyways
 dnf -y install \
    dbus-devel \
    gcc \
    libconfig-devel \
    libev-devel \
    libX11-devel \
    libX11-xcb \
    libxcb-devel \
    libGL-devel \
    libEGL-devel \
    libepoxy-devel \
    meson \
    pcre2-devel \
    pixman-devel \
    uthash-devel \
    xcb-util-image-devel \
    xcb-util-renderutil-devel \
    xorg-x11-proto-devel \
    xcb-util-devel

# nice-to-haves, dunst is supposed to be the notifcation daemon. Using xfce4 for now
dnf -y install \
  fastfetch \
  thunar \
  tumbler \
  xfce4-notifyd

# useful cli utilities i could think of
dnf -y install \
  htop \
  tmux \
  tree \
  jq \
  bc \
  bind-utils \
  tcpdump \
  lsof \
  ethtool \
  mtr \
  pciutils \
  usbutils \
  zip \
  wget2 \
  curl


# pywal16: colors and such
git clone https://github.com/eylles/pywal16 /tmp/pywal16
pip3 install /tmp/pywal16 --break-system-packages --prefix=/usr
rm -rf /tmp/pywal16


# Build deps: i3lock-color
dnf -y install \
  gcc    \
  make    \
  autoconf \
  automake \
  cairo-devel \
  fontconfig \
  libev-devel \
  libjpeg-turbo-devel \
  libXinerama \
  libxkbcommon-devel \
  libxkbcommon-x11-devel \
  libXrandr \
  pam-devel \
  pkgconf \
  xcb-util-image-devel \
  xcb-util-xrm-devel \
  giflib-devel

# betterlockscreen depends on i3lock-color
git clone https://github.com/Raymo111/i3lock-color.git /tmp/i3lock-color
cd /tmp/i3lock-color
git tag -f "git-$(git rev-parse --short HEAD)"
autoreconf -i
./configure --prefix=/usr --sysconfdir=/etc
make all-am
make install-am
cd /
rm -rf /tmp/i3lock-color

# deps: betterlockscreen
dnf -y install ImageMagick xdpyinfo xset

# finally build betterlockscreen and install it
git clone https://github.com/betterlockscreen/betterlockscreen.git /tmp/betterlockscreen
cd /tmp/betterlockscreen
LATEST_TAG=$(git describe --tags "$(git rev-list --tags --max-count=1)")
git checkout "$LATEST_TAG"
install -Dm755 betterlockscreen /usr/bin/betterlockscreen
install -Dm644 system/betterlockscreen@.service /usr/lib/systemd/system/betterlockscreen@.service
cd /
rm -rf /tmp/betterlockscreen

# Build Wall-d: wallpaper manager
git clone https://github.com/ronniedroid/Wall-d.git /tmp/Wall-d
ls -la /tmp/Wall-d/


# services
systemctl enable podman.socket
systemctl enable lightdm
systemctl enable cups.socket
systemctl enable cups.path
systemctl enable cups.service


# aaaand we are done
dnf clean all