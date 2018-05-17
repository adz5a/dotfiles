SESSION=dotfiles

all:
	git submodule update --init

# need to manually add the bashrc in this
# repo to the user's bashrc
install:
	./install.sh install

uninstall:
	./install.sh uninstall

upgrade:
	./install.sh upgrade

workspace:
	tmux new-session -s $(SESSION) -n main
