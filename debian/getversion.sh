#!/bin/sh

if [ -z $FORCE_FACTORIO_VERSION ]; then
    curl -s "https://api.github.com/repos/wube/factorio-data/tags" | jq -r '.[0].name'
else
    echo $FORCE_FACTORIO_VERSION
fi
