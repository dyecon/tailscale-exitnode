# Tailscale-exitnode

The provided `setup.sh` installs Tailscale and configures it as exit node.
Tested on Ubuntu 24.04, but should work on other Debian-based systems.

---

## Instructions
1. Create a Tailscale auth key (copy the auth key - you'll need it later).
1. Download the setup script:
`curl -o setup.sh https://raw.githubusercontent.com/dyecon/tailscale-exitnode/refs/heads/main/setup.sh`
1. Allow executing the file:
`chmod +x setup.sh`
1. Run the setup script:
`./setup.sh`
1. Go to your Tailscale admin page, find the settings for your server, and enable `Use as exit node`.