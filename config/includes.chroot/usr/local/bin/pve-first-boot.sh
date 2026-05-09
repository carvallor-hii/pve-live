#!/bin/bash
set -e

# Get identity — prefer iDRAC service tag, fall back to DHCP hostname
SERVICE_TAG=$(dmidecode -s system-serial-number 2>/dev/null | tr -d '[:space:]')

if [[ -n "$SERVICE_TAG" && "$SERVICE_TAG" != "Not Specified" ]]; then
    HOSTNAME="pve-${SERVICE_TAG,,}"  # lowercase, e.g. pve-abc1234
else
    HOSTNAME=$(hostname)             # fallback to DHCP-assigned
fi

hostnamectl set-hostname "$HOSTNAME"

#########################
# Re-enable after testing
#########################

# Regenerate unique SSH host keys
# rm -f /etc/ssh/ssh_host_*
# dpkg-reconfigure openssh-server

# Generate unique PVE certificates
# pvecert generate --force

# Join PDM
# pvesh create /nodes/${HOSTNAME}/config ...

touch /etc/pve-node-initialized