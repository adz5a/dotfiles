"Load plugins
set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on

"vim-move configuration
"this allows to use <C-j> | <C-k> to move lines down / up
let g:move_key_modifier = "C"

let g:javascript_plugin_jsdoc = 1 "vim-javascript enable JSDOC highlightning
let g:jsx_ext_required = 0

"PATH CONFIGURATION
set path=$PWD/**
set wildignore+=**/node_modules/** "plz don't :find inside the node_modules
set wildignore+=**/out/**
set wildignore+=**/dist/**
set wildignore+=**/build/**
set wildignore+=**/.git/objects/**


set tags+=./.git/tags

"GENERAL EDITOR CONFIG
set t_Co=256
set cursorline
set hlsearch
set tabstop=4 shiftwidth=4 expandtab
set encoding=utf-8
colorscheme ron
set number
set relativenumber
set scrolloff=0
set showcmd " displays current command in operator pending mode
            " this could slow down vim
set virtualedit="block" " allow to position the cursor anywhere
                        " in visual block mode

" Statusline
" https://stackoverflow.com/questions/5547943/display-number-of-current-buffer
set laststatus=2                             " always show statusbar
set statusline=
set statusline+=%-10.3n\                     " buffer number
set statusline+=%{fugitive#statusline()}     " current git status
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

fun! RefreshStatusLineColor ()
    " display status line with red font
    hi StatusLine ctermfg=1                      
endfun
call RefreshStatusLineColor()
command! RefreshStatusLine call RefreshStatusLineColor()

"enhance vim responsiveness when pressing ESC
set timeoutlen=500 ttimeoutlen=0

"does not create .swp file
set noswapfile

"general text formatting
set textwidth=80
set nowrap


" for GUI line height
set linespace=10

"removes the netrws header when using
":Explore commands
" Disabled for the moment as vim-vinegar is handling netrw for me
" let g:netrw_banner=0
" let g:netrw_liststyle=3

"puts the mouse in command line mode effectively disabling it
set mouse=c

set pastetoggle=<F2>

"open vimgrep in quickfix list
"http://stackoverflow.com/questions/39009792/vimgrep-pattern-and-immediately-open-quickfix-in-split-mode

augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* cwindow
    "set sql syntax color for dbout files. used by vim-dadbod
    autocmd BufNewFile,BufRead *.dbout set filetype=sql
augroup END



"see overwrite vim-sensible defaults
set listchars=nbsp:☠,tab:▲\ ,eol:¬
set list

""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""


" MAPPINGS

let mapleader=" "
"disables direction keys
"in insertion modes
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

"mapping for resizing splits
map <Left> :vertical resize -5<CR>
map <Up> :resize +5<CR>
map <Right> :vertical resize +5<CR>
map <Down> :resize -5<CR>

"mapping to move around splits
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
map <Leader>h <C-w>h

"remap gf to work without using the path option
"<cfile> is the filename under the cursor
map <Leader>gf :e <cfile><CR>

"on cursor, creates a line below and upside
nnoremap <Leader>O i<CR><ESC>O<ESC>o<ESC>O

"on cursor, add a CR and creates a line,
"used when creating objects / arrays
nnoremap <Leader>o i<CR><ESC>O

nnoremap <Leader>r :call ToggleScrollOffset()<CR>

function! ToggleScrollOffset()
  if &scrolloff > 10
    set scrolloff=0
  else
    set scrolloff=500
  endif
endfunction


"reformat current block & whole file
nnoremap <Leader>= =i}
nnoremap <Leader>== gg=G

"copy
nnoremap <Leader>w yiw

"fold block (between curly braces)
nnoremap <Leader>f zfi}

"remove trailing spaces
"for the current line
noremap <silent> <Leader>m :%s/\s*$/<CR>:%s/\%u00a0/ /g<CR>:noh<CR><C-o>

"http://vim.wikia.com/wiki/Jumping_to_the_start_and_end_of_a_code_block
"go to start of current block
noremap <Leader>b [{
noremap <Leader>B [{%

"go to start of parenthesis
noremap <silent> <Leader>p [(<ESC>%
noremap <silent> <Leader>P )]<ESC>

noremap <silent> <Leader>v :Vex<CR>
noremap <silent> <Leader>V :vs<CR>
noremap <silent> <Leader>e :Ex<CR>

"Yank
noremap <silent> Y y$

"tabs
"put current buffer into its own tab
noremap <silent> <Leader>t :tab split<CR>
"close current tab (does not close buffers)
noremap <silent> <Leader>tq :tabclose<CR>
"creates a new tab
noremap <silent> <Leader>n :tabnew<CR>:Ex<CR>
noremap <silent> <Leader>L :tabnext<CR>
noremap <silent> <Leader>H :tabprevious<CR>
"navigate quickfix list
noremap <silent> <Leader>K :cprev<CR>
noremap <silent> <Leader>J :cnext<CR>

"open command list
noremap <silent> <Leader>q q:
noremap <silent> <Leader>q? q?
noremap <silent> <Leader>q/ q/

"%
noremap <silent> <Leader>ù %

"GO FUGITIVE
noremap <Leader>d :Gvdiff<CR>
noremap <Leader>D :Gvdiff HEAD<CR>
noremap <Leader>s :Gstatus<CR>
noremap <Leader>S :tabnew<CR>:Gstatus<CR>

"Toggle listchar
noremap <Leader>c :set list<CR>
noremap <Leader>C :set nolist<CR>

"Commands
:command! Standup Glog -1 --
" END MAPPINGS

" Remove autocmd when using grep to speed things up
fun! FastGrep (...)
    let l:current_filetype = &filetype
    let l:mappings = [ "php", "js", "vim", "css", "scss", "twig" ]
    let l:searchpath = ""

    if a:0 == 0
        echo "Please specify a pattern to match"
        return ""
    elseif a:0 == 1
        let l:searchpath = "**/*." . l:current_filetype
    else
        for ft in l:mappings
            " case insensitive equality comparison
            if a:2 ==? ft
                let l:searchpath = "**/*." . ft
            endif
        endfor

        if l:searchpath == ""
            let l:searchpath = a:2
        endif
    endif
    " echo "noautocmd vim /" . a:1 . "/ " . l:searchpath
    exe "noautocmd vim /" . a:1 . "/ " . l:searchpath
    exe "e"
    exe "copen"
endfun

command! -nargs=* Vim call FastGrep(<f-args>)

" find files and populate the quickfix list
fun! FindFiles(filename)
    let error_file = tempname()
    silent! exe '!find . -not \( -path "'. join(split(&wildignore, ","), '" -o -path "') .'" \)| grep "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
    set errorformat=%f:%l:%m
    exe "cfile ". error_file
    copen
    redraw!
endfun
command! -nargs=1 Find call FindFiles(<q-args>)

" Wrapper around Glog
" This Command is provided by vim-fugitive which
" should be installed
fun! GitShow(hash)
    exe "Glog " . a:hash . "~..." . a:hash . " --"
endfun
command! -nargs=1 Gshow call GitShow(<q-args>)

function! GitSince (ref)

    exe "Git! ls " . a:ref . "..HEAD"

endfunction
" called with 1 quoted arg
command! -nargs=1 Gsince call GitSince(<q-args>)

" display the "context" around a given pattern in the current
" file using :global and :z# command
function! ListContext (...)
    " will display five lines centered around the matched line
    " separated by ==============
    let fieldview = 5 "number of lines printed per match, use an odd number to have it centered
    let pattern = a:000

    let last_item = pattern[-1]

    " if last arg is a number, use it a fieldview
    " and slice the pattern array
    if and(len(pattern) > 1, last_item =~ '^\d\+$')
        let fieldview = last_item 
        let pattern = pattern[:-2]
    endif

    exe "global/" . join(pattern, " ") . "/z#.". fieldview ." | echo \"===============\""
endfunction
command! -nargs=+ Context call ListContext(<f-args>)

" Will select the tags for the symbol under the cursor
function! SelectTags ()
    let l:current_word = expand("<cword>")
    exe "tselect " . l:current_word
endfunction

nnoremap <Leader>a :call SelectTags() <CR>

function! GitBranch (...)

    exe "Git! branch " . join(a:000, " ")

endfunction
command! -nargs=1 Gbranch call GitBranch(<f-args>)
