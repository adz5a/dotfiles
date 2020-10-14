SESSION=dotfiles

rg:
	brew install ripgrep

submodule:
	git submodule update --init

install-ctags-lib:
	apt install lcov binutils-mingw-w64-i686 gcc-mingw-w64-i686 libjansson-dev libyaml-dev - libseccomp-dev

xmodmap:
	cat default.xmodmap | xmodmap -

# vim install
ftplugin-symlink:
	ln -s $(iPWD)/ftplugin $(HOME)/.vim/ftplugin

deps-edn-symlink:
	ln -s $(iPWD)/deps.edn $(HOME)/.clojure/deps.edn

after-symlink:
	ln -s $(PWD)/after $(HOME)/.vim/after
	ln -s $(PWD)/after $(HOME)/.config/nvim/after

vim-symlink: after-symlink ftplugin-symlink

diff-so-fancy:
	git clone --depth 1 https://github.com/so-fancy/diff-so-fancy.git src/diff-so-fancy
	chmod +x src/diff-so-fancy/diff-so-fancy
	ln -s $(PWD)/src/diff-so-fancy/diff-so-fancy $(HOME)/bin/diff-so-fancy

ctags:
	brew install ctags

symlink-ctags:
	ln -s $(PWD)/ctags $(HOME)/.ctags.d
