" debugger
nnoremap <leader>d irequire 'pry';binding.pry<Esc>

" vim-test
let g:test#runner_commands = ['rails']

" ale
let b:ale_linters = ['rubocop']
let b:ale_fixers = ['rubocop']
let b:ale_ruby_rubocop_executable = '/Users/shawnaukstak/github/github/bin/rubocop'

" setlocal omnifunc=rubycomplete#Complete
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1
