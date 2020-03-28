" vim:foldmarker={{,}}:foldmethod=marker:foldlevel=0

" Vim Vundle {{
    set rtp+=~/.vim/bundle/Vundle.vim

    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'rails.vim'
    Plugin 'surround.vim'
    Plugin 'Commentary.vim'
    Plugin 'RRethy/vim-illuminate'
    Plugin 'tpope/vim-endwise'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-rhubarb' " fugitive GitHub plugin
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
" }}

" Plugins {{
    " Ale {{
        let g:airline#extensions#ale#enabled = 1
        let g:ale_linters_explicit = 1
        let g:ale_sign_column_always = 1
        let g:ale_linters = { 'ruby': ['rubocop'] }
        let g:ale_ruby_rubocop_executable = '/Users/shawnaukstak/github/github/bin/rubocop'
        let g:ale_fixers = { "*": ["remove_trailing_lines", "trim_whitespace"] }
        let g:ale_fix_on_save = 1
    " }}

    " CtrlP {{
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
    " }}

    " NerdTree {{
        let g:airline#extensions#nerdtree_status = 1
        nnoremap <Leader>nt :NERDTreeToggle<CR>
        nnoremap <Leader>nn :NERDTreeClose<CR>
        nnoremap <Leader>nf :NERDTreeFind<CR>
        nnoremap <Leader>be :BufExplorer<CR>
    " }}

    " vim-airline {{
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_section_y= ""
        let g:airline#extensions#tabline#formatter = "unique_tail_improved"
        let g:airline#extensions#tabline#show_tab_type = 0 " Disables weird arrow
        let g:airline#extensions#tabline#buffer_idx_mode = 1
        nmap <leader>1 <Plug>AirlineSelectTab1
        nmap <leader>2 <Plug>AirlineSelectTab2
        nmap <leader>3 <Plug>AirlineSelectTab3
        nmap <leader>4 <Plug>AirlineSelectTab4
        nmap <leader>5 <Plug>AirlineSelectTab5
        nmap <leader>6 <Plug>AirlineSelectTab6
        nmap <leader>7 <Plug>AirlineSelectTab7
        nmap <leader>8 <Plug>AirlineSelectTab8
        nmap <leader>9 <Plug>AirlineSelectTab9
        nmap <leader>- <Plug>AirlineSelectPrevTab
        nmap <leader>+ <Plug>AirlineSelectNextTab
    " }}

    " vim-smooth-scroll {{
        noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
        noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
        noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
        noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
    " }}

    " vim-test {{
        let test#strategy = 'vimterminal'
        let test#vim#term_position = "belowright"
        let test#ruby#minitest#executable = 'bin/tt'
        let test#ruby#rails#executable = 'bin/tt'
        let g:test#runner_commands = ['Minitest']
        map <silent> <Leader>t :TestFile<CR>
        map <silent> <Leader>s :TestNearest<CR>
        map <silent> <Leader>l :call TestLast<CR>
    " }}

    " Silver Searcher {{
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
    " }}
" }}

" UI {{
    syntax enable
    set termguicolors
    colorscheme dracula

    set splitbelow
    set splitright

    set sw=2                        " Indents are two spaces
    set softtabstop=2               " Backspace deletes indents
    set expandtab                   " Tabs are spaces

    set list                        " Show trailing whitespace
    set listchars=tab:>-,trail:·    " Show trailing whitespace

    set foldenable                  " Auto fold code
    set foldmethod=indent           " Fold code based on indents
    set foldlevelstart=10           " Most folds open by default
    set foldnestmax=10              " Max level of nested folds

    filetype plugin indent on
" }}

" Key bindings {{
    let mapleader=","

    map <leader>q :q<CR>
    nnoremap ; :

    " Splits
    map <Leader>hs :split<CR>
    map <Leader>vs :vsplit<CR>

    " ctrl + j|k|l|h navigates between splits
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " Tabs
    nnoremap <C-t>  :tabnew<CR>
    inoremap <C-t>  <Esc>:tabnew<CR>
    map <Leader>tc  :tabclose<CR>
    nmap th gT
    nmap tl gt

    " Grep
    nnoremap <leader>/ :Ack! -Q "

    nnoremap <F6> :w<CR> " Map F6 to :w, within iterm cmd-s to F6 in iterm

    " Spacebar on fold will toggle it, else default move right behavior
    nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
    vnoremap <Space> zf
" }}

" General {{
    set clipboard=unnamed " Mac OS X clipboard sharing
    " Hybrid line numbers
    set number relativenumber
    set nu rnu
" }}

" Autocmds {{
    "debugger
    autocmd FileType ruby nnoremap <leader>d irequire 'pry';binding.pry<Esc>

    " GitCommit 50/72 formatting
    " https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
    augroup gitsetup
            autocmd!

            " Only set these commands up for git commits
            autocmd FileType gitcommit
                    \ autocmd CursorMoved,CursorMovedI *
                            \ let &l:textwidth = line('.') == 1 ? 50 : 72
    augroup end
" }}
