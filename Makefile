SESSION=dotfiles

all:
	git submodule update

# need to manually add the bashrc in this
# repo to the user's bashrc
install:
	./install.sh

uninstall:
	./uninstall.sh

workspace:
	tmux new-session -s $(SESSION) -n main
