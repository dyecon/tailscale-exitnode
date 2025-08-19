#!/bin/bash
# Update the system, install Tailscale, and configure as exit node
# Designed for Ubuntu 24.04, but should work on other Debian-based systems

# Run the 3 lines below to run:
# curl -o setup.sh https://raw.githubusercontent.com/dyecon/tailscale-exitnode/refs/heads/main/setup.sh
# chmod +x setup.sh
# ./setup.sh


set -e  # Exit immediately if a command fails

# Prompt for Tailscale auth key
read -rp "Enter your Tailscale auth key: " TS_AUTH_KEY

# Prompt for Node Name 
read -rp "Enter node name (leave blank to use deault): " NODE_NAME

if [ -z "$TS_AUTH_KEY" ]; then
    echo "[!] No auth key provided. Exiting."
    exit 1
fi

echo "[*] Checking if curl is installed..."
if ! command -v curl >/dev/null 2>&1; then
    echo "[*] curl not found, installing..."
    sudo apt update
    sudo apt install -y curl
else
    echo "[*] curl is already installed."
fi

echo "[*] Updating package lists..."
sudo apt update

echo "[*] Upgrading installed packages..."
sudo apt upgrade -y

echo "[*] Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "[*] Enabling IP forwarding..."
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf

echo "[*] Bringing up Tailscale with provided auth key..."
sudo tailscale up --auth-key=$TS_AUTH_KEY --advertise-exit-node

if [ -z "$NODE_NAME" ]; then
    echo "Using default node name since none was specified..."
else
    echo "Setting node name to $NODE_NAME..."
    sudo tailscale set --hostname=$NODE_NAME
fi

echo "[✓] Setup complete! This node should now be available as an exit node."