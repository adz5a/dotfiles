" NEOVIM config file
" Reuses the vimrc
set nocompatible
syntax on
filetype plugin indent on

source ~/dotfiles/_vimrc
source ~/dotfiles/colors.vim

" Mappings for neovim

" Use <Esc> to leave terminal mode
tnoremap <Esc> <C-\><C-n>
" Use "verbatim" mode to send the Esc sequence in terminal mode
tnoremap <C-v><Esc> <Esc>

let $VISUAL="nvr -cc split --remote-wait"
let $LANG=""
let $LC_CTYPE="UTF-8"
let $GIT_EDITOR="nvr -cc split --remote-wait"

packadd minpac
call minpac#init()
call minpac#add("k-takata/minpac")
call minpac#add("tpope/vim-fugitive")
call minpac#add("tpope/vim-sensible")
call minpac#add("tpope/vim-dadbod")
call minpac#add("tpope/vim-vinegar")
" call minpac#add("tpope/vim-fireplace", {"rev": "v2.1"})
call minpac#add("tpope/vim-surround")
call minpac#add("vim-scripts/paredit.vim")
call minpac#add("ludovicchabant/vim-gutentags")
" call minpac#add("adz5a/vim-hybrid-material")
call minpac#add("tpope/vim-commentary")
" call minpac#add("matze/vim-move")
call minpac#add("mxw/vim-jsx")
call minpac#add("junegunn/fzf.vim")
call minpac#add("Olical/aniseed", {"rev": "v3.3.0"})
call minpac#add("Olical/conjure", {"rev": "v4.5.0"})
call minpac#add("bakpakin/fennel.vim")
call minpac#add("franbach/miramare")
call minpac#add("neo4j-contrib/cypher-vim-syntax")
call minpac#add("hashivim/vim-terraform")
call minpac#add("tpope/vim-dispatch")

let g:dispatch_no_tmux_make=1
let g:dispatch_no_tmux_start=1

fun! OnStartVim()
  if argc () == 0
    terminal
  endif
endfun

augroup myvimrc
    autocmd VimEnter * call OnStartVim()
augroup END
