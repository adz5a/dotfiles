SESSION=dotfiles


install:
	if [ -d $(HOME)/bin ]; then \
		ln -s $(PWD)/diff-so-fancy $(HOME)/bin/diff-so-fancy;\
	fi

vim-install:
	git submodule init && git submodule update && git submodule sync
	cd vim; make install

workspace:
	tmux new-session -s $(SESSION) -n main
