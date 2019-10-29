" :make command to run eslint
" For this to work correctly you NEED to HAVE
" - package.json
" - lint-file script: this script must run eslint with the
"   `-f compact` to be properly parsed.
setlocal makeprg=yarn\ lint-file\ %\ \\\|\ head\ -n\ -2
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
setlocal tabstop=2 shiftwidth=2 expandtab


" make % command work with xhtml/jsx tags
if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let b:match_words = '(:),\[:\],{:},<:>,' .
        \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(/\@<!>\|$\):<\@<=/\1>'
endif

" creates an arrow expression and places the cursor on the opening parenthesis
nnoremap <Leader>ar i() => {}<Esc>7h
nnoremap <Leader>fn ifunction () {}<Esc>13h
nnoremap <Leader>afn iasync function () {}<Esc>19h
