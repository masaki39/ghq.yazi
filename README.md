# ghq.yazi

A [Yazi](https://github.com/sxyazi/yazi) plugin to navigate to [ghq](https://github.com/x-motemen/ghq)-managed repositories using [fzf](https://github.com/junegunn/fzf).

## Requirements

- [ghq](https://github.com/x-motemen/ghq)
- [fzf](https://github.com/junegunn/fzf)

## Installation

```sh
ya pkg add masaki39/ghq.yazi
```

## Update

```sh
ya pkg upgrade masaki39/ghq.yazi
```

## Configuration

Add a keybinding in `~/.config/yazi/keymap.toml`:

```toml
[[manager.prepend_keymap]]
on = ["g", "q"]
run = "plugin ghq"
desc = "Navigate to ghq repository"
```

## License

MIT
