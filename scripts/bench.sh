#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

MODEL="${1:-qwen2.5:1.5b}"

RESULT=$(curl -s http://localhost:11434/api/generate \
  -d "{
    \"model\":\"$MODEL\",
    \"prompt\":\"Explain containers briefly\",
    \"stream\":false
  }")

TOKENS=$(echo "$RESULT" | jq '.eval_count')
DURATION=$(echo "$RESULT" | jq '.eval_duration')

TPS=$(awk "BEGIN {print $TOKENS / ($DURATION / 1000000000)}")

echo "Model: $MODEL"
echo "Tokens: $TOKENS"
echo "Tokens/sec: $TPS"
