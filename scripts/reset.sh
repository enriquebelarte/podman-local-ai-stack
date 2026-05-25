#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "WARNING:"
echo "This will delete:"
echo "  - Ollama models"
echo "  - Open WebUI data"
echo ""
read -rp "Continue? [y/N] " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "Aborted."
  exit 0
fi

echo "Stopping services..."

systemctl --user stop ollama.service || true
systemctl --user stop open-webui.service || true

echo "Removing containers..."

podman rm -f ollama || true
podman rm -f open-webui || true

echo "Deleting data..."

rm -rf ~/containers/ollama
rm -rf ~/containers/open-webui

echo "Recreating directories..."

mkdir -p ~/containers/ollama
mkdir -p ~/containers/open-webui

echo "Done."
