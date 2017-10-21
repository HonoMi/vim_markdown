let s:save_cpo = &cpo
set cpo&vim

function! vim_markdown#add_spaces()
    let i = 1
    while i <= line('$')
        let l:cur_line = getline(i)
        if l:cur_line !~ '^[a-zA-Z].*'
            let i+= 1
            continue
        endif

        let l:ret_line = substitute(l:cur_line, ' *$', '', '')
        let l:ret_line = substitute(l:ret_line, '\(.*\)', '\1  ', '')
        call setline(i, l:ret_line)
        let i += 1
    endwhile
endfunction

function! vim_markdown#remove_spaces(line)
    let i = 1
    while i <= line('$')
        let l:cur_line = getline(i)
        if l:cur_line !~ '^[a-zA-Z].*'
            let i+= 1
            continue
        endif

        let l:ret_line = substitute(l:cur_line, ' *$', '', '')
        call setline(i, l:ret_line)
        let i += 1
    endwhile
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
