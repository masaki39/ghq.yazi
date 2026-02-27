# ghq.yazi

A [Yazi](https://github.com/sxyazi/yazi) plugin to navigate to [ghq](https://github.com/x-motemen/ghq)-managed repositories using [fzf](https://github.com/junegunn/fzf).

## Requirements

- [ghq](https://github.com/x-motemen/ghq)
- [fzf](https://github.com/junegunn/fzf)

## Installation

```sh
ya pkg add masaki39/ghq
```

## Update

```sh
ya pkg upgrade masaki39/ghq
```

## Configuration

Add a keybinding in `~/.config/yazi/keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on = ["g", "q"]
run = "plugin ghq"
desc = "Go ghq repo"
```

## License

MIT
