#!/bin/bash
set -e

echo "==> Changing to /workspace"
cd /workspace

# Unzip if needed
if [ ! -d "InvokeAI-Installer" ]; then
    echo "==> Unzipping installer..."
    unzip InvokeAI-installer-v5.6.0.zip
fi

# Navigate to installer
echo "==> Navigating to InvokeAI-Installer"
cd InvokeAI-Installer

# Install required venv package for Python 3.11
echo "==> Installing python3.11-venv"
apt update && apt install -y python3.11-venv

# Run the installer with automated inputs
echo "==> Running install.sh"
(
  echo ""    # Choose default path
  echo "y"   # Confirm path
  echo "4"   # Manual install
) | bash install.sh

# Navigate to the invokeai install directory
echo "==> Navigating to /root/invokeai"
cd /root/invokeai

# Start the Web UI (option 3)
echo "==> Launching InvokeAI WebUI..."
echo "1" | bash invoke.sh
