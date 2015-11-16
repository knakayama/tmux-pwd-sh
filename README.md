pwd.sh-quick
============

Quickly search password with [pwd.sh](https://github.com/drduh/pwd.sh) in tmux session

## Requirements

1. [tmux](https://github.com/tmux/tmux)
2. [tpm](https://github.com/tmux-plugins/tpm)

## Install

Add the following lines to your `~/.tmux.conf`

```bash
set-option -g @plugin knakayama/tmux-pwd-sh
```

then, press `Prefix + I` in tmux session.

## Usage

Default key binding is `Prefix + P`. If you change this key binding, set the following line to your `~/.tmux.conf`.

```bash
set-option -g @pwd-sh-key 'x' # or your favorite key binding
```

## License

MIT

## Author

[knakayama](https://github.com/knakayama)
