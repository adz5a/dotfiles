# README

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
