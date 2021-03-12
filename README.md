# DiscoCSS

A tiny Discord css-injector.

# Installation

```sh
git clone https://github.com/mlvzk/discocss
cp discocss/discocss /usr/bin # or any other directory in your $PATH
```

If you use Arch Linux, there's an unofficial AUR package available: [discocss-git](https://aur.archlinux.org/packages/discocss-git/)

# Usage

Put your css in `~/.config/discocss/custom.css`

Run `discocss`

# Notes

If after an update your theme doesn't work anymore, close and run `discocss` again. Discord might be running in the background without you knowing, so if it still doesn't work, use `pkill`.
