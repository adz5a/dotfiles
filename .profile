# deactivate Caps lock on ubuntu
xmodmap -e "clear Lock" -e "keycode 66 = Escape Escape Escape"
# swap the number with the symbols on the top row, does not affect
# F-X keys
xmodmap -e "keycode  10 = exclam 1 1 exclam"
xmodmap -e "keycode  11 = quotedbl 2 2 at"
xmodmap -e "keycode  12 = sterling 3 3 numbersign"
xmodmap -e "keycode  13 = dollar 4 4 dollar"
xmodmap -e "keycode  14 = percent 5 5 percent"
xmodmap -e "keycode  15 = asciicircum 6 6 asciicircum dead_circumflex dead_circumflex dead_circumflex"
xmodmap -e "keycode  16 = ampersand 7 7 ampersand"
xmodmap -e "keycode  17 = asterisk 8 8 asterisk"
xmodmap -e "keycode  18 = parenleft 9 9 parenleft dead_grave NoSymbol dead_grave"
xmodmap -e "keycode  19 = parenright 0 0 parenright"

export PATH="$PATH:$HOME/bin:/$HOME/.yarn/bin"
