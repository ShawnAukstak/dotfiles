" debugger
nnoremap <leader>d irequire 'pry';binding.pry<Esc>

" vim-test
let g:test#runner_commands = ['rails']

" ale
let b:ale_linters = ['rubocop']
let b:ale_fixers = ['rubocop']
let b:ale_ruby_rubocop_executable = '/Users/shawnaukstak/github/github/bin/rubocop'
