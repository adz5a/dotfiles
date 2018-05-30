#!/bin/sh
export HISTTIMEFORMAT="%d/%m/%y %T "
# Read a .md file and output in terminal
# needs pandoc & lynx globally available
md () {
    pandoc $1 | lynx -stdin
}

# tmux new session
tns () {
    SESSION=$1
    WINDOW=$2

    if [ -z $SESSION ]
    then
        echo 'please specify a session name as first argument'
        exit 1
    fi

    if [ -z $WINDOW ]
    then
        WINDOW='main'
    fi

    tmux new-session -s $SESSION -n $WINDOW
}

tl-v () {
    tmux select-layout even-vertical
}

tl-h () {
    tmux select-layout even-horizontal
}

tsc () {
    $SESSION=$1

    if [ -z $SESSION ]
    then
        echo 'Please specify a session name / id as per the tmux switch-session command'
    fi
    tmux switch-client -t $SESSION
}
