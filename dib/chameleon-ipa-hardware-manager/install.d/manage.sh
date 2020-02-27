#!/bin/bash
set -eu
set -o pipefail

# This needs to match something...
VIRTUALENV=/opt/ironic-python-agent
HWM_REPO=https://github.com/ChameleonCloud/chameleon-ipa-hardware-manager
HWM_REF=master

source "$VIRTUALENV/bin/activate"

case "$1" in
  install)
    pip install "git+$HWM_REPO@$HWM_REF#egg=chameleon_hardware_manager"
    ;;
  uninstall)
    pip uninstall chameleon_hardware_manager
    ;;
  *)
    echo "Invalid operation '$1'"
    exit 1
    ;;
esac
