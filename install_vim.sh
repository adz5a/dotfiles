# configure vim installer

# install libraries, the last occurrences are for X11 support for the clipboard
# https://stackoverflow.com/questions/11416069/compile-vim-with-clipboard-and-xterm
install_dep () {
    sudo apt -q install \
        autoconf\
        clang\
        lcov\
        libperl-dev\
        python-dev\
        python3-dev\
        liblua5.2-dev\
        lua5.2\
        ruby-dev\
        tcl-dev\
        cscope\
        libgtk2.0-dev\
        libx11-dev\
        libxtst-dev\
        libxt-dev\
        libsm-dev\
        libxpm-dev
}

# this will run the autoconf tools, you should check for X11 and python support
# after using:
# grep X11 src/auto/conf.h
# grep PYTHON src/auto/conf.h
configure () {
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp \
        --enable-pythoninterp=yes \
        --enable-python3interp=yes \
        --with-python-config-dir=/usr/lib/python2.7/config \
        --with-python3-config-dir=/usr/lib/python3.7/config \
        --enable-perlinterp \
        --enable-luainterp \
        --enable-gui=gtk2 \
        --enable-cscope \
        --with-x
}

# If everything is ok, in the vim repository run `make` and then `make install`
# (necessits sudo if installing globally).
