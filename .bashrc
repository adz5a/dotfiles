#!/bin/sh
#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

source $HOME/dotfiles/.bash_aliases

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

# Config.
PathColor=$Yellow
InGitPathColor=$BYellow

#### CUSTOM FUNCTION DEFINITION
###############################

# source "$CONFIG_HOME/liquidprompt/liquidprompt"


# Read a .md file and output in terminal
# needs pandoc & lynx globally available
md () {
    pandoc $1 | lynx -stdin
}

# TMUX helper functions
tns () {
    SESSION=$1
    WINDOW=$2

    if [ -z $SESSION ]
    then
        SESSION='workspace'
    fi

    if [ -z $WINDOW ]
    then
        WINDOW='main'
    fi

    tmux new-session -s $SESSION -n $WINDOW
}

tsc () {
    SESSION=$1

    if [ -z $SESSION ]
    then
        echo 'Please specify a session name / id as per the tmux switch-session command'
    fi
    tmux switch-client -t $SESSION
}

tsw () {
  WINDOW=$1
  tmux select-window -t $WINDOW
}

tkw () {
  WINDOW=$1
  if [ -z $SESSION ]
  then
    tmux kill-window
  fi
  tmux kill-window -t $WINDOW
}

tnw () {
  tmux new-window -n $1
}

layout () {
    # Choose a layout between us or uk.
    # A keyboard layout is defined by mappings which can be modified by the
    # current locale.
    # The layouts were exported using xmodmap -pke
    case $1 in
        us)
            LAYOUT="$CONFIG_HOME/desktop_us_layout.xmodmap"
            ;;
        uk)
            LAYOUT="$CONFIG_HOME/desktop_uk_layout.xmodmap"
            ;;
        * )
            echo "Commmand: layout [us|uk]"
            exit 1
            ;;
    esac
    xmodmap $LAYOUT
}

# PS1
export PS1="$BWhite\$\e[m$BYellow\$(parse_git_branch)\e[m "

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

L () {

    tree -I '__pycache__' -I 'node_modules' $* | less

}

disk_space () {

    du -lchs ./*

}

ed () {
    if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
      [[ -n "$*" ]] && nvr $* || nvr $(fzf)
    else
      [[ -n "$*" ]] && nvim $* || nvim $(fzf)
    fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /Users/antoinezimmermann/projects/alacritty/extra/completions/alacritty.bash

export FZF_DEFAULT_COMMAND="fd --type f"

export BASH_SILENCE_DEPRECATION_WARNING=1
