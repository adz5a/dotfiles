

install:
	if [ -d $(HOME)/bin ]; then \
		ln -s $(PWD)/diff-so-fancy $(HOME)/bin/diff-so-fancy;\
	fi

vim-insall:
	git submodule init && git submodule update && git submodule sync
	cd vim; make install
