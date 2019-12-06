set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ### Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'rails.vim'
Plugin 'surround.vim'
Plugin 'Commentary.vim'
Plugin 'RRethy/vim-illuminate'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

Plugin 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 3)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#ale#enabled = 1 

Plugin 'FelikZ/ctrlp-py-matcher'

Plugin 'scrooloose/nerdtree'

Plugin 'w0rp/ale'
let g:ale_linters_explicit = 1 
let g:ale_sign_column_always = 1
let g:ale_linters = { 'ruby': ['rubocop'] }
let g:ale_ruby_rubocop_executable = '/Users/shawnaukstak/github/github/bin/rubocop'

Plugin 'ctrlp.vim'
let g:ctrlp_max_depth = 8
let g:ctrlp_max_files = 0
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|vendor\|bin\|public/assets/lib|/git-core/template/|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/log/*,*/\.git/*,*public/assets/lib/*,.irb_history,*/lib/git-core/template/*
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" Use pymatcher for ctrlp
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" The Silver Searcher
Plugin 'mileszs/ack.vim'
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Use silver search with ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plugin 'janko-m/vim-test'
let test#strategy = 'iterm'
let test#ruby#minitest#executable = 'bin/tt'
let test#ruby#rails#executable = 'bin/tt'
let g:test#runner_commands = ['Minitest']
map <silent> <Leader>t :TestFile<CR>
map <silent> <Leader>s :TestNearest<CR>
map <silent> <Leader>l :call TestLast<CR>

Plugin 'mhinz/vim-signify'

" ### Key bindings
set macmeta " Allows mapping of Meta (Option) key in MacOS - MacVIM only

"Key bindings
let mapleader=","

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nn :NERDTreeClose<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>be :BufExplorer<CR>

nnoremap <leader>/ :Ack! -Q "

" OPT + CMD + p
autocmd FileType ruby nnoremap <D-M-p> irequire 'pry';binding.pry<Esc>

" GitCommit 50/72 formatting
" https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
augroup gitsetup
        autocmd!

        " Only set these commands up for git commits
        autocmd FileType gitcommit
                \ autocmd CursorMoved,CursorMovedI *
                        \ let &l:textwidth = line('.') == 1 ? 50 : 72
augroup end

set number " show line number
set gfn=monaco:h12 " font

"default tab settings
set sw=2
set softtabstop=2
set expandtab
"and invisible characters to distinguish tabs and spaces...
set list
set listchars=tab:>-,trail:·

call vundle#end()            " required
filetype plugin indent on    " required
