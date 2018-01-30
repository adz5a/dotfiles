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

For system wide git config installation

```bash

sudo ln -s ~/dotfiles/.gitconfig /etc/.gitconfig

```

Git global ignore

```bash

git config --global core.excludefile path/to/global_gitignore

```

## Remove caps lock

```bash
xmodmap -e "keycode 66 = Shift_L NoSymbol Shift_L" 
```
