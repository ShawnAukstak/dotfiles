" debugger
nnoremap <leader>d irequire 'pry';binding.pry<Esc>

" vim-test
let g:test#runner_commands = ['rails']

" ale
let b:ale_linters = ['rubocop', 'erblint']
let b:ale_fixers = ['rubocop', 'erblint']
let b:ale_ruby_rubocop_executable = 'bin/rubocop'
let b:ale_ruby_erblint_executable = 'bin/erblint'

 " setlocal omnifunc=rubycomplete#Complete
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1

let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb",
      \        "test/integration/{}_controller_test.rb",
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb",
      \        "test/integration/{}_controller_test.rb",
      \      ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \   "test/integration/*_test.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \ }
