#!/bin/sh

if [ -z $FORCE_FACTORIO_VERSION ]; then
    VERSION=`curl -s "https://api.github.com/repos/wube/factorio-data/tags" | jq -r '.[0].name'`
    dch -v $VERSION "Current version $VERSION"
else
    VERSION=$FORCE_FACTORIO_VERSION
    dch -b -v $VERSION "Forced version $VERSION"
fi
git commit debian/changelog -m "set version to $VERSION"
