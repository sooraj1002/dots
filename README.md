To start the ssh agent w the system

```bash
mkdir -p ~/.config/systemd/user
ln -s ~/dots/systemd\ services/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
```

Reload the system daemon

```bash
systemctl --user daemon-reload
```

Enable and start the service

```bash
systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent.service
```

# Install cuda

```bash
wget https://developer.download.nvidia.com/compute/cuda/12.6.2/local_installers/cuda_12.6.2_560.35.03_linux.run
```

```bash
umask 022
sudo sh cuda_12.6.2_560.35.03_linux.run
```

# Delete Spotify's local-files.bnk

Runs at login and each time Spotify is opened from the app launcher. Skips the delete if Spotify is already running.

```bash
ln -s ~/dots/systemd\ services/spotify-clean-local-files.service ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable spotify-clean-local-files.service

mkdir -p ~/.local/share/applications
ln -s ~/dots/spotify/com.spotify.Client.desktop ~/.local/share/applications/
kbuildsycoca6
```

Check the logs

```bash
journalctl --user -u spotify-clean-local-files.service
```
