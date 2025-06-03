#!/bin/bash
set -e

cd /workspace/InvokeAI-installer-v5.6.0

# Automate installer
(
  echo ""    # default location
  echo "y"   # confirm
  echo "4"   # manual download mode
) | bash install.sh

cd /root/invokeai

# Start InvokeAI in Web UI mode
echo "1" | bash invoke.sh
