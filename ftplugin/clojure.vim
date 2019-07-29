" Mappings
nnoremap <buffer> <Leader>a :argadd<CR>
nnoremap <buffer> <Leader>A :argdel %<CR>
nnoremap <buffer> <Leader>nn :n<CR>
nnoremap <buffer> <Leader>NN :N<CR>
nnoremap <buffer> <Leader>ee :%Eval<CR>
vnoremap <buffer> <Leader>ee :'<,'>Eval<CR>

" Example of gutentags configuration
" let g:gutentags_ctags_exclude = ['resources', 'doc', 'package-lock.json', 'yarn.lock', '**/*.js', '**/*.css', '**/.shadow-cljs/**', '**/*.md', '**/*.json']
