" Basic settings for editing vim files.

iabbrev <buffer> auc autocmd
iabbrev <buffer> ags augroup
iabbrev <buffer> age augroup END
iabbrev <buffer> fty FileType
iabbrev <buffer> iab iabbrev
iabbrev <buffer> bfr <buffer>
iabbrev <buffer> setl setlocal
iabbrev <buffer> func function
iabbrev <buffer> endf endfunction
iabbrev <buffer> eno execute "normal!"
iabbrev <buffer> elsif elseif
iabbrev <buffer> nnmap nnoremap
iabbrev <buffer> lol <localleader>
setlocal foldmethod=marker
setlocal foldlevelstart=1
setlocal smartindent
setlocal autoindent
setlocal number
setlocal expandtab tabstop=4 shiftwidth=4
setlocal hlsearch incsearch
setlocal nowrap

nnoremap <buffer> <localleader>ed :call <SID>open_vim_doc()<cr>
nnoremap <buffer> <localleader>ac :execute 'normal! Icall '<cr>
nnoremap <buffer> <localleader>al :execute 'normal! Ilet '<cr>
nnoremap <buffer> <localleader>nf :call pvtemplate#main#readtemplate('function.vim')<cr>
nnoremap <buffer> <localleader>nn :call pvtemplate#main#readtemplate('nnoremap.vim')<cr>

function! s:open_vim_doc()
    let vimdocdir = join([ MyGitRoot(), 'doc' ], '/')
    let files = split(globpath(vimdocdir, '*.txt'), '\n')
    if len(files) ># 0
        execute "normal! :vsplit " . files[0] . "\r\r"
    endif
endfunction
