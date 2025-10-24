#!/usr/bin/env bash
set -euo pipefail

# Generates a polyglot file using beheader.js
OUTPUT="cat.png"
IMAGE="test.jpg"
VIDEO="cat.mp4"
ZIP="hello.zip"
BEHEADER_JS="beheader.js"

if ! command -v bun >/dev/null 2>&1; then
  echo "Error: bun is not installed or not in PATH." >&2
  exit 1
fi

if [[ ! -f "$BEHEADER_JS" ]]; then
  echo "Error: $BEHEADER_JS not found in the current directory." >&2
  exit 1
fi

if [[ ! -f "$IMAGE" ]]; then
  echo "Error: image '$IMAGE' not found." >&2
  exit 1
fi

if [[ ! -f "$VIDEO" ]]; then
  echo "Error: video/audio '$VIDEO' not found." >&2
  exit 1
fi

if [[ ! -f "$ZIP" ]]; then
  echo "Error: zip '$ZIP' not found." >&2
  exit 1
fi

bun run "$BEHEADER_JS" "$OUTPUT" "$IMAGE" "$VIDEO" -z "$ZIP"