"Load plugins
set nocompatible
if has('nivm') == 0
    execute pathogen#infect()
endif

syntax on
filetype plugin indent on

"vim-move configuration
"this allows to use <C-j> | <C-k> to move lines down / up
let g:move_key_modifier = "C"

let g:javascript_plugin_jsdoc = 1 "vim-javascript enable JSDOC highlightning
let g:jsx_ext_required = 0

"PATH CONFIGURATION
" set path to file directory and
" working directory
set path=.,,
" These are generic folders where you usually don't want to  search
set wildignore+=**/node_modules/**
set wildignore+=**/out/**
set wildignore+=**/dist/**
set wildignore+=**/build/**
set wildignore+=**/.git/objects/**

" key to use when you want to use Tab expansion programmatically
set wildcharm=<C-z>


set tags+=./.git/tags

"GENERAL EDITOR CONFIG
set t_Co=256
" set cursorline
set hlsearch
set tabstop=4 shiftwidth=4 expandtab
set encoding=utf-8
colorscheme hybrid_material
set background=dark
set number
set relativenumber
set showcmd " displays current command in operator pending mode
            " this could slow down vim
set virtualedit="block" " allow to position the cursor anywhere
                        " in visual block mode

" Statusline
" https://stackoverflow.com/questions/5547943/display-number-of-current-buffer
set laststatus=2                             " always show statusbar
set statusline=                              " reset statusline
set statusline+=%-10.4n\                     " buffer number
set statusline+=%{fugitive#statusline()}     " current git status
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

set errorformat=%f:%l:%m

fun! RefreshStatusLineColor ()
    " display status line with red font
    hi StatusLine ctermfg=1                      
endfun
" call RefreshStatusLineColor()
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

" Use a global variable to track the last visited tab
if !exists("g:last_tab")
    let g:last_tab = 1
endif
augroup myvimrc
    autocmd!
    "open vimgrep in quickfix list
    "http://stackoverflow.com/questions/39009792/vimgrep-pattern-and-immediately-open-quickfix-in-split-mode
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
    autocmd VimEnter * if argc () == 0 | Explore! | endif
    " update the var each time a tab is left
    autocmd TabLeave * let g:tab_last=tabpagenr()
augroup END


set scrolloff=5


"see overwrite vim-sensible defaults
set listchars=nbsp:☠,tab:▲\ ,eol:¬,trail:-
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
    set scrolloff=1
  else
    set scrolloff=500
  endif
endfunction

" use the same logic as in vimium to navigate tabs:
" vim <nth>gt goes to the nth tab
" vimium <nth>gt goes to the nth tab to the right
" idem for gT
" TODO: this works using the fact that the @ command will evaluate 'gt' nth
" time, however this makes vim navigate to all intermediary tabs, which makes
" the global g:last_tab incorrect. A function calculate the number of jumps to
" do and programmatically navigate to the targeted tab.
nnoremap gt @='gt'<CR>
nnoremap gT @='gT'<CR>
nnoremap g$ :tablast<CR>
nnoremap g0 :tabfirst<CR>
" go to last visited tab
" this will not work unless the TODO above is done.
nnoremap g^ :exe "tabnext " . g:last_tab<CR>

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

noremap <silent> <Leader>e :e!<CR>
noremap <silent> <Leader>R :redraw!<CR>

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
noremap <silent> <Leader>? q?
noremap <silent> <Leader>/ q/
noremap <silent> q: <NOP>

"write file
noremap <Leader>w :w<CR>
noremap <Leader>W :Gwrite<CR>

"spell checking
" When cursor is on a mispelled word, this will replace it
" with the first proposition.
noremap <silent> <Leader>z 1z=

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

if executable('rg')
    let g:GREP_PROGRAM = "rg"
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m " Not handling column atm
else 
    let g:GREP_PROGRAM = "grep"
endif

fun! FastGrep (count, pattern,...)
    let l:quote = "'"
    let l:current_filetype = &filetype
    let l:mappings = [ 'php', 'js', 'vim', 'css', 'scss', 'twig', 'html', 'sql', '*', 'md' ]
    let l:searchoptions = ""

    " handle the different grep program
    if g:GREP_PROGRAM ==? "grep"
        let l:include = "--include"
    elseif g:GREP_PROGRAM ==? "rg"
        let l:include = "--glob"
    endif

    " Find searchoptions depending on number of arguments which the function was
    " called :
    " 1 argument : assume you want to search on the current filetype
    " 2 argument : use it to determine the filetype
    if a:0 == 0
        " If no path are specified, check if a range was specified and if it was
        " % (whole file). If true then search only current file
        if a:count == line('$')
            let l:searchoptions = l:include . " " . l:quote . expand('%') . l:quote
        else
        " If no path are specified search only for the current filetype
        " Use the * option to search in every file
            let l:searchoptions = l:include . " " . l:quote . "**/*."  . l:current_filetype . l:quote
        endif
    else
        " If a path is specified, search if it is in the 'mappings' list
        for ft in l:mappings
            " case insensitive equality comparison
            if a:1 ==? ft
                let l:searchoptions = l:include . " " . l:quote . "**/*." . ft . l:quote
            endif
        endfor

        " If not in the 'mappings' then just use the second argument as it
        " was given.
        if l:searchoptions == ""
            let l:searchoptions = l:include . " " . l:quote . a:1 . l:quote
        endif
    endif

    let l:command = strtrans(&grepprg)
    let l:execommand = join(['silent', ' ', 'grep', ' ', l:searchoptions, ' ', l:quote, a:pattern, l:quote], '')
    exe l:execommand
    redraw!
endfun

command! -range -nargs=* Grep call FastGrep(<count>, <f-args>)

" find files and populate the quickfix list
fun! FindFiles(filename)
    let error_file = tempname()
    setlocal errorformat=%f:%l:%m
    silent! exe '!find . -not \( -path "'. join(split(&wildignore, ","), '" -o -path "') .'" \)| grep "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
    exe "cfile ". error_file
    copen
    redraw!
endfun
command! -nargs=1 Find call FindFiles(<q-args>)

" Wrapper around Glog
" This Command is provided by vim-fugitive which
" should be installed
fun! GitShow(hash)
    exe "Git! show --abbrev --name-only " . a:hash
endfun
command! -nargs=1 Gshow call GitShow(<q-args>)

function! GitSince (ref)

    exe "Git! ls " . a:ref . "..HEAD"

endfunction
" called with 1 quoted arg
command! -nargs=1 Gsince call GitSince(<q-args>)

" display the "context" around a given pattern in the current
" file using :global and :z# command
function! ListContext (fieldview, ...)
    " will display five lines centered around the matched line
    " separated by ==============
    let pattern = a:000
    exe "global/" . join(pattern, " ") . "/z#.". a:fieldview ." | echo \"===============\""
endfunction
command! -count=5 -nargs=+ Context call ListContext(<count>, <f-args>)

" Will select the tags for the symbol under the cursor
function! SelectTags (split)
    let l:current_word = expand("<cword>")
    if a:split > 0
        exe "stselect " . l:current_word
    else
        exe "tselect " . l:current_word
    endif
endfunction

function! GitBranch (...)

    exe "Git! branch " . join(a:000, " ")

endfunction
command! -nargs=* Gbranch call GitBranch(<f-args>)

command! -nargs=0 W Grwite

command! -nargs=0 S call system("xclip -sel clip -i", getreg("+"))

function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

" copy current filepath (value of % register) to + register for clipboard use
function! CopyFilepath ()
    let @+ = @%
    let @" = @%
endfunction
nnoremap <Leader>cp :call CopyFilepath()<CR>

" Set wrap options when arg is present, else removes them
function! ToggleWrap(bang)
    if empty(a:bang)
        set wrap linebreak breakindent
    else
        set nowrap nolinebreak nobreakindent
    endif
endfunction

command! -bang Wrap call ToggleWrap(<bang>0)<CR>

" Git blame mappings
" The first is to run Gblame, the second to run it without looking for changes
" that were only whitespace (-M) or moves (-m)
nnoremap <Leader>b :Gblame<CR>
nnoremap <Leader>B :Gblame -M -w<CR>
vnoremap <Leader>b :'<,'>Gblame<CR>
vnoremap <Leader>B :'<,'>Gblame -M -w<CR>


" Toggle the colorcolumn option. A global cc variable can be set to control the
" value of the colorcolumn.
let g:cc=80
function! ToggleColorcolumn ()
    let cc = &colorcolumn
    if cc == 0
        let &l:colorcolumn=g:cc
    else
        setlocal colorcolumn=
    endif
endfunction
nnoremap <Leader>cc :call ToggleColorcolumn()<CR>

" In visual mode the :DB command executes whatever is selected but it makes use
" of the command mode. This mapping allows to use the `db` command behind the
" Leader.
" In normal mode just replay :DB with the last visual selection. Subject to
" improvements.
vnoremap <Leader>db :DB<CR>
nnoremap <Leader>db gv:DB<CR>

nnoremap <C-w>t :term<CR>

nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wl :wincmd l<CR>

nnoremap <Leader>wx :wincmd x<CR>
nnoremap <Leader>wq :wincmd q<CR>
nnoremap <Leader>wn :wincmd n<CR>
nnoremap <Leader>ws :wincmd s<CR>

nnoremap <Leader>wH :wincmd H<CR>
nnoremap <Leader>wJ :wincmd J<CR>

nnoremap <Leader>wT :wincmd T<CR>

nnoremap <Leader>w= :wincmd =<CR>
