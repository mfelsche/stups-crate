#!/bin/bash
REV=$(git rev-parse HEAD) || exit 1
URL=$(git config --get remote.origin.url) || exit 1
STATUS=$(git status --porcelain) || exit 1
if [ -n "$STATUS" ]; then
    REV="$REV (locally modified)"
fi
# finally write hand-crafted JSON to scm-source.json
echo '{"url": "git:'$URL'", "revision": "'$REV'", "author": "'$USER'", "status": "'$STATUS'"}' > scm-source.json
