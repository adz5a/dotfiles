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

```

Add the following in your `.bashrc`.

```bash

# in interactive mode load custom settings
[[ $- = *i* ]] && source ~/dotfiles/liquidprompt/liquidprompt
[[ $- = *i* ]] && source ~/dotfiles/.bashrc
[[ $- = *i* ]] && source ~/dotfiles/.bash_aliases

```


## Remove caps lock and remap to escape

```bash
xmodmap -e "clear Lock" -e "keycode 66 = Escape Escape Escape"
```

## Ctags

You need to have `exuberant-ctags` (or any alternatives that proves the `ctags`
command).

## Git template

This repo contains (and symlinks to ~) a `git_template` dir. It can be used as
the value for the `--template` argument in `git init` and `git clone`.
