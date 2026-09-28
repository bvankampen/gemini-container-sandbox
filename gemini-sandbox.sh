#!/bin/sh

CONFIG_DIR=$HOME/.config/gemini-sandbox

mkdir -p $CONFIG_DIR/gcloud
mkdir -p $CONFIG_DIR/gemini

if [ -n "$1" ]; then
  WORKSPACE="$1"
  mkdir -p "$WORKSPACE"
  WORKSPACE="$(cd "$WORKSPACE" 2>/dev/null && pwd || echo "$WORKSPACE")"
else
  WORKSPACE=$PWD
fi

podman run --rm -it \
  -e TERM="${TERM:-xterm-256color}" \
  -e COLORTERM="${COLORTERM:-truecolor}" \
  --env-file $CONFIG_DIR/.env \
  -v $CONFIG_DIR/gcloud:/root/.config/gcloud:z \
  -v $CONFIG_DIR/gemini:/root/.gemini:z \
  --mount type=bind,src="$WORKSPACE",dst=/workspace,relabel=private \
  gemini-sandbox /usr/local/bin/gemini
