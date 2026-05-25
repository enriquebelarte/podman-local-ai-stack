#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

mkdir -p ~/.config/containers/systemd
mkdir -p ~/containers/ollama
mkdir -p ~/containers/open-webui

cp "$ROOT_DIR/quadlets/"*.container ~/.config/containers/systemd/

systemctl --user daemon-reload

systemctl --user enable --now ollama.service
systemctl --user enable --now open-webui.service
