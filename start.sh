#!/bin/bash
set -e

echo "==> Changing to /workspace"
cd /workspace

# Unzip if needed
if [ ! -d "InvokeAI-Installer" ]; then
    echo "==> Unzipping installer..."
    unzip InvokeAI-installer-v5.6.0.zip
fi

# Go to installer directory
echo "==> Navigating to InvokeAI-Installer"
cd InvokeAI-Installer

# Run install.sh with automated inputs
echo "==> Running install.sh with inputs"
(
  echo ""    # 1: default install location
  echo "y"   # 2: confirm
  echo "4"   # 3: manual install
) | bash install.sh

# Go to the installed InvokeAI folder
echo "==> Navigating to /root/invokeai"
cd /root/invokeai

# Launch InvokeAI Web UI (option 3)
echo "==> Launching InvokeAI WebUI..."
echo "1" | bash invoke.sh
