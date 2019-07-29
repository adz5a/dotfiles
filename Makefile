SESSION=dotfiles

submodule:
	git submodule update --init

install-ctags-lib:
	apt install lcov binutils-mingw-w64-i686 gcc-mingw-w64-i686 libjansson-dev libyaml-dev - libseccomp-dev

xmodmap:
	cat default.xmodmap | xmodmap -

# vim install
ftplugin-symlink:
	ln -s $(iPWD)/ftplugin $(HOME)/.vim/ftplugin

after-symlink:
	ln -s $(PWD)/after $(HOME)/.vim/after
	ln -s $(PWD)/after $(HOME)/.config/nvim/after

vim-symlink: after-symlink ftplugin-symlink
