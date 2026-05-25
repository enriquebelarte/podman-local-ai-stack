#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "Stopping services..."

systemctl --user stop ollama.service || true
systemctl --user stop open-webui.service || true

echo "Disabling services..."

systemctl --user disable ollama.service || true
systemctl --user disable open-webui.service || true

echo "Removing Quadlets..."

rm -f ~/.config/containers/systemd/ollama.container
rm -f ~/.config/containers/systemd/open-webui.container

echo "Reloading systemd..."

systemctl --user daemon-reload

echo "Removing containers..."

podman rm -f ollama || true
podman rm -f open-webui || true

echo ""
read -rp "Delete persistent data too? [y/N] " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
  rm -rf ~/containers/ollama
  rm -rf ~/containers/open-webui
  echo "Data deleted."
fi

echo "Uninstall complete."
