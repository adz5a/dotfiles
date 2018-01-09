export HISTTIMEFORMAT="%d/%m/%y %T "

# Read a .md file and output in terminal
# needs pandoc & lynx globally available
md () {
    pandoc $1 | lynx -stdin
}
