echo "ftplugin/vim_markdown.vim"

if exists("g:loaded_vim_markdown")
    finish
endif
let g:loaded_vim_markdown = 1

command! -nargs=0 AddSpaces call vim_markdown#add_spaces()
command! -nargs=0 RemoveSpaces call vim_markdown#remove_spaces(getline("."))

let &cpo = s:save_cpo
unlet s:save_cpo
