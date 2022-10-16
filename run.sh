#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

TARGET="$(bashio::config 'target')"

echo "Starting Python script"

python3 -m http.server 8000