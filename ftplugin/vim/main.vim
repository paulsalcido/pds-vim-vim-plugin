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
setlocal foldmethod=marker
setlocal foldlevelstart=1
setlocal smartindent
setlocal autoindent
setlocal number
setlocal expandtab tabstop=4 shiftwidth=4
setlocal hlsearch incsearch
setlocal nowrap

nnoremap <buffer> <localleader>ed :call <SID>open_vim_doc()<cr>

function! s:git_root()
    return substitute(system('git rev-parse --show-toplevel'), '\n\+$', '', '')
endfunction

function! s:open_vim_doc()
    let vimdocdir = join([ <SID>git_root(), 'doc' ], '/')
    let files = split(globpath(vimdocdir, '*.txt'), '\n')
    if len(files) ># 0
        execute "normal! :vsplit " . files[0] . "\r\r"
    endif
endfunction
