# defines aliases and completion
alias ll="ls -lhG"
alias la="ls -lahG"
alias g="git"
alias cl="clear"
alias tl="tmux ls"
alias ta="tmux attach -t"
alias td="tmux detach-client"
alias tk="tmux kill-session"
alias tlv="tmux select-layout main-vertical"
alias tlh="tmux select-layout main-vertical"

complete -W "rename-window next-window source-file new-session new-window rename-session split-window detach-client kill-session select-layout" tmux
