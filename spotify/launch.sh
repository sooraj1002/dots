#!/usr/bin/env bash
# Cleans up local-files.bnk, then opens Spotify. Spotify still opens if the cleanup fails.
timeout 5 systemctl --user start spotify-clean-local-files.service

exec flatpak run --branch=stable --arch=x86_64 --command=spotify --file-forwarding com.spotify.Client @@u "$@" @@
