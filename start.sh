#!/bin/bash
set -e

echo "==> Changing to /workspace"
cd /workspace

# Unzip if not yet extracted
if [ ! -d "InvokeAI-Installer" ]; then
    echo "==> Unzipping installer..."
    unzip InvokeAI-installer-v5.6.0.zip
fi

# Navigate to installer
cd InvokeAI-Installer

# Ensure required packages for venv
echo "==> Installing python3.11-venv"
apt update && apt install -y python3.11-venv

# Run installer non-interactively
echo "==> Running install.sh with --yes"
bash install.sh --yes --root=/root/invokeai --mode=4

# Navigate to final directory
cd /root/invokeai

# Launch WebUI
echo "==> Starting WebUI..."
echo "1" | bash invoke.sh
