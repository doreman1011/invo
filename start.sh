#!/bin/bash
set -e

echo "==> Changing to /workspace"
cd /workspace

# Unzip if not yet extracted
if [ ! -d "InvokeAI-Installer" ]; then
    echo "==> Unzipping installer..."
    unzip InvokeAI-installer-v5.6.0.zip
fi

# Navigate to installer directory
cd InvokeAI-Installer

# Ensure venv support
echo "==> Installing python3.11-venv"
apt update && apt install -y python3.11-venv

# Set default install location and auto-confirm input using yes
echo "==> Running installer (non-interactive)"
yes "" | bash install.sh --yes --root=/root/invokeai

# Go to installed location
cd /root/invokeai

# Start InvokeAI Web UI in headless mode (skip menu)
echo "3" | bash invoke.sh
