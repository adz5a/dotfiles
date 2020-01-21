" NEOVIM config file
" Reuses the vimrc
set nocompatible
syntax on
filetype plugin indent on

source ~/dotfiles/_vimrc

" Mappings for neovim

" Use <Esc> to leave terminal mode
tnoremap <Esc> <C-\><C-n>
" Use "verbatim" mode to send the Esc sequence in terminal mode
tnoremap <C-v><Esc> <Esc>

let $VISUAL="nvr -cc split --remote-wait"

" Highlights the cursor in red when in term mode (white when insert-term mode)
highlight TermCursorNC guibg=red guifg=withe ctermbg=1 ctermfg=15
