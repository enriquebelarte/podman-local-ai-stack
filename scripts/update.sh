#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "Pulling latest images..."

podman pull docker.io/ollama/ollama:latest
podman pull ghcr.io/open-webui/open-webui:main

echo "Restarting services..."

systemctl --user restart ollama.service
systemctl --user restart open-webui.service

echo "Done."
