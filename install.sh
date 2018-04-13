if [ -d $HOME/bin ]; then 
    ln -s $PWD/diff-so-fancy/diff-so-fancy $HOME/bin/diff-so-fancy;
else 
    echo "No local bin present"
    exit 1
fi
