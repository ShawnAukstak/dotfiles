
" vim:foldmarker={{,}}:foldmethod=marker:foldlevel=0
let b:ale_linters = ['rubocop']
let b:ale_ruby_rubocop_executable = '/Users/shawnaukstak/github/github/bin/rubocop'

" debugger
nnoremap <leader>d irequire 'pry';binding.pry<Esc>
