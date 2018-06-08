" Basic text file settings.
" I'll assume most .txt files that I'm editing are associated with vim help.

setlocal expandtab tabstop=4 shiftwidth=4
setlocal hlsearch incsearch

setlocal textwidth=78

nnoremap <buffer> <localleader>ds :call DocumentationAddDotsSpaces()<cr>
nnoremap <buffer> <localleader>dh :call AddContentHeaderLine()<cr>

function! DocumentationAddDotsSpaces()
    let curwidth = &textwidth
    let line = getline('.')
    let curlength = strlen(line)
    let charsneeded = curwidth - curlength
    let dotsneeded = charsneeded-1
    let chartype = ' '
    let searchchar = '*'
    if line =~# '\v\|$'
        let chartype = '.'
        let searchchar = '|'
    endif
    execute 'normal! ^/\v\' . searchchar . "/\rhi " . repeat(chartype,dotsneeded) . "\<esc>"
endfunction

function! AddContentHeaderLine()
    let curwidth = &textwidth
    execute "normal! o" . repeat('=', curwidth) . "\<esc>"
endfunction
