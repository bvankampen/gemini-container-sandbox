#!/bin/sh

CONFIG_DIR=$HOME/.config/gemini-sandbox

mkdir -p $CONFIG_DIR/gcloud
mkdir -p $CONFIG_DIR/gemini

podman run --rm -it \
  -e TERM="xterm-256color" \
  -e COLORTERM="truecolor" \
  --env-file .env \
  -v $CONFIG_DIR/gcloud:/root/.config/gcloud:z \
  -v $CONFIG_DIR/gemini:/root/.gemini:z \
  --mount type=bind,src="$PWD",dst=/workspace,relabel=private \
  gemini-sandbox
