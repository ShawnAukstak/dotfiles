" vim:foldmarker={{,}}:foldmethod=marker:foldlevel=0
  let mapleader=","

" Vim Vundle {{
    set rtp+=~/.vim/bundle/Vundle.vim

    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'rails.vim'
    Plugin 'Commentary.vim'
    Plugin 'RRethy/vim-illuminate'
    Plugin 'tpope/vim-dispatch'
    Plugin 'tpope/vim-endwise'
    Plugin 'tpope/vim-eunuch'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-rhubarb' " fugitive GitHub plugin
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
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
    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plugin 'junegunn/fzf.vim'
    Plugin 'mattn/emmet-vim'
    Plugin 'amadeus/vim-mjml'
    Plugin 'mileszs/ack.vim'
    Plugin 'dracula/vim', { 'name': 'dracula' }
    Plugin 'takac/vim-hardtime'
    Plugin 'JamshedVesuna/vim-markdown-preview'
    Plugin 'kana/vim-textobj-user'
    Plugin 'nelstrom/vim-textobj-rubyblock'
    Plugin 'leafgarland/typescript-vim'
    Plugin 'bkad/CamelCaseMotion'
    Plugin 'luochen1990/rainbow'
    Plugin 'ycm-core/YouCompleteMe'
    Plugin 'nathanaelkane/vim-indent-guides'

    call vundle#end()
" }}

" Plugins {{
    " Ale {{
        let g:airline#extensions#ale#enabled = 1
        let g:ale_linters_explicit = 1
        let g:ale_sign_column_always = 1
        let g:ale_fixers = { "*": ["remove_trailing_lines", "trim_whitespace"] }
        let g:ale_fix_on_save = 0

        nnoremap <leader>f :ALEFix<CR>
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
        let g:ctrlp_use_caching = 0
        let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
        let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
    " }}

    " Copilot {{
        let g:copilot_node_command = "/opt/homebrew/opt/node@16/bin/node""
    " }}

    " emmet-vim {{
        let g:user_emmet_leader_key='<C-E>'
    " }}

    " NerdTree {{
        let NERDTreeShowHidden=1
        let NERDTreeRespectWildIgnore=1
        let g:airline#extensions#nerdtree_status = 1
        nnoremap <Bslash>nt :NERDTreeToggle<CR>
        nnoremap <Bslash>nn :NERDTreeClose<CR>
        nnoremap <Bslash>nf :NERDTreeFind<CR>
        nnoremap <Bslash>be :BufExplorer<CR>
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

    " vim-hardtime {{
        let g:hardtime_default_on = 1
        let g:hardtime_maxcount = 4
        let g:hardtime_timeout = 500
        let g:hardtime_showmsg = 1
    " }}

    " vim-markdown-preview {{
        let vim_markdown_preview_github=1
        let vim_markdown_preview_hotkey='<C-m>'
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
        map <silent> <Bslash>t :TestFile<CR>
        map <silent> <Bslash>s :TestNearest<CR>
        map <silent> <Bslash>l :call TestLast<CR>
    " }}

    " vim-textobj-rubyblock {{
        runtime macros/matchit.vim
    " }}

    " Silver Searcher {{
        if executable('ag')
          " Use ag over grep
          set grepprg=ag\ --nogroup\ --nocolor

          " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
          let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        endif

        " Use silver search with ack
        if executable('ag')
          let g:ackprg = 'ag --vimgrep'
        endif
    " }}

    " CamelCaseMotion {{
        let g:camelcasemotion_key = '<leader>'
    " }}

    " Rainbow Parenthesis Improved {{
        let g:rainbow_active = 0
    " }}

    " YouCompleteMe {{
        map <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
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
    map <leader>q :q<CR>

    " Splits
    map <Leader>hs :split<CR>
    map <Leader>vs :vsplit<CR>

    " ctrl + j|k|l|h navigates between splits
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    tnoremap <C-K> <C-W><C-K>
    tnoremap <C-L> <C-W><C-L>
    tnoremap <C-H> <C-W><C-H>

    " Tabs
    nnoremap <C-t>  :tabnew<CR>
    inoremap <C-t>  <Esc>:tabnew<CR>
    map <Leader>tc  :tabclose<CR>
    nmap th gT
    nmap tl gt
    nnoremap <Leader>te <C-W>T

    map <Leader>hi :History<CR>

    " Grep
    nnoremap <leader>/ :Ack! --ignore-dir "public/packs" --ignore-dir "public/packs-test" --ignore-dir "log/" --ignore-dir "tmp/" --ignore-dir "venv/" -Q "

    " Map F6 to :update, within iterm cmd-s to F6 in iterm
    nnoremap <F6> :update<CR> <Esc>
    inoremap <F6> <Esc>:update<cr>gi <Esc>

    " Spacebar on fold will toggle it, else default move right behavior
    nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
    vnoremap <Space> zf
" }}

" General {{
    set clipboard=unnamed " Mac OS X clipboard sharing
    " Hybrid line numbers
    set number relativenumber
    set nu rnu

    set re=1 "force old regex engine for ctrlp ruby speed https://stackoverflow.com/a/16920294/789447
    set bs=2 "enable backspace

    " load project .vimrc
    set exrc
    set secure
" }}

" Autocmds {{
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

" Load untracked vim files
try
  source ~/.vim/projects.vim
catch
  " No such file? No problem; just ignore it.
endtry
