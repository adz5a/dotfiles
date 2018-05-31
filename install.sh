set -eu

# Script to help installing this repo to create a new workstation easely. This
# script must be called with an argument: install|uninstall.

dotfiles='.gitconfig git_template .tmux.conf .ctags _vimrc'
startup_files='.bashrc .profile'

install () {

    if [ -d $HOME/bin ]; then
        ln -s $PWD/diff-so-fancy/diff-so-fancy $HOME/bin/diff-so-fancy;
    else
        echo "No local bin present"
        exit 1
    fi

    # for each of those dotfiles, create a symlink into the user's ~
    for f in $dotfiles
    do
        ln -s $PWD/$f $HOME/$f
    done

    # install vim runtime files and plugins.
    # plugins are managed from this repo
    mkdir -p $HOME/.vim/autoload
    ln -s $PWD/bundle $HOME/.vim/bundle
    ln -s $PWD/ftplugin $HOME/.vim/ftplugin
    ln -s $PWD/vim-pathogen/autoload/pathogen.vim $HOME/.vim/autoload/pathogen.vim 


    # for each of those dotfiles, append its content into the user's
    # correspondig file. A control sequence could be used to enable easy removal
    for f in $startup_files
    do
        echo '### custom ###' >> $HOME/$f
        echo "CONFIG_HOME=$PWD" >> $HOME/$f
        echo "source $PWD/$f" >> $HOME/$f
        echo '###' >> $HOME/$f
    done

}

uninstall () {

    if [ -d $HOME/bin/diff-so-fancy ]; then
        rm -f $HOME/bin/diff-so-fancy
    fi

    # for each of those dotfiles remove file in the ~ folder.
    # TODO: add a test to ensure you are not deleting something else
    for f in $dotfiles
    do
        rm $HOME/$f
    done

}

# will remove dotfiles found in the ~ and replace them with the current version
# in the repository.
upgrade () {

    for f in $dotfiles
    do
        # if file exists, remove it
        if [ -e $HOME/$f ]; then
            rm $HOME/$f
        fi
        ln -s $PWD/$f $HOME/$f
    done

}

case $1 in
    install)
        install
        ;;
    uninstall)
        uninstall
        ;;

    upgrade)
        upgrade
        ;;
    * )
        echo "Commmand: install uninstall upgrade"
        exit 1
        ;;
esac

exit 0
