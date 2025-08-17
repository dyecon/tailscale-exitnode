# Tailscale-exitnode

The provided `setup.sh` installs Tailscale and configures it as exit node.
Tested on Ubuntu 24.04, but should work on other Debian-based systems.

---

## Instructions
1. Run the following command in your terminal:
    ```
    curl -o setup.sh https://raw.githubusercontent.com/dyecon/tailscale-exitnode/refs/heads/main/setup.sh
    chmod +x setup.sh
    ./setup.sh
    ```
2. Go to your Tailscale admin page, find the settings for your server, and enable `Use as exit node`.