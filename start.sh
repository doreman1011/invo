#!/bin/bash
set -e

cd /workspace/InvokeAI-installer

# Automate install.sh with echo pipe
(
  echo ""    # for default path
  echo "y"   # confirm path
  echo "4"   # Choose option 4 (manual model download)
) | bash install.sh

# Move into install directory
cd /root/invokeai

# Auto-confirm model selection
echo "1" | bash invoke.sh
