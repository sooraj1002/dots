#!/usr/bin/env bash
# Deletes Spotify's local-files.bnk, but never while Spotify is running.
set -euo pipefail

users_dir="$HOME/.var/app/com.spotify.Client/config/spotify/Users"

# pgrep exits 1 only when nothing matched. Any other failure also skips the delete.
status=0
pgrep -x spotify >/dev/null || status=$?
if ((status != 1)); then
    echo "Spotify may be running (pgrep exit $status), leaving local-files.bnk alone"
    exit 0
fi

shopt -s nullglob
for file in "$users_dir"/*/local-files.bnk; do
    if [[ -f $file && ! -L $file ]]; then
        rm -f -- "$file"
        echo "Deleted $file"
    fi
done
