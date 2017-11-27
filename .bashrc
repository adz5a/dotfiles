export HISTTIMEFORMAT="%d/%m/%y %T "

# Read a .md file and output in terminal
# needs pandoc & lynx globally available
read-markdown () {
    pandoc $1 | lynx -stdin
}
