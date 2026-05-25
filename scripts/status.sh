#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== SYSTEMD SERVICES ==="
systemctl --user --no-pager --full status ollama.service open-webui.service

echo ""
echo "=== PODMAN CONTAINERS ==="
podman ps

echo ""
echo "=== OLLAMA MODELS ==="
podman exec ollama ollama list || true
