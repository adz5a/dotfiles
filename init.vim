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
let $LANG=""
let $LC_CTYPE="UTF-8"

" Highlights the cursor in red when in term mode (white when insert-term mode)
highlight TermCursorNC guibg=red guifg=withe ctermbg=1 ctermfg=15


packadd minpac
call minpac#init()
call minpac#add("k-takata/minpac")
call minpac#add("tpope/vim-fugitive")
call minpac#add("tpope/vim-sensible")
call minpac#add("tpope/vim-dadbod")
call minpac#add("tpope/vim-vinegar")
call minpac#add("tpope/vim-fireplace")
call minpac#add("tpope/vim-surround")
call minpac#add("bhurlow/vim-parinfer")
call minpac#add("ludovicchabant/vim-gutentags")
call minpac#add("mhinz/vim-signify")
call minpac#add("kristijanhusak/vim-hybrid-material")
call minpac#add("tpope/vim-commentary")
call minpac#add("matze/vim-move")
call minpac#add("mxw/vim-jsx")
