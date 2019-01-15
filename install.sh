set -eu

# Script to help installing this repo to create a new workstation easely. This
# script must be called with an argument: install|uninstall.
# Dotfiles are syymlinked
# Startup files are loaded by appending a `source path/to/custom_file` clause to
# each file
dotfiles='.gitconfig git_template .tmux.conf .ctags _vimrc .xinitrc'
startup_files='.bashrc .profile .bash_aliases'

install () {

    if [ -d $HOME/bin ]; then
        echo "Create symlinks in $HOME/bin"
        ln -s $PWD/diff-so-fancy/diff-so-fancy $HOME/bin/diff-so-fancy;
        ln -s $PWD/prettyping/prettyping $HOME/bin/prettyping;
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
    echo '### custom ###' >> $HOME/$f
    echo "export CONFIG_HOME=$PWD" >> $HOME/$f
    for f in $startup_files
    do
        echo "source $PWD/$f" >> $HOME/$f
    done
    echo '### end custom ###' >> $HOME/$f

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

    # remove script loading in startup files
    for f in $startup_files
    do
        sed '/### custom ###/, /### end custom ###/d' $HOME/$f -i
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
