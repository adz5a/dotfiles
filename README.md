# README

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
