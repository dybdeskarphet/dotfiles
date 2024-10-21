# fg.yazi

A Yazi plugin for searching by file content or by filenames using `ripgrep` or
`ripgrep-all` with `fzf` preview

Supported shells: `bash`, `fish`, `nushell`, and `zsh`

## Dependencies

- [fzf](https://junegunn.github.io/fzf/)
- [ripgrep](https://github.com/BurntSushi/ripgrep) and/or [ripgrep-all](https://github.com/phiresky/ripgrep-all)
- [bat](https://github.com/sharkdp/bat)

## Install

```bash
# Add the plugin
ya pack -a lpnh/fg

# Install the plugin
ya pack -i

# Upgrade the plugin
ya pack -u
```

## Usage

The following snippets should be included on your `~/.config/yazi/keymap.toml`
file. Make sure the keys are not used elsewhere.

### Search by content using ripgrep

This option uses `ripgrep` to output all the lines of all files, and then uses
`fzf` to fuzzy matching.

```toml
[[manager.prepend_keymap]]
on   = [ "f","g" ]
run  = "plugin fg"
desc = "find file by content (fuzzy match)"
```

The following option passes the input to `ripgrep` for a match search, reusing
the `rg` search each time the input is changed. This is useful for searching in
large folders due to increased speed, but it does not support fuzzy matching.

```toml
[[manager.prepend_keymap]]
on   = [ "f","G" ]
run  = "plugin fg --args='rg'"
desc = "find file by content (ripgrep match)"
```

### Search by content using ripgrep-all

This option uses `ripgrep-all` to output all the lines of all files, and then
uses `fzf` to fuzzy matching.

```toml
[[manager.prepend_keymap]]
on   = [ "f","a" ]
run  = "plugin fg --args='rga'"
desc = "find file by content (ripgrep-all)"
```

### Search by filename with fzf

```toml
[[manager.prepend_keymap]]
on   = [ "f","f" ]
run  = "plugin fg --args='fzf'"
desc = "find file by filename"
```

## Tips

You can customize the default colors by using the `fzf` environment variable,
`FZF_DEFAULT_OPTS`. For an example, check out the [Catppuccin's
repo](https://github.com/catppuccin/fzf?tab=readme-ov-file#usage).

## About

This is a fork of DreamMaoMao's `fg.yazi` plugin, you can find it at
<https://gitee.com/DreamMaoMao/fg.yazi>
