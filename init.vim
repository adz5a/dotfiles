" NEOVIM config file
" Reuses the vimrc
set nocompatible
syntax on
filetype plugin indent on

set runtimepath^=~/.vim
let &packpath=&runtimepath
source ~/_vimrc

" Mappings for neovim

" Use <Esc> to leave terminal mode
tnoremap <Esc> <C-\><C-n>
" Use "verbatim" mode to send the Esc sequence in terminal mode
tnoremap <C-v><Esc> <Esc>

let $VISUAL="nvr -cc split --remote-wait"
