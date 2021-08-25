#!/bin/sh

LOGIN=""
PASSWD=""
VERSION=`curl -s "https://api.github.com/repos/wube/factorio-data/tags" | jq -r '.[0].name'`
ARCHIVE="factorio_alpha_x64_${version}.tar.xz"


CSRF=`curl -s -c ~/cookie.txt https://www.factorio.com/login | grep csrf_token | awk -F'"' '{print $8}'`
curl -v -c ~/cookie.txt -b ~/cookie.txt  -H "X-CSRF-Token: ${CSRF}"  -X POST -F "csrf_token=${CSRF}" -F "username_or_email=${LOGIN}" -F "password=${PASSWD}" https://www.factorio.com/login
curl -c ~/cookie.txt https://www.factorio.com/get-download/${version}/alpha/linux64 > ${ARCHIVE}

