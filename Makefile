SESSION=dotfiles

all:
	git submodule update

# need to manually add the bashrc in this
# repo to the user's bashrc
install:
	if [ -d $(HOME)/bin ]; then \
		ln -s $(PWD)/diff-so-fancy/diff-so-fancy $(HOME)/bin/diff-so-fancy;\
	else \
		echo "No local bin present"\
		exit 1 \
	fi

workspace:
	tmux new-session -s $(SESSION) -n main
