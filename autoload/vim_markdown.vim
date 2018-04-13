let s:save_cpo = &cpo
set cpo&vim

function! s:is_itemize_line(line)
    if a:line =~ '^ *\*'
        return 1
    endif
    if a:line =~ ' *-'  " '^ *-'がなぜか上手くいかない。
        return 1
    endif
    return 0
endfunction

function! s:is_sectionize_line(line)
    if a:line =~ '^#.*'
        return 1
    endif
    return 0
endfunction

function! s:is_blank_line(line)
    if a:line =~ '^ *$'
        return 1
    endif
    return 0
endfunction

function! s:line_with_space(line)
    let l:line_without_space = substitute(a:line, ' *$', '', '')
    return substitute(l:line_without_space, '\(.*\)', '\1  ', '')
endfunction


function! vim_markdown#add_spaces()
    let i = 1
    while i <= line('$')
        let l:cur_line = getline(i)
        if s:is_itemize_line(l:cur_line) || s:is_sectionize_line(l:cur_line) || s:is_blank_line(l:cur_line)
            let i+= 1
            continue
        endif
        call setline(i, s:line_with_space(l:cur_line))
        let i += 1
    endwhile
endfunction

function! vim_markdown#remove_spaces(line)
    let i = 1
    while i <= line('$')
        let l:cur_line = getline(i)
        call setline(i, substitute(l:cur_line, ' *$', '', ''))
        let i += 1
    endwhile
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
