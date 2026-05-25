#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

ENV_FILE="${1:-$ROOT_DIR/.env}"

if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
fi

MODELS="${OLLAMA_MODELS:-qwen2.5:1.5b}"

for model in $MODELS; do
  echo "Pulling $model ..."
  podman exec -it ollama ollama pull "$model"
done
