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
