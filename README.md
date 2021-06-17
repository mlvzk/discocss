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

## Transparency

If you want your window to be transparent, you have to change the `--background-` css variables to have an alpha value. You can add alpha to a hex color by appending 2 extra hex digits to it. Example from my theme (44 is the hex alpha value):

```css
.theme-light {
  --background-primary: #f3f4f644;
  --background-primary-alt: #eeeff244;
  --background-secondary: #e5e7eb44;
  --background-secondary-alt: #d1d5db44;
  --background-tertiary: #dfe2e744;
}
```

## Persistence

If after an update your theme doesn't work anymore, close and run `discocss` again. Discord might be running in the background without you knowing, so if it still doesn't work, use `pkill`.
