scriptencoding utf-8

if !exists('g:loaded_ruby_module_new_vim')
    finish
endif
let g:loaded_ruby_module_new_vim = 1

let s:save_cpo = &cpo
set cpo&vim

""""""""""""""""""""
" begin my func

fun ruby_module_new_vim#SetNewModule()
  let l:path = expand('%')
  if match(l:path, 'lib/') != 0
    return
  endif
  let l:path = strcharpart(l:path, 4)
  let l:list = matchlist(l:path, '\v([0-9a-z_/]+)\.rb')
  call setline('.', '# frozen_string_literal: true')

  " insert balnk line
  call append(1, '')

  let l:module_num = 0

  let l:module_nesting = map(split(l:list[1], '/'), function('ruby_module_new_vim#PascalCase'))
  for module in l:module_nesting
    let l:indention = ''
    while strlen(l:indention) < l:module_num * 2
      let l:indention = l:indention.'  '
    endwhile

    call append(l:module_num + 2, [l:indention.'module '.l:module, l:indention.'end'])
    let l:module_num = l:module_num + 1
  endfor
endfun

func ruby_module_new_vim#PascalCase(key, val)
  return join(map(split(a:val, '_'), function('ruby_module_new_vim#FirstUpper')), '')
endfunc

func ruby_module_new_vim#FirstUpper(key, val)
  return substitute(a:val, '^\l', '\u&', '')
endfunc

" end my func
""""""""""""""""""""

let &cpo = s:save_cpo
unlet s:save_cpo
