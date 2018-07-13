# Spell checking

You can enable spell checking in vim using two commands:

## Commands
```vimL
:set spellang=*value* " fr eng etc..
:set spell " to disable :set nospell
```

The first time it is used vim may prompt you to ask you several questions, you
at least need to download the language file if you do not have it bundled with
your vim installation. 

## Mappings
Once in spell checking mode (`&spell = 1`) you can use several mappings to
navigate misspelled words.

`]s` and `[s` to go to next (respectively previous) misspelled word.

`{count}z=` When the cursor is positioned on a misspelled word, shows a list of
proposition. If `count` is used then it will not display the list but will
replace with the selected word using the `count` value.
