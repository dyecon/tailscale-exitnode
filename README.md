# Tailscale-exitnode

The provided `setup.sh` installs Tailscale and configures it as an exit node.
Only Ubuntu 24.04 is officially supported, but it should work on other Debian-based systems.

---

## Instructions
1. Create a Tailscale auth key (copy the auth key - you'll be prompted for it in step 4).
1. Download the setup script:
`curl -o setup.sh https://raw.githubusercontent.com/dyecon/tailscale-exitnode/refs/heads/main/setup.sh`
1. Make it executable:
`chmod +x setup.sh`
1. Run the setup script:
`./setup.sh`
1. Go to your Tailscale admin page, find the settings for your server, and enable `Use as exit node`.