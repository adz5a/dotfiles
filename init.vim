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
let $GIT_EDITOR="nvr -cc split --remote-wait"
"d Highlights the cursor in red when in term mode (white when insert-term mode)
highlight TermCursorNC guibg=red guifg=withe ctermbg=1 ctermfg=15
highlight! LineNr term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight! Statusline ctermfg=red ctermbg=12 guifg=#ffff00 guibg=#0000ff

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
" call minpac#add("adz5a/vim-hybrid-material")
call minpac#add("tpope/vim-commentary")
" call minpac#add("matze/vim-move")
call minpac#add("mxw/vim-jsx")
call minpac#add("junegunn/fzf.vim")
call minpac#add("Olical/aniseed", {"rev": "v3.3.0"})
call minpac#add("bakpakin/fennel.vim")

fun! OnStartVim()
  if argc () == 0
    terminal
  endif
endfun

augroup myvimrc
    autocmd VimEnter * call OnStartVim()
augroup END
