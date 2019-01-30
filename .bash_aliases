# defines aliases and completion
alias g="git"
alias cl="clear"
alias tl="tmux ls"
alias ta="tmux attach -t"
alias td="tmux detach-client"
alias tk="tmux kill-session"
alias tlv="tmux select-layout main-vertical"
alias tlh="tmux select-layout main-vertical"

complete -W "source-file new-session rename-session split-window detach-client kill-session select-layout" tmux
