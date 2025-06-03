#!/bin/bash
set -e

cd /workspace

# Unzip the installer (if not already unzipped)
if [ ! -d "InvokeAI-installer" ]; then
    unzip InvokeAI-installer-v5.6.0.zip
fi

# Automatically find the extracted folder
INSTALLER_DIR=$(find . -maxdepth 1 -type d -name "InvokeAI-installer*" | head -n 1)

if [ -z "$INSTALLER_DIR" ]; then
    echo "Error: Could not find the InvokeAI installer folder."
    exit 1
fi

cd "$INSTALLER_DIR"

# Run install.sh with simulated inputs
(
  echo ""    # default install location
  echo "y"   # confirm
  echo "4"   # manual install
) | bash install.sh

cd /root/invokeai

# Launch Web UI mode
echo "1" | bash invoke.sh
