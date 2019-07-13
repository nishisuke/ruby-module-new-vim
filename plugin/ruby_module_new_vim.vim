scriptencoding utf-8

if exists('g:loaded_ruby_module_new_vim')
    finish
endif

let g:loaded_ruby_module_new_vim = 1

let s:save_cpo = &cpo
set cpo&vim

""""""""""""""""""""
" begin my code
"
augroup ruby_module_new_vim
	autocmd!
	autocmd BufNewFile *.rb call ruby_module_new_vim#SetNewModule()
augroup END

" end my code
""""""""""""""""""""

let &cpo = s:save_cpo
unlet s:save_cpo
