set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'rails.vim'
Plugin 'surround.vim'
Plugin 'Commentary.vim'
Plugin 'RRethy/vim-illuminate'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
Plugin 'ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'janko-m/vim-test'
Plugin 'mileszs/ack.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }

call vundle#end()


syntax enable
set termguicolors
colorscheme dracula

" vim-smooth-scroll settings
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

let g:airline#extensions#ale#enabled = 1 
let g:ale_linters_explicit = 1 
let g:ale_sign_column_always = 1
let g:ale_linters = { 'ruby': ['rubocop'] }
let g:ale_ruby_rubocop_executable = '/Users/shawnaukstak/github/github/bin/rubocop'

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
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" The Silver Searcher
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

let test#strategy = 'vimterminal'
let test#vim#term_position = "belowright"
let test#ruby#minitest#executable = 'bin/tt'
let test#ruby#rails#executable = 'bin/tt'
let g:test#runner_commands = ['Minitest']
map <silent> <Leader>t :TestFile<CR>
map <silent> <Leader>s :TestNearest<CR>
map <silent> <Leader>l :call TestLast<CR>

"Key bindings
let mapleader=","

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nn :NERDTreeClose<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>be :BufExplorer<CR>
nnoremap <leader>/ :Ack! -Q "
" Map F6 to :w, within iterm cmd-s to F6 in iterm
nnoremap <F6> :w<CR>

"debugger
autocmd FileType ruby nnoremap <leader>p irequire 'pry';binding.pry<Esc>

" GitCommit 50/72 formatting
" https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
augroup gitsetup
        autocmd!

        " Only set these commands up for git commits
        autocmd FileType gitcommit
                \ autocmd CursorMoved,CursorMovedI *
                        \ let &l:textwidth = line('.') == 1 ? 50 : 72
augroup end

set clipboard=unnamed " Mac OS X clipboard sharing
set number " show line number

"default tab settings
set sw=2
set softtabstop=2
set expandtab
"and invisible characters to distinguish tabs and spaces...
set list
set listchars=tab:>-,trail:·

filetype plugin indent on    " required
