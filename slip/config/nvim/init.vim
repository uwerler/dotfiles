call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go'
Plug 'https://bitbucket.org/kisom/eink.vim.git'
Plug 'arcticicestudio/nord-vim'
Plug 'w0rp/ale'

call plug#end()

nmap <Leader>bi :PlugInstall<CR>
nmap <Leader>bu :PlugUpdate<CR>
nmap <Leader>bc :PlugClean<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set encoding=utf8
set t_Co=256
colorscheme eink

filetype plugin indent on

au BufNewFile,BufRead *.html set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
au BufNewFile,BufRead *.js set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
au BufNewFile,BufRead *.lua set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

set dir=/sec/vim/swaps
set nolist
"set lazyredraw
set mouse-=a

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" GitGutter
let g:gitgutter_realtime = 1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

nmap <silent> ,/ :let @/=""<CR>

noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>

nmap <leader>2 :set list!<CR>
nmap <leader>3 :set nu!<CR>
nmap <leader>4 :set paste!<CR>

" text & mutt files
au BufNewFile,BufRead /tmp/*mutt*,/tmp/cvs*,*.txt set noai noshowmatch
au BufNewFile,BufRead /tmp/*mutt*,/tmp/cvs*,*.txt setlocal spell spelllang=en_us

au BufNewFile,BufRead /private/var/*/*mutt* set noai noshowmatch
au BufNewFile,BufRead /private/var/*/*mutt* setlocal spell spelllang=en_us

" git commits
au BufNewFile,BufRead *.git/COMMIT_EDITMSG set noai noshowmatch
au BufNewFile,BufRead *.git/COMMIT_EDITMSG setlocal spell spelllang=en_us

"autocmd BufWritePre * %s/\s\+$//e
nmap <Leader>s :%s/\s\+$//e

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"
" Prevent various Vim features from keeping the contents of pass(1) password
" files (or any other purely temporary files) in plaintext on the system.
"
" Either append this to the end of your .vimrc, or install it as a plugin with
" a plugin manager like Tim Pope's Pathogen.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
"

" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                \ setlocal viminfo=
        augroup END
    endif
endif

