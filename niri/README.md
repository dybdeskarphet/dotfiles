# Niri Companion

## Key Points

* **Don’t edit `config.kdl` (or your default Niri config specifed with `--config`) directly.**
  It’s treated as an IPC target (see `ipcext`), not a permanent config file.
* **Your actual configuration lives in separate files** that you reference inside `settings.toml`.
* **The final `config.kdl` is generated automatically** at the location you specify.

## Define Your Config Sources

Inside `settings.toml`, list the paths to your config fragments under `[genconfig]`:

```toml
[genconfig]
sources = [
  "$XDG_CONFIG_HOME/niri/src/internal.kdl",
  "$XDG_CONFIG_HOME/niri/src/autostart.kdl",
  "$XDG_CONFIG_HOME/niri/src/monitors.kdl",
  "$XDG_CONFIG_HOME/niri/src/input.kdl",
  "$XDG_CONFIG_HOME/niri/src/keybindings.kdl",
  "$XDG_CONFIG_HOME/niri/src/visual.kdl",
  "$XDG_CONFIG_HOME/niri/src/rules.kdl"
]
```

Each `.kdl` file is dedicated to a specific area (autostart, keybindings, rules, etc.), making it easy to manage.

## Set the Output Path

Tell Niri Companion where to write the generated config by adding this to `settings.toml`:

```toml
[general]
output_path = "~/.config/niri/config.kdl"
```

This is the file Niri will actually use at runtime.
