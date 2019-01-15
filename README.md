# README

## Terminal

Use colors
- Background color #00434C
- Font : Monospace Regular, 11

## Installation

```bash

cd && git clone git@github.com:adz5a/configs.git dotfiles
cd dotfiles
git submodule init
git submodule update


# Optional: install additional libraries. Some may be needed for some scripts to
# work.
- xmodmap
- xclip: allows clipboard manipulation
- unclutter: makes the pointer disappear
- nvim: use the appimage
- neovim-remote: this is a python3 module, needs python3-pip
- universal-ctags

## Git template

This repo contains (and symlinks to ~) a `git_template` dir. It can be used as
the value for the `--template` argument in `git init` and `git clone`.
